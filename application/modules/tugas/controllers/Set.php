<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Set extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('modalmain','m_main');
        if($this->session->userdata('status_guru') != "loginguru" AND !$this->session->userdata('username')){
            redirect(base_url("tugas/aut_login/"));
        }
	}

	// ------------------------------------------------------------------------

	/**
	 * Index page
	 */
	public function index(){
        $data = array(
            'title' => 'Setting Takmir',
            'username' => $this->session->userdata('username'),
            'tmed' => $this->m_main->getDatasortir('guru',array('id_guru' =>$this->session->userdata('id_guru')))->row(),
            'message' => $this->session->userdata('message'),
            );
        $this->parser->parse('sign_in/index.tpl', $data);
	}
    public function updatedata(){
        $this->form_validation->set_rules('username','username','required');
        $this->form_validation->set_rules('password','password','required');
        if($this->form_validation->run() != false){
            $data = array(
                'username' => $this->input->post("username"),
                'password' => md5($this->input->post("password")),
            );
            $cek = $this->m_main->getDatasortir('guru',array('password' =>md5($this->input->post('password_lama'))))->num_rows();
            if ($cek>=1) {
                $this->m_main->updateData('guru',$data,array('id_guru' => $this->input->post("id_guru")));
                $this->session->set_flashdata('message', 'Data berhasil dirubah');
                redirect(base_url("tugas/set/"));
            }else{
                $this->session->set_flashdata('message', 'Password lama anda salah');
                redirect(base_url("tugas/set/"));
            }
        }else{
            redirect(base_url("tugas/set/"));

        }

        
        
           
    }
	
}
