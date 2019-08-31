<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Konfirmasi extends CI_Controller {

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
        $this->parser->parse("setting/konfirmasi.tpl",$data);
    }
    public function tampil_daftar(){
        $list = $this->m_main->getDatasortir('setting',array('tittle' => 'konfirmasi'));
         $data = array();
         $no = 0;
         foreach ($list->result() as $k) {
             $tampil = explode('/', $k->content);
             $row = array();
             $no++;
             $row['no']    = $no;
             $row['1']     = $tampil[0];
             $row['2']     = $tampil[1]; 
             $row['3']     = $tampil[2];
             $row['4']     = $tampil[3];
             $data[]=$row;
         }
         $output = array("data" => $data,);
         echo json_encode($output);
    }

    public function updatedata(){
        $data = array(
            'content'    => $this->input->post("1").'/'.$this->input->post("2").'/'.$this->input->post("3").'/'.$this->input->post("4").'/',
            );
        $this->m_main->updateData('setting',$data,array('id_setting' => 1));
        echo json_encode(array("status" => TRUE));
    }
	
}
