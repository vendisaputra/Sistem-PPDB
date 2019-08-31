<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Edata extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function __construct(){
		parent::__construct();
        $this->load->model('modalmain','m_main');
        if($this->session->userdata('status_daftar') != "login" and !$this->session->userdata('username_daftar')){
            redirect('_lod/mload', 'refresh');
        }
	}
	public function index(){
		// validasi form
        $this->form_validation->set_rules('ndepan', 'Nama depan', 'trim|required');
        $this->form_validation->set_rules('ntengah');
        $this->form_validation->set_rules('nbelakang');
        $this->form_validation->set_rules('rt', 'rt', 'trim|required');
        $this->form_validation->set_rules('rw', 'rw', 'trim|required');
        $this->form_validation->set_rules('tmp_lahir', 'Tempat Lahir', 'trim|required');
        $this->form_validation->set_rules('tgl_lahir', 'Tanggal Lahir', 'trim|required');
        $this->form_validation->set_rules('nik', 'Nik', 'trim|required');
        $this->form_validation->set_rules('dusun', 'Dusun', 'trim|required');
        $this->form_validation->set_rules('desa', 'Desa', 'trim|required');
        $this->form_validation->set_rules('kac', 'Kecamatan', 'trim|required');
        $this->form_validation->set_rules('kab', 'Kabupaten', 'trim|required');
        $this->form_validation->set_rules('no_hp', 'no_hp', 'trim|required');
        $this->form_validation->set_rules('no_telp', 'no_telp', 'trim|required');
       	$this->form_validation->set_error_delimiters('<div class="text-danger">', '</div>');
       	if ($this->form_validation->run() == FALSE){
       		$data = array(
       				'tmed'      => $this->m_main->wheredata('ayah',array('id_daftar' => $this->session->userdata('idlog')))->row(),
       				'getname'   => getname('ayah',array('id_daftar' => $this->session->userdata('idlog'))),
       				'getalamat' => getalamat('ayah',array('id_daftar' => $this->session->userdata('idlog'))), 
       				'dstatus' => getstatus(array('id_daftar' => $this->session->userdata('idlog'))),
       				'dfinalisasi' => finalisasi(array('id_daftar' => $this->session->userdata('idlog'))),
       				'message' => $this->session->userdata('message'),
       				'username' => $this->session->userdata('username_daftar'),
       			);
			$this->parser->parse("change/index.tpl",$data);
       	}else{
       		$this->ayah_datapost();
       	}
	}
	public function post_ib(){
		// validasi form
        $this->form_validation->set_rules('ndepan', 'Nama depan', 'trim|required');
        $this->form_validation->set_rules('ntengah');
        $this->form_validation->set_rules('nbelakang');
        $this->form_validation->set_rules('rt', 'rt', 'trim|required');
        $this->form_validation->set_rules('rw', 'rw', 'trim|required');
        $this->form_validation->set_rules('tmp_lahir', 'Tempat Lahir', 'trim|required');
        $this->form_validation->set_rules('tgl_lahir', 'Tanggal Lahir', 'trim|required');
        $this->form_validation->set_rules('nik', 'Nik', 'trim|required');
        $this->form_validation->set_rules('dusun', 'Dusun', 'trim|required');
        $this->form_validation->set_rules('desa', 'Desa', 'trim|required');
        $this->form_validation->set_rules('kac', 'Kecamatan', 'trim|required');
        $this->form_validation->set_rules('kab', 'Kabupaten', 'trim|required');
       	$this->form_validation->set_error_delimiters('<div class="text-danger">', '</div>');
       	if ($this->form_validation->run() == FALSE){
			$data = array(
					'title'       => 'Form data ibu',
					'tmed'        => $this->m_main->wheredata('ibu',array('id_daftar' => $this->session->userdata('idlog')))->row(),
       				'getname'     => getname('ibu',array('id_daftar' => $this->session->userdata('idlog'))),
       				'getalamat'   => getalamat('ibu',array('id_daftar' => $this->session->userdata('idlog'))), 
       				'dstatus'     => getstatus(array('id_daftar' => $this->session->userdata('idlog'))),
       				'dfinalisasi' => finalisasi(array('id_daftar' => $this->session->userdata('idlog'))),
       				'message' => $this->session->userdata('message'),
       				'username' => $this->session->userdata('username_daftar'),
				);
			$this->parser->parse("change/ib_post.tpl",$data);
       	}else{
       		$this->ibu_datapost();
       	}
	}
	public function post_wali(){
			//validasi form
	        $this->form_validation->set_rules('ndepan', 'Nama Depan', 'trim');
	        $this->form_validation->set_rules('ntengah');
	        $this->form_validation->set_rules('nbelakang');
	        $this->form_validation->set_rules('no_hp');
	        $this->form_validation->set_rules('no_telp');
	        $this->form_validation->set_rules('hubungan');
	        $this->form_validation->set_rules('pendidikan');
	        $this->form_validation->set_rules('nik');
	        $this->form_validation->set_rules('pekerjaan');
	       	$this->form_validation->set_error_delimiters('<div class="text-danger">', '</div>');
	       	if ($this->form_validation->run() == FALSE){
				$data = array(
       				'title'     => 'Form Wali',
       				'tmed'      => $this->m_main->wheredata('wali',array('id_daftar' => $this->session->userdata('idlog')))->row(),
       				'getname'   => getname('wali',array('id_daftar' => $this->session->userdata('idlog'))),
       				'dstatus' => getstatus(array('id_daftar' => $this->session->userdata('idlog'))),
       				'dfinalisasi' => finalisasi(array('id_daftar' => $this->session->userdata('idlog'))),
       				'message' => $this->session->userdata('message'),
       				'username' => $this->session->userdata('username_daftar'),
       			);
				$this->parser->parse("change/wali_post.tpl",$data);
       		}else{
       			$this->wali_datapost();
       		}
	}
	public function post_cs(){
		//validasi form
        $this->form_validation->set_rules('ndepan', 'Nama depan', 'trim|required');
        $this->form_validation->set_rules('ntengah');
        $this->form_validation->set_rules('nbelakang');
        $this->form_validation->set_rules('tbadan', 'Tinggi badan', 'trim|required');
        $this->form_validation->set_rules('bbadan', 'Tinggi bbadan', 'trim|required');
        $this->form_validation->set_rules('tmp_lahir', 'Tempat Lahir', 'trim|required');
        $this->form_validation->set_rules('tgl_lahir', 'Tanggal Lahir', 'trim|required');
        $this->form_validation->set_rules('nik', 'Nik', 'trim|required');
        $this->form_validation->set_rules('asals', 'Asal Sekolah', 'trim|required');
       	$this->form_validation->set_error_delimiters('<div class="text-danger">', '</div>');
       	if ($this->form_validation->run() == FALSE){
       		$data = array(
       				'title'     => 'Form Calon siswa',
       				'tmed'      => $this->m_main->wheredata('calon_siswa',array('id_daftar' => $this->session->userdata('idlog')))->row(),
       				'getname'   => getname('calon_siswa',array('id_daftar' => $this->session->userdata('idlog'))),
       				'dstatus' => getstatus(array('id_daftar' => $this->session->userdata('idlog'))),
       				'dfinalisasi' => finalisasi(array('id_daftar' => $this->session->userdata('idlog'))),
       				'message' => $this->session->userdata('message'),
       				'username' => $this->session->userdata('username_daftar'),
       			);
			$this->parser->parse("change/cs_post.tpl",$data);
       	}else{
       		$this->ck_datapost();
       	}
	}
	public function ayah_datapost(){
		$data = array(
				'id_daftar'    => $this->session->userdata('idlog'),
				'nama' 		   => $this->input->post('ndepan').','.$this->input->post('ntengah').','.$this->input->post('nbelakang'),
				'tmp_lahir'    => $this->input->post('tmp_lahir'),
				'tgl_lahir'    => date('Y-m-d'),//$this->input->post('tgl_lahir'),
				'nik' 		   => $this->input->post('nik'),
				'alamat' 	   => $this->input->post('rt').','.$this->input->post('rw').','.$this->input->post('dusun').','.$this->input->post('desa').','.$this->input->post('kac').','.$this->input->post('kab'),
				'pekerjaan'    => $this->input->post('pekerjaan'),
				'no_hp' => $this->input->post('no_hp'),
				'no_telp' => $this->input->post('no_telp'),
			);
		$this->m_main->updateData('ayah',$data,array('id_daftar' => $this->session->userdata('idlog')));
		$this->session->set_flashdata('message', 'Data berhasil diubah');
		redirect(base_url('_lod/edata/'), 'refresh');
	}

	public function ibu_datapost(){
		$data = array(
				'id_daftar' => $this->session->userdata('idlog'),
				'nama' 		=> $this->input->post('ndepan').','.$this->input->post('ntengah').','.$this->input->post('nbelakang'),
				'tmp_lahir' => $this->input->post('tmp_lahir'),
				'tgl_lahir' => date('Y-m-d'),//$this->input->post('tgl_lahir'),
				'nik' 		=> $this->input->post('nik'),
				'alamat' 	=> $this->input->post('rt').','.$this->input->post('rw').','.$this->input->post('dusun').','.$this->input->post('desa').','.$this->input->post('kac').','.$this->input->post('kab'),
				'pekerjaan' => $this->input->post('pekerjaan'),
				'no_hp' => $this->input->post('no_hp'),
				'no_telp' => $this->input->post('no_telp'),
				'pendidikan' => $this->input->post('pendidikan'),
			);
		$this->m_main->updateData('ibu',$data,array('id_daftar' => $this->session->userdata('idlog')));
		$this->session->set_flashdata('message', 'Data berhasil diubah');
		redirect(base_url('_lod/edata/post_ib'), 'refresh');
		
	}

	public function wali_datapost(){
		$data = array(
				'id_daftar' => $this->session->userdata('idlog'),
				'nama' 		=> $this->input->post('ndepan').','.$this->input->post('ntengah').','.$this->input->post('nbelakang'),
				'nik' 		=> $this->input->post('nik'),
				'hubungan' 		=> $this->input->post('hubungan'),
				'pekerjaan' => $this->input->post('pekerjaan'),
				'no_hp' => $this->input->post('no_hp'),
				'no_telp' => $this->input->post('no_telp'),
				'pendidikan' => $this->input->post('pendidikan'),
			);
		$this->m_main->updateData('wali',$data,array('id_daftar' => $this->session->userdata('idlog')));
		$this->session->set_flashdata('message', 'Data berhasil diubah');
		redirect(base_url('_lod/edata/post_wali'), 'refresh');
		
	}

	public function ck_datapost(){
		$get_umur = hitung_umur($this->input->post('tgl_lahir'));
		if ($get_umur<0) {
			$this->session->set_flashdata('message', 'Umur belum memenuhi');
			redirect(base_url('_lod/edata/post_cs'), 'refresh');
		}else{
			$data = array(
					'id_daftar' 	=> $this->session->userdata('idlog'),
					'nama' 			=> $this->input->post('ndepan').','.$this->input->post('ntengah').','.$this->input->post('nbelakang'),
					'tmp_lahir' 	=> $this->input->post('tmp_lahir'),
					'tgl_lahir' 	=> $this->input->post('tgl_lahir'),
					'nik' 			=> $this->input->post('nik'),
					'jenis_kelamin' => $this->input->post('jns_kelamin'),
					'tinggi_badan' 	=> $this->input->post('tbadan'),
					'berat_badan' 	=> $this->input->post('bbadan'),
					'kondisi' 		=> $this->input->post('kondisi'),
					'mbaca' 		=> $this->input->post('mbaca'),
					'mhitung' 		=> $this->input->post('mhitung'),
					'malquran' 		=> $this->input->post('malquran'),
					'kebutuhan' 	=> $this->input->post('lebih'),
					'asal_sekolah' => $this->input->post('asals'),
					'alamat_tinggal' => $this->input->post('alamat_tinggal'),
					
				);
			$this->m_main->updateData('calon_siswa',$data,array('id_daftar' => $this->session->userdata('idlog')));
			$this->session->set_flashdata('message', 'Data berhasil diubah');
			redirect(base_url('_lod/edata/post_cs'), 'refresh');
		}
	}
	public function biaya_datapost(){	
		if ($this->input->post('lebih') != 0 ) {
			$sumbangan = $this->input->post('lebih');
		}else{
			$sumbangan = $this->input->post('sumbangan');
		}
		$data = array(
				'id_daftar' 	=> $this->session->userdata('idlog'),
				'sumbangan' 	=> $sumbangan,
				'uang_seragan'  => $this->input->post('uang_seragan'),
				'uang_spp' 		=> $this->input->post('uang_spp'),
				'uang_kegiatan' => $this->input->post('uang_kegiatan'),
				'uang_buku'     => $this->input->post('uang_buku'),
				
			);
		$this->m_main->updateData('biaya',$data,array('id_daftar' => $this->session->userdata('idlog')));
		$this->session->set_flashdata('message', 'Data berhasil diubah');
		redirect(base_url('_lod/edata/biaya_post'), 'refresh');
	}
	public function biaya_post(){
		//validasi form
        $this->form_validation->set_rules('uang_seragan', 'Uang Seragan', 'trim|required');
        $this->form_validation->set_rules('uang_kegiatan', 'Uang Kegiatan', 'trim|required');
        $this->form_validation->set_rules('uang_buku', 'Uang Buku', 'trim|required');
       	$this->form_validation->set_error_delimiters('<div class="text-danger">', '</div>');
       	if ($this->form_validation->run() == FALSE){
			$data = array(
					'title'       => 'Form biaya',
					'setting'     => tm_biaya('biaya')->result(),
					'setting_dua' => tm_biaya('spp')->result(),
					'tmed'        => $this->m_main->wheredata('biaya',array('id_daftar' => $this->session->userdata('idlog')))->row(),
					'dstatus'     => getstatus(array('id_daftar' => $this->session->userdata('idlog'))),
					'dfinalisasi' => finalisasi(array('id_daftar' => $this->session->userdata('idlog'))),
					'cek'		  => get_biaya('biaya',array('id_daftar' => $this->session->userdata('idlog'))),
					'message' => $this->session->userdata('message'),
					'username' => $this->session->userdata('username_daftar'),
					
				);
			$this->parser->parse("change/biaya.tpl",$data);
       	}else{
       		$this->biaya_datapost();
       	}
	}
	public function finish(){
		$cek1 = $this->m_main->wheredata('ayah',array('id_daftar' => $this->session->userdata('idlog')));
		$cek2 = $this->m_main->wheredata('ibu',array('id_daftar' => $this->session->userdata('idlog')));
		$cek3 = $this->m_main->wheredata('calon_siswa',array('id_daftar' => $this->session->userdata('idlog')));
		$cek4 = $this->m_main->wheredata('biaya',array('id_daftar' => $this->session->userdata('idlog')));
		if ($cek1->num_rows()>0 AND $cek2->num_rows()>0 AND $cek3->num_rows()>0 AND $cek4->num_rows()>0) {
			$data = array(
					'title' => 'Finalisasi data',
					'dfinalisasi' => finalisasi(array('id_daftar' => $this->session->userdata('idlog'))),
					'username' => $this->session->userdata('username'),
				);
			$this->parser->parse("daftar/finish.tpl",$data);
		}else{
			redirect(base_url('_lod/daction/index'), 'refresh');	
		}
	}
	public function tbiaya(){
		$total =0;
		$cek   = $this->m_main->wheredata('biaya',array('id_daftar' => $this->session->userdata('idlog')))->row();
		$total = $cek->sumbangan + $cek->uang_seragan + $cek->uang_spp + $cek->uang_kegiatan;
		echo rupiah($total)." ".terbilang($total)." rupiah";
	}
	public function cek(){
		echo json_encode(get_biaya('biaya',array('id_daftar' => $this->session->userdata('idlog'))));
	}
}
