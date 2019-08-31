<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pengumuman extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
        $this->load->model('modalmain','m_main');
        if($this->session->userdata('status') != "loginadmin" AND !$this->session->userdata('username')){
            redirect(base_url("_admin/aut_login"));
        }
		
	}

    public function index(){     
            $data = array(
                'title' => 'Pemgumuman',
                'username' => $this->session->userdata('username'),
            );
            $this->parser->parse("pengumuman/index.tpl",$data);
    }
    public function tampil_daftar_Pengumuman(){
        $list = $this->m_main->getData('pengumuman');
         $data = array();
         $no = 0;
         foreach ($list->result() as $k) {
             $row = array();
             $no++;
             $row['no']                 = $no;
             $row['judul']              = $k->judul;
             $row['tanggal_terbit']     = tgl_indo($k->tanggal_terbit);
             $row['isi']                = truncate($k->isi);
             $row['action']             = "<center>
                                        <span class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' onclick='hpsdt(".'"'.$k->id_pengumuman.'"'.")' title='hapus data'><i class='fa fa-trash-o'></i></span>
                                        <a href='".base_url('_admin/pengumuman/getUpdate/'.$k->id_pengumuman)."'><span class='btn btn-warning btn-flat btn-sm' data-target='tooltip' data-toggle='modal' title='edit data'><i class='fa fa-edit'></i></span></a>
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
        $this->parser->parse("pengumuman/tambah.tpl",$data);
    }
    public function insertdata(){
        $data = array(
            'judul'             => $this->input->post("judul"),
            'tanggal_terbit'    => date('Y-m-d'),
            'isi'               => $this->input->post("isi"),
            );
        $this->m_main->addData('pengumuman',$data);
        $this->session->set_flashdata('message', 'Data berhasil diinputkan');
        redirect(base_url('_admin/Pengumuman/tambahdata'),'refresh');
    }
    public function hapusdata(){
        $id = $this->input->post("id");
        $where = array('id_pengumuman' => $id);
        $cek = $this->m_main->deleteData('pengumuman', $where);
        if ($cek>=1){
            echo json_encode(array("status" => TRUE));    
        }else{
            echo json_encode(array("status" => FALSE));
        }
    }
    public function getUpdate(){
        $id = $this->uri->segment(4);
        $data = array(
                'title'   => 'Form edit Data',
                'content' => $this->m_main->getDatasortir('pengumuman', array('id_pengumuman' => $id))->row(),
                'message' => $this->session->userdata('message'),
                'username' => $this->session->userdata('username'),
            );
        $this->parser->parse("pengumuman/edit.tpl",$data);
    }
    public function updatedata(){
        $data = array(
            'judul'  => $this->input->post("judul"),
            'isi'   => $this->input->post("isi"),
            );
        $this->m_main->updateData('pengumuman',$data,array('id_pengumuman' => $this->input->post("id_pengumuman")));
        $this->session->set_flashdata('message', 'Data berhasil dirubah');
        redirect(base_url('_admin/Pengumuman/getUpdate/'.$this->input->post("id_pengumuman")),'refresh');
    }
    
    
	
}
