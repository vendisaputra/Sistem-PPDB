<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tentang extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
        $this->load->model('modalmain','m_main');
        if($this->session->userdata('status') != "loginadmin" AND !$this->session->userdata('username')){
            redirect(base_url("_admin/aut_login/"));
        }
		
	}
    public function index(){
        $data = array(
                'title' => 'Form Admin',
                'visi'  =>  $this->m_main->getDatasortir('sekolah',array('id_s' => 1))->row(),
                'misi'  =>  $this->m_main->getDatasortir('sekolah',array('id_s' => 2))->row(),
                'message' => $this->session->userdata('message'),
                'username' => $this->session->userdata('username'),
            );
        $this->parser->parse("tentang/vimi.tpl",$data);
    }
    public function updatedata(){
        $data = array(
            'value'    => $this->input->post("vis")
            );
        $this->m_main->updateData('sekolah',$data,array('id_s' => 1));
        //echo json_encode(array("status" => TRUE));
        $this->session->set_flashdata('message', 'Data telah terupdate');
        //echo "<script>alert('data berhasil diubah');window.history.go(-1);</script>";
        redirect(base_url('_admin/tentang/'),'refresh');
    }
    public function updatedata_dua(){
        $data = array(
            'value'    => $this->input->post("misi")
            );
        $this->m_main->updateData('sekolah',$data,array('id_s' => 2));
        //echo json_encode(array("status" => TRUE));
        $this->session->set_flashdata('message', 'Data telah terupdate');
        //echo "<script>alert('data berhasil diubah');window.history.go(-1);</script>";
        redirect(base_url('_admin/tentang/'),'refresh');
    }
    public function getT(){
        $data = array(
                'title'    => 'Tentang Sekolah',
                'tentang'  =>  $this->m_main->getDatasortir('sekolah',array('id_s' => 3))->row(),
                'message' => $this->session->userdata('message'),
                'username' => $this->session->userdata('username'),
            );
        $this->parser->parse("tentang/tentang.tpl",$data);
    }
    public function updatedata_tt(){
        $data = array(
            'value'    => $this->input->post("tt")
            );
        $this->m_main->updateData('sekolah',$data,array('id_s' => 3));
        //echo json_encode(array("status" => TRUE));
        //echo "<script>alert('data berhasil diubah');window.history.go(-1);</script>";
        $this->session->set_flashdata('message', 'anda berhasil mengupdate data');
        redirect(base_url('_admin/tentang/getT'),'refresh');
    }
    public function setting(){
        $data = array(
                'title'  => 'Form Setting',
                'slider' => tm_biaya('slider')->result(),
                'message' => $this->session->userdata('message'),
                'username' => $this->session->userdata('username'),
            );
        $this->parser->parse("tentang/setting.tpl",$data);
    }
    public function up_facebook(){
        $data = array(
            'value'    => $this->input->post("facebook")
            );
        $this->m_main->updateData('sekolah',$data,array('id_s' => 4));
        echo "<script>alert('data berhasil diubah');window.history.go(-1);</script>";
    }
    public function up_instragram(){
        $data = array(
            'value'    => $this->input->post("input_dua")
            );
        $this->m_main->updateData('sekolah',$data,array('id_s' => 5));
        echo "<script>alert('data berhasil diubah');window.history.go(-1);</script>";
    }
    public function up_youtube(){
        $data = array(
            'value'    => $this->input->post("input_tiga")
            );
        $this->m_main->updateData('sekolah',$data,array('id_s' => 6));
        echo "<script>alert('data berhasil diubah');window.history.go(-1);</script>";
    }
    public function up_nisn(){
        $data = array(
            'value'    => $this->input->post("input_empat")
            );
        $this->m_main->updateData('sekolah',$data,array('id_s' => 11));
        echo "<script>alert('data berhasil diubah');window.history.go(-1);</script>";
    }
    public function slider(){
        //$this->form_validation->set_rules('avatar-2', 'Foto', 'trim|required');
        $this->form_validation->set_rules('content', 'Data', 'trim|required');
        $this->form_validation->set_error_delimiters('<div class="text-danger">', '</div>');
        if ($this->form_validation->run() == FALSE){
            $data = array(
                    'title' => 'Setting Slider',
                    'username' => $this->session->userdata('username'),
                );
            $this->parser->parse("tentang/slider.tpl",$data);
        }else{
            $this->add_slider();       
        }
    }
    public function show_slider_update(){
        $id = $this->uri->segment(4);
        $this->form_validation->set_rules('content', 'Data', 'trim|required');
        $this->form_validation->set_error_delimiters('<div class="text-danger">', '</div>');
        if ($this->form_validation->run() == FALSE){
            $data = array(
                    'title'   => 'Setting Slider',
                    'slider'  =>  $this->m_main->getDatasortir('setting',array('id_setting' => $id, 'tittle' => 'slider'))->row(),
                    'username' => $this->session->userdata('username'),
                );
            $this->parser->parse("tentang/slider_update.tpl",$data);
        }else{
            $this->update_slider();       
        }
    }
    public function add_slider(){
        $data = array(
            'tittle'      => 'slider',
            'content'     => $this->input->post("content"),
            );
        $this->m_main->addData('setting',$data);
        $get_content = $this->m_main->getDatasortir('setting',$data);
        $id_setting = $get_content->row()->id_setting;
        $config=[
                    'upload_path'   => $this->m_main->mdir('assets/user/img/slider/',$id_setting),
                    'allowed_types' => 'gif|jpg|png',
                    'max_size'      => 10000,
                ];
        $this->load->library('upload', $config);
        if (!$this->upload->do_upload('avatar-2')){
            print_r($this->upload->display_errors());
            //echo json_encode(array("status" => FALSE));
        }else{
            $this->image
                ->load($this->upload->data('full_path'))
                ->resize_crop(640, 426)
                ->set_jpeg_quality(100)
                ->save_pa($prepend = "", "-thumb", FALSE);
        }
        $this->session->set_flashdata('message', 'anda berhasil menginput data');
        redirect(base_url('_admin/tentang/setting'),'refresh');
    }
    public function update_slider(){
        $id_setting = $this->input->post("id_setting");
        $data = array(
            'content'     => $this->input->post("content"),
            );
        $this->m_main->updateData('setting',$data,array('id_setting' => $id_setting));
        if (!empty($_FILES['avatar-2']['name'])) {
            $this->m_main->remdir('assets/user/img/slider/',$id_setting);
            $config=[
                    'upload_path'   => $this->m_main->mdir('assets/user/img/slider/',$id_setting),
                    'allowed_types' => 'gif|jpg|png',
                    'max_size'      => 10000,
                ];
            $this->load->library('upload', $config);
            if (!$this->upload->do_upload('avatar-2')){
                print_r($this->upload->display_errors());
                //echo json_encode(array("status" => FALSE));
            }else{
                $this->image
                    ->load($this->upload->data('full_path'))
                    ->resize_crop(640, 426)
                    ->set_jpeg_quality(100)
                    ->save_pa($prepend = "", "-thumb", FALSE);
            }
        }
        $this->session->set_flashdata('message', 'anda berhasil mengupdate data');
        redirect(base_url('_admin/tentang/setting'),'refresh');
    }
    public function hapusdata(){
        $id = $this->input->post("id");
        $where = array('id_setting' => $id);
        $cek = $this->m_main->deleteData('setting', $where);
        $this->m_main->remdir('assets/user/img/slider/',$id);
        if ($cek>0) {
            echo json_encode(array("status" => TRUE));
        }else{
            echo json_encode(array("status" => FALSE));
        }
    }
    public function more(){
        $data = array(
                'title' => 'Form update kop',
                'logo'  =>  $this->m_main->getDatasortir('sekolah',array('header' => 'logo'))->row(),
                'message' => $this->session->userdata('message'),
                'username' => $this->session->userdata('username'),
            );
        $this->parser->parse("tentang/kps.tpl",$data);
    }
    public function update_kop(){
        $id_setting = $this->uri->segment(4);
        $data = array(
            'value'     => $this->input->post("nsekolah"),
            );
        $this->m_main->updateData('sekolah',$data,array('header' => 'logo'));
        if (!empty($_FILES['file']['name'])) {
            $this->m_main->remdir('assets/user/img/kop/',$id_setting);
            $config=[
                    'upload_path'   => $this->m_main->mdir('assets/user/img/kop/',$id_setting),
                    'allowed_types' => 'gif|jpg|png',
                    'max_size'      => 10000,
                ];
            $this->load->library('upload', $config);
            if (!$this->upload->do_upload('file')){
                print_r($this->upload->display_errors());
                //echo json_encode(array("status" => FALSE));
            }else{
                $this->image
                    ->load($this->upload->data('full_path'))
                    ->resize(282, 70)
                    ->set_jpeg_quality(100)
                    ->save_pa($prepend = "", "-thumb", FALSE);
            }
        }
        $this->session->set_flashdata('message', 'anda berhasil mengupdate data');
        redirect(base_url('_admin/tentang/more'),'refresh');
    }
    public function ksekolah(){
        $data = array(
                'title' => 'Form update kop',
                'ksekolah'  =>  $this->m_main->getDatasortir('sekolah',array('header' => 'kepala sekolah'))->row(),
                'message' => $this->session->userdata('message'),
                'username' => $this->session->userdata('username'),
            );
        $this->parser->parse("tentang/ksekolah.tpl",$data);
    }
    public function ksekolah_post(){
        $id_setting = $this->uri->segment(4);
        // $data = array(
        //     'value'     => $this->input->post("nsekolah"),
        //     );
        // $this->m_main->updateData('sekolah',$data,array('header' => 'kepala sekolah'));
        if (!empty($_FILES['foto']['name'])) {
            $this->m_main->remdir('assets/user/img/kop/',$id_setting);
            $config=[
                    'upload_path'   => $this->m_main->mdir('assets/user/img/kop/',$id_setting),
                    'allowed_types' => 'gif|jpg|png',
                    'max_size'      => 10000,
                ];
            $this->load->library('upload', $config);
            if (!$this->upload->do_upload('foto')){
                print_r($this->upload->display_errors());
                //echo json_encode(array("status" => FALSE));
            }else{
                $this->image
                    ->load($this->upload->data('full_path'))
                    ->resize_crop(300, 250)
                    ->set_jpeg_quality(100)
                    ->save_pa($prepend = "", "-thumb", FALSE);
            }
        }
        $this->session->set_flashdata('message', 'anda berhasil mengupdate data');
        redirect(base_url('_admin/tentang/ksekolah'),'refresh');
    }
	public function alamatpost(){
        $this->form_validation->set_rules('content', 'Data', 'trim|required');
        $this->form_validation->set_error_delimiters('<div class="text-danger">', '</div>');
        if ($this->form_validation->run() == FALSE){
            $data = array(
                'title' => 'Form update alamat',
                'logo'  =>  $this->m_main->getDatasortir('sekolah',array('header' => 'alamat'))->row(),
                'message' => $this->session->userdata('message'),
                'username' => $this->session->userdata('username'),
                );
            $this->parser->parse("tentang/alamat.tpl",$data);
        }else{
            $this->changealamat();       
        }
    }
    public function changealamat(){
        $id_setting = $this->uri->segment(4);
        $data = array(
            'value'     => $this->input->post("content"),
            );
        $this->m_main->updateData('sekolah',$data,array('id_s' => $id_setting));
        $this->session->set_flashdata('message', 'Alamat telah di ubah');
        redirect(base_url('_admin/tentang/alamatpost'),'refresh');
    }
}
