<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Buku extends CI_Controller {

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
                'title' => 'Biaya Buku',
                'kon'   => tm_biaya('buku')->row(),
                'username' => $this->session->userdata('username'),
            );
        $this->parser->parse("setting/buku.tpl",$data);
    }
    public function tampil_seragam(){
        $list = $this->m_main->getDatasortir('setting',array('tittle' => 'buku'));
         $data = array();
         $no = 0;
         foreach ($list->result() as $k) {
             $row = array();
             $no++;
             $row['no']        = $no;
             $row['nama']      = 'Uang Buku';
             $row['1']         = rupiah($k->content);
             $row['terbilang'] = terbilang($k->content);
             $data[]=$row;
         }
         $output = array("data" => $data,);
         echo json_encode($output);
    }

    public function updatedata(){
        $data = array(
            'content'    => $this->input->post("content"),
            );
        $this->m_main->updateData('setting',$data,array('id_setting' => $this->input->post("id_seragam")));
        echo json_encode(array("status" => TRUE));
    }
    
}
