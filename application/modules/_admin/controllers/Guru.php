<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Guru extends CI_Controller {

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
                'username' => $this->session->userdata('username'),
            );
            $this->parser->parse("guru/index.tpl",$data);
    }
    public function tampil_daftar_guru(){
        $list = $this->m_main->show_data_order('guru','id_guru','DESC');
         $data = array();
         $no = 0;
         foreach ($list->result() as $k) {
             $row = array();
             $no++;
             $row['no']                 = $no;
             $row['nama']               = $k->nama_guru;
             $row['username']           = $k->username;
             $row['action']             = "<center>
                                        <span class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' onclick='hpsdt(".'"'.$k->id_guru.'"'.")' title='hapus data'><i class='fa fa-trash-o'></i></span>
                                        <span class='btn btn-warning btn-flat btn-sm' OnClick='show_modal(".'"'.$k->id_guru.'"'.")' data-target='#myModal' data-toggle='modal' title='edit data'><i class='fa fa-edit'></i></span>
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
        $this->parser->parse("guru/tambah.tpl",$data);
    }
    public function insertdata(){
        $data = array(
            'nama_guru'   => $this->input->post("nama"),
            'username'    => $this->input->post("username"),
            'password'    => md5($this->input->post("password")),
            );
        $this->m_main->addData('guru',$data);
        $this->session->set_flashdata('message', 'Data berhasil diinputkan');
        redirect(base_url('_admin/guru/tambahdata'),'refresh');
    }
    public function hapusdata(){
        $id = $this->input->post("id");
        $where = array('id_guru' => $id);
        $cek = $this->m_main->deleteData('guru', $where);
        $this->m_main->deleteData('tugas', $where);
        if ($cek>=1){
            echo json_encode(array("status" => TRUE));    
        }else{
            echo json_encode(array("status" => FALSE));
        }
    }
    public function show_modal(){
        $id   = $this->input->post("id");
        $k = $this->m_main->getDatasortir('guru',array('id_guru' => $id))->row();
        $data = array();
        $data['id_guru']   = $k->id_guru;
        $data['nama']      = $k->nama_guru;
        $data['username']  = $k->username;
        echo json_encode($data);
    }
    public function updatedata(){
        if (empty($this->input->post("password"))) {
            $data = array(
                'nama_guru'  => $this->input->post("nama"),
                'username'   => $this->input->post("username"),
                );
        }else{
            $data = array(
                'nama_guru'  => $this->input->post("nama"),
                'username'   => $this->input->post("username"),
                'password'      => md5($this->input->post("password")),
                );
            
        }
        $this->m_main->updateData('guru',$data,array('id_guru' => $this->input->post("id_guru")));
        echo json_encode(array("status" => TRUE));
    }
    
    
	
}
