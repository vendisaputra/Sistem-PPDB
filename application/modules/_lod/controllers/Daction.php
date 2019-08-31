<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Daction extends CI_Controller {

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
        $this->load->library('form_validation');
        if($this->session->userdata('status_daftar') != "login" and !$this->session->userdata('username_daftar')){
            redirect('_lod/mload', 'refresh');
        }
	}
	public function index(){
		$cek = $this->m_main->wheredata('ayah',array('id_daftar' => $this->session->userdata('idlog')));
		if ($cek->num_rows()==0) {
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
						'title' => 'Form data ibu',
						'dstatus' => getstatus(array('id_daftar' => $this->session->userdata('idlog'))),
						'dfinalisasi' => finalisasi(array('id_daftar' => $this->session->userdata('idlog'))),
						'user'  => $this->m_main->wheredata('daftar',array('id_daftar' => $this->session->userdata('idlog')))->row(),
						'username' => $this->session->userdata('username_daftar'),
					);
				$this->parser->parse("daftar/dataa.tpl",$data);
	       	}else{
	       		$this->ayah_datapost();
	       	}
			
		}else{
			redirect(base_url('_lod/daction/post_ib'), 'refresh');	
		}
		
	}
	public function post_ib(){
		$cek = $this->m_main->wheredata('ibu',array('id_daftar' => $this->session->userdata('idlog')));
		if ($cek->num_rows()==0) {
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
						'title' => 'Form data ibu',
						'dstatus' => getstatus(array('id_daftar' => $this->session->userdata('idlog'))),
						'dfinalisasi' => finalisasi(array('id_daftar' => $this->session->userdata('idlog'))),
						'username' => $this->session->userdata('username_daftar'),
					);
					
				$this->parser->parse("daftar/ib_post.tpl",$data);
	       	}else{
	       		$this->ibu_datapost();
	       	}
		}else{
			redirect(base_url('_lod/daction/post_cs'), 'refresh');
		}
	}
	public function post_cs(){
		$cek = $this->m_main->wheredata('calon_siswa',array('id_daftar' => $this->session->userdata('idlog')));
		if ($cek->num_rows()==0) {
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
					'title' => 'Form Calon siswa',
					'dstatus' => getstatus(array('id_daftar' => $this->session->userdata('idlog'))),
					'dfinalisasi' => finalisasi(array('id_daftar' => $this->session->userdata('idlog'))),
					'username' => $this->session->userdata('username_daftar'),
					);

				$this->parser->parse("daftar/cs_post.tpl",$data);
	       	}else{
	       		$this->ck_datapost();
	       	}
		}else{
			redirect(base_url('_lod/daction/biaya_post'), 'refresh');	
		}
	}
	public function post_wali(){
		$cek = $this->m_main->wheredata('wali',array('id_daftar' => $this->session->userdata('idlog')));
		if ($cek->num_rows()==0) {
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
					'title' => 'Form Wali',
					'dstatus' => getstatus(array('id_daftar' => $this->session->userdata('idlog'))),
					'dfinalisasi' => finalisasi(array('id_daftar' => $this->session->userdata('idlog'))),
					'username' => $this->session->userdata('username_daftar'),
					);
				
				$this->parser->parse("daftar/wali_post.tpl",$data);
	       	}else{
	       		$this->wali_datapost();
	       	}
		}else{
			redirect(base_url('_lod/daction/finish'), 'refresh');	
		}
	}
	public function ayah_datapost(){
		$cek = $this->m_main->wheredata('ayah',array('id_daftar' => $this->session->userdata('idlog')));
		if ($cek->num_rows()==0) {
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
					'pendidikan' => $this->input->post('pendidikan'),
				);
			$this->m_main->addData('ayah',$data);
			$this->session->set_flashdata('message', 'Data berhasil diinputkan');
			redirect(base_url('_lod/daction/post_ib'), 'refresh');
		}else{
			$this->session->set_flashdata('message', 'Data berhasil diinputkan');
			redirect(base_url('_lod/daction/post_ib'), 'refresh');
		}
	}
	public function ibu_datapost(){
		$cek = $this->m_main->wheredata('ibu',array('id_daftar' => $this->session->userdata('idlog')));
		if ($cek->num_rows()==0) {
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
			$this->m_main->addData('ibu',$data);
			$this->session->set_flashdata('message', 'Data berhasil diinputkan');
			redirect(base_url('_lod/daction/post_cs'), 'refresh');
		}else{
			$this->session->set_flashdata('message', 'Data berhasil diinputkan');
			redirect(base_url('_lod/daction/post_cs'), 'refresh');
		}
		
	}
	public function ck_datapost(){
		$cek = $this->m_main->wheredata('calon_siswa',array('id_daftar' => $this->session->userdata('idlog')));
		if ($cek->num_rows()==0) {
			$get_umur = hitung_umur($this->input->post('tgl_lahir'));
			if ($get_umur<0) {
				echo "<script>alert('Umur belum memenuhi');history.go(-2);</script>";
				// $this->session->set_flashdata('message', 'Umur belum memenuhi');
				// redirect(base_url('_lod/daction/post_cs'), 'refresh');
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
				$this->m_main->addData('calon_siswa',$data);
				$this->session->set_flashdata('message', 'Data berhasil diinputkan');
				redirect(base_url('_lod/daction/post_cs'), 'refresh');
			}
		}else{
			redirect(base_url('_lod/daction/biaya_post'), 'refresh');
		}
		
	}
	public function wali_datapost(){
		$cek = $this->m_main->wheredata('wali',array('id_daftar' => $this->session->userdata('idlog')));
		if ($cek->num_rows()==0) {
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
			$this->m_main->addData('wali',$data);
			$this->session->set_flashdata('message', 'Data berhasil diinputkan');
			redirect(base_url('_lod/daction/post_cs'), 'refresh');
		}else{
			redirect(base_url('_lod/daction/finish'), 'refresh');
		}
		
	}
	public function biaya_datapost(){
		$cek = $this->m_main->wheredata('biaya',array('id_daftar' => $this->session->userdata('idlog')));
		if ($cek->num_rows()==0) {
			if ($this->input->post('lebih')!='0') {
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
					'uang_buku' => $this->input->post('uang_buku'),
					
				);
			$this->m_main->addData('biaya',$data);
			$this->session->set_flashdata('message', 'Data berhasil diinputkan');
			redirect(base_url('_lod/daction/biaya_post'), 'refresh');
		}else{
			redirect(base_url('_lod/daction/post_wali'), 'refresh');
		}
		
	}
	public function biaya_post(){
		$cek = $this->m_main->wheredata('biaya',array('id_daftar' => $this->session->userdata('idlog')));
		if ($cek->num_rows()==0) {
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
						'seragam'     => tm_biaya('seragam')->row(),
						'kegiatan'    => tm_biaya('kegiatan')->row(),
						'buku'        => tm_biaya('buku')->row(),
						'dstatus'     => getstatus(array('id_daftar' => $this->session->userdata('idlog'))),
						'dfinalisasi' => finalisasi(array('id_daftar' => $this->session->userdata('idlog'))),
						'username' => $this->session->userdata('username'),
					);
					
				$this->parser->parse("daftar/biaya.tpl",$data);
	       	}else{
	       		$this->biaya_datapost();
	       	}
		}else{
			redirect(base_url('_lod/daction/post_wali'), 'refresh');	
		}
		
	}
	public function finish(){
		$cek1 = $this->m_main->wheredata('ayah',array('id_daftar' => $this->session->userdata('idlog')));
		$cek2 = $this->m_main->wheredata('ibu',array('id_daftar' => $this->session->userdata('idlog')));
		$cek3 = $this->m_main->wheredata('calon_siswa',array('id_daftar' => $this->session->userdata('idlog')));
		$cek4 = $this->m_main->wheredata('biaya',array('id_daftar' => $this->session->userdata('idlog')));
		if ($cek1->num_rows()>0 AND $cek2->num_rows()>0 AND $cek3->num_rows()>0 AND $cek4->num_rows()>0) {
			$daftar = $this->m_main->wheredata('daftar',array('id_daftar' => $this->session->userdata('idlog')))->row();
			if ($daftar->ket == '1') {
				$button = '<a href="'.base_url().'_lod/daction/Cetak" target="_blank"><button class="btn btn-lg btn-info">
				<i class="fa fa-download"></i><br/>
				Cetak
				</button></a>';
			}else{
				$button = '<a href="'.base_url().'_lod/daction/finalisasi" class="btn btn-danger btn-lg btn-flat">
                    <i class="fa  fa-hourglass-end"></i><br/> finalisasi
                  </a>';
			}
			$data = array(
					'title'       => 'Finalisasi data',
					'dstatus'     => getstatus(array('id_daftar' => $this->session->userdata('idlog'))),
					'dfinalisasi' => finalisasi(array('id_daftar' => $this->session->userdata('idlog'))),
					'button'	  => $button,		
					'username' => $this->session->userdata('username_daftar'),
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
		return rupiah($total)." ".terbilang($total)." rupiah";
	}
	public function finalisasi(){
		$cek1 = $this->m_main->wheredata('ayah',array('id_daftar' => $this->session->userdata('idlog')));
		$cek2 = $this->m_main->wheredata('ibu',array('id_daftar' => $this->session->userdata('idlog')));
		$cek3 = $this->m_main->wheredata('calon_siswa',array('id_daftar' => $this->session->userdata('idlog')));
		$cek4 = $this->m_main->wheredata('biaya',array('id_daftar' => $this->session->userdata('idlog')));
		$cek5 = $this->m_main->wheredata('wali',array('id_daftar' => $this->session->userdata('idlog')));
		if ($cek1->num_rows()>0 AND $cek2->num_rows()>0 AND $cek3->num_rows()>0 AND $cek4->num_rows()>0 AND $cek5->num_rows()>0) {
			$data = array(
					'ket' => '1',
				);
			$this->m_main->updateData('daftar',$data,array('id_daftar' => $this->session->userdata('idlog')));
			redirect(base_url('_lod/daction/finish'), 'refresh');	
		}else{
			redirect(base_url('_lod/daction/index'), 'refresh');
		}
	}
	public function cetak(){
        $data = array(
            'tmda' => $this->tbiaya(),
            'ayah' => $this->m_main->wheredata('ayah',array('id_daftar' => $this->session->userdata('idlog')))->row(),
			'ibu' => $this->m_main->wheredata('ibu',array('id_daftar' => $this->session->userdata('idlog')))->row(),
			'siswa' => $this->m_main->wheredata('calon_siswa',array('id_daftar' => $this->session->userdata('idlog')))->row(),
			'biaya' => $this->m_main->wheredata('biaya',array('id_daftar' => $this->session->userdata('idlog')))->row(),
			'wali' => $this->m_main->wheredata('wali',array('id_daftar' => $this->session->userdata('idlog')))->row(),
			'getalamat' => getalamat('ayah',array('id_daftar' => $this->session->userdata('idlog'))), 
			'getaibu' => getalamat('ibu',array('id_daftar' => $this->session->userdata('idlog'))), 
			'getname' => getname('ayah',array('id_daftar' => $this->session->userdata('idlog'))),
			'getibu' => getname('ibu',array('id_daftar' => $this->session->userdata('idlog'))),
			'getsiswa' => getname('calon_siswa',array('id_daftar' => $this->session->userdata('idlog'))),
			'getwali' => getname('wali',array('id_daftar' => $this->session->userdata('idlog'))),
			'username' => $this->session->userdata('username'),

        );

        $this->parser->parse('daftar/cetak.tpl', $data);
        $html = $this->output->get_output();
        $this->load->library('dompdf_gen');
        $this->dompdf->set_paper('A4');
        $this->dompdf->load_html($html);
        //$font = $this->dompdf->getFontMetrics()->get_font("helvetica", "bold");
        //$this->dompdf->getCanvas()->page_text(72, 18, "Header: {PAGE_NUM} of {PAGE_COUNT}", $font, 10, array(0,0,0));
        $this->dompdf->render();
        $this->dompdf->stream($this->session->userdata('idlog').".pdf", array('Attachment' => false));
	}
}
