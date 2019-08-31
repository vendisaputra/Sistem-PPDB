<?php 
class Modal_login extends CI_Model{	
	var $CI = NULL;
	function cek_login($table,$where){		
		return $this->db->get_where($table,$where);
	}
	function is_logged_in(){
	  // get CI's object
      $this->CI =& get_instance();
      if($this->CI->session->userdata('status') == '' && $this->CI->session->userdata('username')=='')
      {
      	 //posisi dimana user sedang login
         return true;
      }
   }
   // untuk validasi di setiap halaman yang mengharuskan authentikasi
   function restrict(){
      if($this->is_logged_in() == false)
      {
         redirect('_admin/test');
      }
   }	
   public function addData($table, $data){
      return $this->db->insert($table, $data);
   }
   public function createusr($nama_folder='asal'){
      $path = "assets/img/user/".$nama_folder;
      $tgg   = date('d-m-Y');
      $nmfol = $tgg;
      mkdir($path,0755,TRUE);
      $file = 'assets/img/index.html';
      $newfile = 'assets/img/user/'.$nama_folder.'/index.html';
      $file2 = 'assets/img/avatar3.png';
      $newfile2 = 'assets/img/user/'.$nama_folder.'/avatar3.png';
      copy($file, $newfile);
      copy($file2, $newfile2);
   }
}