<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Tugas extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('modalmain','m_main');
        if($this->session->userdata('status_guru') != "loginguru" AND !$this->session->userdata('username_guru')){
            redirect(base_url("tugas/aut_login/"));
        }
    }

    public function index(){
        $data = array(
                'title' => 'Form Content',
                'message' => $this->session->userdata('message'),
                'username' => $this->session->userdata('username_guru'),
            );
        $this->parser->parse("index.tpl",$data);
    }
    public function tampil_content(){
        $list = $this->m_main->getDatasortir('tugas',array('id_guru' => $this->session->userdata('id_guru')),'id_tugas','DESC');
        $data = array();
        $no = 0;
        foreach ($list->result() as $k) {
            $row = array();
            $no++;
            $row['no']             = $no;
            $row['judul']          = $k->judul;
            $row['tanggal_upload'] = tgl_indo($k->tanggal_upload);
            $row['isi']            = truncate($k->isi);
            $row['action']         = "<center>
                                        <span class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' onclick='hpsdt(".'"'.$k->id_tugas.'"'.")' title='hapus data'><i class='fa fa-trash-o'></i></span>
                                        <a href='".base_url('tugas/tugas/editdata/'.$k->id_tugas)."'><span class='btn btn-info btn-flat btn-sm' data-toggle='tooltip' title='edit data ".$k->judul."'><i class='fa fa-edit'></i></span></a>
                                    </center>";
            $data[]=$row;
        }
        $output = array("data" => $data,);
        echo json_encode($output);
    }
    public function daftarTugas(){
         $data = array(
                'title' => 'Form Content',
                'message' => $this->session->userdata('message'),
                'username' => $this->session->userdata('username_guru'),
            );
        $this->parser->parse("tugas/index.tpl",$data);
    }   
    public function inputTugas(){
        $this->form_validation->set_rules('judul','Judul','required');
        $this->form_validation->set_rules('isi','Isi','required');
        if($this->form_validation->run() != false){
            $this->insertdata();
        }else{
            $data = array(
                    'title' => 'Form tugas',
                    'message' => $this->session->userdata('message'),
                    'username' => $this->session->userdata('username_guru'),
                );
            $this->parser->parse("tugas/tambah.tpl",$data);
        }
    }
    public function insertdata(){
        $this->form_validation->set_rules('judul','Judul','required');
        $this->form_validation->set_rules('isi','Isi','required');
        if($this->form_validation->run() != false){
            $data = array(
                    'id_guru'        => $this->session->userdata('id_guru'),
                    'judul'          => $this->input->post("judul"),
                    'tanggal_upload' => date('Y-m-d'),
                    'isi'            => $this->input->post("isi"),
                );
            $this->m_main->addData('tugas',$data);
            $this->session->set_flashdata('message', 'Data berhasil diinputkan');
            redirect(base_url('tugas/tugas/inputTugas'),'refresh');
            
        }else{
            redirect(base_url('tugas/tugas/inputTugas'),'refresh');
        }
    }
    public function hapusdata(){
        $id = $this->input->post("id");
        $where = array('id_tugas' => $id);
        $cek = $this->m_main->deleteData('tugas', $where);
        if ($cek>0) {
            echo json_encode(array("status" => TRUE));
        }else{
            echo json_encode(array("status" => FALSE));
        }
    }
    public function editdata(){
        $this->form_validation->set_rules('judul','Judul','required');
        $this->form_validation->set_rules('isi','Isi','required');
        if($this->form_validation->run() != false){
            $this->updatedata();
        }else{
            $id = $this->uri->segment(4);
            $data = array(
                    'title'   => 'Form edit Data',
                    'content' => $this->m_main->getDatasortir('tugas', array('id_tugas' => $id))->row(),
                    'message' => $this->session->userdata('message'),
                    'username' => $this->session->userdata('username_guru'),
                );
            $this->parser->parse("tugas/edit.tpl",$data);
        }
    }
    public function updatedata(){
        $this->form_validation->set_rules('judul','Judul','required');
        $this->form_validation->set_rules('isi','Isi','required');
        if($this->form_validation->run() != false){
            $data = array(
                    'judul'          => $this->input->post("judul"),
                    'isi'            => $this->input->post("isi"),
                );
            $this->m_main->updateData('tugas',$data, array('id_tugas' => $this->input->post("id_tugas"),'id_guru' => $this->session->userdata('id_guru')));
            $this->session->set_flashdata('message', 'Data berhasil dirubah');
            redirect(base_url('tugas/tugas/editdata/'.$this->input->post("id_tugas")),'refresh');
            
        }else{
            redirect(base_url('tugas/tugas/daftarTugas/'.$this->input->post("id_tugas")),'refresh');
        }
    }
}
