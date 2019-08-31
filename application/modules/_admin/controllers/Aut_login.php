<?php

defined('BASEPATH') OR exit('No direct script access allowed');
class Aut_login extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('modal_login','m_login');
	}
	// ------------------------------------------------------------------------
	/*** Index page*/

	public function index(){

		// if($this->m_login->is_logged_in() == true){

             $this->parser->parse('sign_in/login.tpl');

  //       }else{

  //           redirect(base_url("_admin/utama/"));

  //       }

        

	}

	public function cek_login(){
		$this->form_validation->set_rules('username','username','required');
		$this->form_validation->set_rules('password','password','required');
        if($this->form_validation->run() != false){
        	$username = $this->input->post('username');
        	$password = $this->input->post('password');
			$uname = array('username' => $username);
	        $cek_user = $this->m_login->cek_login("admin",$uname)->num_rows();
	        if ($cek_user > 0) {
	            $upass = array('password' => md5($password));
	            $cek_upass = $this->m_login->cek_login("admin",$upass)->num_rows();
	            if ($cek_upass > 0) {
	                $where = array(
	                    'username' => $username,
	                    'password' => md5($password)
	                    );
	                $cek = $this->m_login->cek_login("admin",$where)->num_rows();
	                $cekdua = $this->m_login->cek_login("admin",$where);
	                if($cek == 1){
	                        $data_session = array(
	                        'username' =>  $cekdua->row()->username,
	                        'id_admin' =>  $cekdua->row()->id_admin,
	                        'status' => "loginadmin",
	                        );
	                        $this->session->set_userdata($data_session);
	                        $data = $this->session->userdata;
	                        redirect(base_url("_admin/main/"));    
	                }else{
	                    echo "<script>alert('Anda Gagal Login!');window.history.go(-1);</script>";
	                }
	            }else{
	                echo "<script>alert('password salah');window.history.go(-1);</script>";
	            }
	        }else{
	            echo "<script>alert('Username salah');window.history.go(-1);</script>";
	        }
		}else{
			redirect(base_url("_admin/aut_login/"));
		}
    }
    public function logout(){
        $this->session->sess_destroy();
        redirect('_admin/aut_login/', 'refresh');
    }
}

