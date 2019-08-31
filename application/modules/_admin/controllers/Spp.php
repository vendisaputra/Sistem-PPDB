<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Spp extends CI_Controller {

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
                'title' => 'Form konfirmasi',
                'kon'   => konfirm('konfirmasi'),
                'username' => $this->session->userdata('username'),
            );
        $this->parser->parse("setting/spp.tpl",$data);
    }
    public function tampil_daftar(){
        $list = $this->m_main->getDatasortir('setting',array('tittle' => 'spp'));
         $data = array();
         $no = 0;
         foreach ($list->result() as $k) {
             $row = array();
             $no++;
             $row['no']     = $no;
             $row['0']      = 'Uang SPP Pilihan '.$no;
             $row['1']      = rupiah($k->content);
             $row['action'] = "<center>
                                <span class='btn btn-success btn-flat btn-sm' OnClick='show_modal(".'"'.$k->id_setting.'"'.")' data-target='#myModal' data-toggle='modal' title='edit data sumbangan ".rupiah($k->content)."'><i class='fa fa-edit'></i></span>
                            </center>";
             $data[]=$row;
         }
         $output = array("data" => $data,);
         echo json_encode($output);
    }
    public function show_modal(){
        $id   = $this->input->post("id");
        $k = $this->m_main->getDatasortir('setting',array('id_setting' => $id))->row();
        $data = array();
        $data['id_setting']       = $k->id_setting;
        $data['contentt']      = $k->content;
        echo json_encode($data);
    }
    public function updatedata(){
        $data = array(
            'content'    => $this->input->post("content"),
            );
        $this->m_main->updateData('setting',$data,array('id_setting' => $this->input->post("id_sumbangan")));
        echo json_encode(array("status" => TRUE));
    }
	
}
