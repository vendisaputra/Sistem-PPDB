<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Berita extends CI_Controller {

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
                'title' => 'Form Content',
                'message' => $this->session->userdata('message'),
                'username' => $this->session->userdata('username'),
            );
        $this->parser->parse("content/index.tpl",$data);
    }
    public function tampil_content(){
        $list = $this->m_main->show_data_order('content','tgl_terbit','DESC');
         $data = array();
         $no = 0;
         foreach ($list->result() as $k) {
             $row = array();
             $no++;
             $row['no']         = $no;
             $row['judul']      = $k->judul;
             $row['tgl_terbit'] = tgl_indo($k->tgl_terbit);
             $row['isi']        = truncate($k->isi);
             $row['kategori']   = $k->kategori;
             $row['action']     = "<center>
                                        <span class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' onclick='hpsdt(".'"'.$k->id_content.'"'.")' title='hapus data'><i class='fa fa-trash-o'></i></span>
                                        <a href='".base_url('_admin/berita/editdata/'.$k->id_content)."'><span class='btn btn-info btn-flat btn-sm' data-toggle='tooltip' title='edit data ".$k->judul."'><i class='fa fa-edit'></i></span></a>
                                    </center>";
             $data[]=$row;
         }
         $output = array("data" => $data,);
         echo json_encode($output);
    }
    public function tambahdata(){
        $data = array(
                'title' => 'Form tambah Data',
                'message' => $this->session->userdata('message'),
                'username' => $this->session->userdata('username'),
            );
        $this->parser->parse("content/tambah.tpl",$data);
    }
    public function insertdata(){
        $data = array(
            'judul'      => $this->input->post("judul"),
            'tgl_terbit' => date('Y-m-d'),
            'isi'        => $this->input->post("isi"),
            'kategori'   => $this->input->post("optionsRadios"),
            );
        $this->m_main->addData('content',$data);
        $get_content = $this->m_main->getDatasortir('content',$data);
        $id_content = $get_content->row()->id_content;
        $config=[
                    'upload_path'   => $this->m_main->mdir('assets/user/img/berita/',$id_content),
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
                ->resize_crop(640, 426)
                ->set_jpeg_quality(100)
                ->save_pa($prepend = "", "-thumb", FALSE);
        }
        $this->session->set_flashdata('message', 'Data berhasil diinputkan');
        redirect(base_url('_admin/berita/tambahdata'),'refresh');
    }
    public function hapusdata(){
        $id = $this->input->post("id");
        $where = array('id_content' => $id);
        $cek = $this->m_main->deleteData('content', $where);
        $this->m_main->remdir('assets/user/img/berita/',$id);
        if ($cek>0) {
            echo json_encode(array("status" => TRUE));
        }else{
            echo json_encode(array("status" => FALSE));
        }
    }
    public function editdata(){
        $id = $this->uri->segment(4);
        $data = array(
                'title'   => 'Form edit Data',
                'content' => $this->m_main->getDatasortir('content', array('id_content' => $id))->row(),
                'message' => $this->session->userdata('message'),
                'username' => $this->session->userdata('username'),
            );
        $this->parser->parse("content/edit.tpl",$data);
    }
    public function updatedata(){
        $data = array(
                'judul'    => $this->input->post("judul"),
                'isi'      => $this->input->post("isi"),
                'kategori' => $this->input->post("optionsRadios"),
            );
        $this->m_main->updateData('content',$data, array('id_content' => $this->input->post("id_content")));
        if (!empty($_FILES['file']['name'])) {
            $this->m_main->remdir('assets/user/img/berita/',$this->input->post("id_content"));
            $config=[
                'upload_path'   => $this->m_main->mdir('assets/user/img/berita/',$this->input->post("id_content")),
                'allowed_types' => 'gif|jpg|png',
                'max_size'      => 10000,
            ];
            $this->load->library('upload', $config);
            if (!$this->upload->do_upload('file')){
                   //print_r($this->upload->display_errors());
            }else{
                 $this->image
                    ->load($this->upload->data('full_path'))
                    ->resize_crop(640, 426)
                    ->set_jpeg_quality(100)
                    ->save_pa($prepend = "", "-thumb", FALSE);
            }
        }
        $this->session->set_flashdata('message', 'Data berhasil diupdate');
        redirect(base_url('_admin/berita/editdata/'.$this->input->post("id_content")),'refresh');
    }
}
