<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mload extends CI_Controller {

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
        
	}
	public function index(){
		//$this->load->view('welcome_message');
		$data = array(
				'title'     	   => 'SD MUHAMMADIYAH 16 SURAKARTA',
				'slider'    	   => $this->m_main->show_data('setting',array('tittle' => 'slider'),'id_setting','DESC')->result(),
				'berita'    	   => $this->m_main->getData_sort('content','4','tgl_terbit','DESC', array('kategori' => 'berita'))->result(),
				'terkait'   	   => $this->m_main->getData_sort('content','6','tgl_terbit','ASC', array('kategori' => 'berita'))->result(),
				'fasilitas' 	   => $this->m_main->getData_sort('content','6','tgl_terbit','DESC', array('kategori' => 'fasilitas'))->result(),
				'prestasi'  	   => $this->m_main->getData_sort('content','6','tgl_terbit','DESC', array('kategori' => 'prestasi'))->result(),
				'ekstrakulikuler'  => $this->m_main->getData_sort('content','6','tgl_terbit','DESC', array('kategori' => 'ekstrakulikuler'))->result(),
			);
		$this->parser->parse("index.tpl",$data);
	}
    
    public function sitemap(){
     $this->load->helper('url');
     $data['berita'] = $this->m_main->create();
     $this->load->view('sitemap',$data);
    }

	public function berita(){
		$from = $this->uri->segment(4);
		$jumlah_data = $this->m_main->whereData('content', array('kategori' => 'berita'))->num_rows();
		$this->paggi('_lod/mload/berita',$jumlah_data,10);
		
		$data = array(
				'title'      => 'Page Berita',
				'berita'     => $this->m_main->search_get_data('content', array('kategori' => 'berita'),10,$from,'tgl_terbit','DESC')->result(),
				'fasilitas'  => $this->m_main->getData_sort('content','6','tgl_terbit','DESC', array('kategori' => 'fasilitas'))->result(),
				'pagination' => $this->pagination->create_links(),
			);
		$this->parser->parse("berita/berita.tpl",$data);
	}
	public function viewberita(){
		$id = $this->uri->segment(4);
		$data = array(
				'title'   => 'Detail Berita',
				'content' => $this->m_main->whereData('content', array('id_content' => $id))->row(),
				'terkait' => $this->m_main->getData_sort('content','6','tgl_terbit','ASC', array('kategori' => 'berita'))->result(),
			);
		$this->parser->parse("berita/dt_berita.tpl",$data);
	}
	public function fasilitas(){
		$from = $this->uri->segment(4);
		$jumlah_data = $this->m_main->whereData('content', array('kategori' => 'fasilitas'))->num_rows();
		$this->paggi('_lod/mload/fasilitas',$jumlah_data,10);

		$data = array(
				'title'      => 'Fasilitas',
				'fasilitas'  => $this->m_main->search_get_data('content', array('kategori' => 'fasilitas'),10,$from,'tgl_terbit','DESC')->result(),
				'terkait'     => $this->m_main->getData_sort('content','4','tgl_terbit','DESC', array('kategori !=' => 'fasilitas'))->result(),
				'pagination' => $this->pagination->create_links(),
			);
		$this->parser->parse("fasilitas/fasilitas.tpl",$data);
	}
	public function paggi($url,$jumlah_data,$per){
		$config['base_url'] = base_url().$url;
		$config['total_rows'] = $jumlah_data;
		$config['per_page'] = $per;
		
		//Tambahan untuk styling
		$config['full_tag_open'] = "<ul class='pagination'>";
		$config['full_tag_close'] ="</ul>";
		$config['num_tag_open'] = '<li >';
		$config['num_tag_close'] = '</li>';
		$config['cur_tag_open'] = "<li class='disabled' ><li class='active'><a href='#' >";
		$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
		$config['next_tag_open'] = "<li >";
		$config['next_tagl_close'] = "</li>";
		$config['prev_tag_open'] = "<li>";
		$config['prev_tagl_close'] = "</li>";
		$config['first_tag_open'] = "<li>";
		$config['first_tagl_close'] = "</li>";
		$config['last_tag_open'] = "<li>";
		$config['last_tagl_close'] = "</li>";

		$config['first_link']='<span class="glyphicon glyphicon-chevron-left"></span> Pertama ';
		$config['last_link']='Terakhir <span class="glyphicon glyphicon-chevron-right"></span> ';
		$config['next_link']='<span class="glyphicon glyphicon-chevron-right"></span> ';
		$config['prev_link']='<span class="glyphicon glyphicon-chevron-left"></span> ';
		$pagg = $this->pagination->initialize($config);
		return $pagg;
	}
	public function viewfasilitas(){
		$id = $this->uri->segment(4);
		$data = array(
				'title'   => 'Detail Berita',
				'content' => $this->m_main->whereData('content', array('id_content' => $id))->row(),
				'terkait' => $this->m_main->getData_sort('content','6','tgl_terbit','ASC', array('kategori' => 'berita'))->result(),
			);
		$this->parser->parse("fasilitas/viewfasilitas.tpl",$data);
	}
	public function daftar(){
		 // validasi form
        $this->form_validation->set_rules('nama_depan', 'Nama depan', 'trim|required');
        $this->form_validation->set_rules('nama_belakang', 'Nama Belakang', 'trim|required');
        $this->form_validation->set_rules('nik', 'NIK', 'trim|required');
        $this->form_validation->set_rules('no_telepon', 'Nomor Telepon', 'trim|required');
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email|is_unique[daftar.email]');
        $this->form_validation->set_rules('password', 'Password', 'trim|required');
        $this->form_validation->set_rules('captcha', 'check Captcha and', 'trim|callback_check_captcha|required');
       	$this->form_validation->set_error_delimiters('<div class="text-danger">', '</div>');

        if ($this->form_validation->run() == FALSE){
        	$data = array(
					'title'     	   => 'Form Pendaftaran',
					'fasilitas' 	   => $this->m_main->getData_sort('content','4','tgl_terbit','DESC', array('kategori !=' => 'S'))->result(),
					'captcha' 		   => $this->recaptcha->getWidget(), // menampilkan recaptcha
	            	'script_captcha'   => $this->recaptcha->getScriptTag(), // javascript recaptcha ditaruh di head $this->form_validation->run() == FALSE || 
	            	'getCaptcha' 	   => $this->create_captcha(),
				);
			$this->parser->parse("daftar/index.tpl",$data);
        }else{
        	 $this->load_daftar();
        }
		
	}

	public function load_daftar(){
		// $recaptcha = $this->input->post('g-recaptcha-response');
  //       $response = $this->recaptcha->verifyResponse($recaptcha);
  //       if (!isset($response['success']) || $response['success'] <> true) {
  //           echo "<script>alert('Lengkapi data terlebih dahulu');location.reload();</script>";
  //       } else {
        	$config = array(
			    'protocol' 		=> 'smtp',
			    'smtp_host' 	=> 'srv49.niagahoster.com',
	        	'smtp_port' 	=> '465',
			    'smtp_user' 	=> 'admin@sdm16ska.sch.id',
		    	'smtp_pass' 	=> 'sdm16ska',
			    'smtp_crypto' 	=> 'ssl', //can be 'ssl' or 'tls' for example
			    'mailtype' 		=> 'html',
			    'smtp_timeout' 	=> '4',
			    'charset' 		=> 'iso-8859-1',
			    'wordwrap' 		=> TRUE,
			    'crlf'          => '\r\n',      //should be "\r\n",
                'newline'       => '\r\n'   //should be "\r\n"
			);
			
		    $this->email->initialize($config);
			$kirim = $this->input->post('email');
			$cek_jml = $this->m_main->getData('daftar')->num_rows();
			
			$data = array(
			    'id_daftar'         => "CS-".date('dmY').FormatNoTrans($cek_jml),
				'nama_depan'        => $this->input->post('nama_depan'),
	            'nama_belakang'     => $this->input->post('nama_belakang'),
	            'nik'              	=> $this->input->post('nik'),
	            'no_telepon'        => $this->input->post('no_telepon'),
	            'email'             => $kirim,
	            'password'          => md5($this->input->post('password')),
	            'tgl_daftar'        => date('Y-m-d'),
	            'status'            => 'Belum Terverifikasi',
	            'pass'              => $this->input->post('password'),
			);
			$this->m_main->addData('daftar',$data);
			$htmlContent = '<h1>HTML email with attachment testing by CodeIgniter Email Library</h1>';
			$htmlContent .= '<p>You can attach the files in this email.</p>';
			$this->email->from('noreply@sdm16ska.sch.id', 'Konfirmasi Pendaftaran');
			$this->email->to($kirim);
			$this->email->cc('noreply@sdm16ska.sch.id');
			$this->email->bcc('noreply@sdm16ska.sch.id');

			$this->email->subject('Konfirmasi Pendaftaran');
			$this->email->message($this->mailtext($kirim));
			
			//$this->email->attach('files/attachment.pdf');

	        //$this->email->attach($output, 'application/pdf', 'output.pdf', false);
	        if($this->email->send()){
	        	$this->session->set_flashdata('message', 'anda berhasil menginput data');
				redirect(base_url('_lod/mload/vdata'));
            }else{
                $to = $this->input->post('email');
                mail($to, 'test', 'Other sent option failed');
                echo $this->input->post('email');
                show_error($this->email->print_debugger());
            }
	    //}

	}
	public function vdata(){
		//$cek = $this->m_main->whereData('daftar',array('email' => $id));
		$data = array(
				'title' => 'Pendaftaran',
				'kon'   => konfirm('konfirmasi'),
			);
		//if ($cek->num_rows()==1) {
			$this->parser->parse("daftar/sukses.tpl",$data);
		//}else{
		//	redirect(base_url('_lod/mload/daftar'),'refresh');
		//}
		
	}
	public function mailtext($id){
		$cek = $this->m_main->whereData('daftar',array('email' => $id))->row();
		$kon = konfirm('konfirmasi');
		return "
			<html>
				<body style='margin:0'>
				<table width='100%'>
						<tr>
							<td style='height:140px;background-color:1098F7;border-radius:5px 5px 0 0;color:#39304A;'>
								<h1>".get_metsos('logo')."</h1></center>
							</td>
						</tr>
						<tr style='background-color:#BDD4E7;'>
							<td><br/>
								<center><h3 style='color:#212227'>SELAMAT ANDA SUDAH TERDAFTAR</h3></center>
								<table align='center'>
									<tr>
										<td>Nomer id pendaftar</td><td width='5%'>:</td><td>".$cek->id_daftar."</td>
									</tr>
									<tr>
										<td>Biaya yang perlu dibayarkan</td><td width='5%'>:</td><td>".$kon[0]."</td>
									</tr>
									<tr>
										<td>Nama bank</td><td width='5%'>:</td><td>".$kon[0]."</td>
									</tr>
									<tr>
										<td>Nama pemegang rekening</td><td width='5%'>:</td><td>".$kon[1]."</td>
									</tr>
									<tr>
										<td>Nama kontak Person</td><td width='5%'>:</td><td>".$kon[2]."</td>
									</tr>
									<tr>
										<td>Nomor WA untuk konfirmasi</td><td width='5%'>:</td><td>".$kon[3]."</td>
									</tr>
								</table><br/>
							</td>
						</tr>
						<tr>
							<td style='height:180px;background-color:#212227;border-radius:0 0 5px 5px;'></td>
						</tr>
					</table>
				</body>
			</html>
		";
	}
	public function kirim(){
		$config = array(
		    'protocol' 		=> 'smtp',
		    'smtp_host' 	=> 'srv49.niagahoster.com',
        	'smtp_port' 	=> 465,
		    'smtp_user' 	=> 'admin@sdm16ska.sch.id',
	    	'smtp_pass' 	=> 'sdm16ska',
		    'smtp_crypto' 	=> 'ssl', //can be 'ssl' or 'tls' for example
		    'mailtype' 		=> 'html',
		    'smtp_timeout' 	=> '4',
		    'charset' 		=> 'iso-8859-1',
		    'wordwrap' 		=> TRUE
		);
		$this->email->initialize($config);
		$this->email->from('noreply@sdm16ska.sch.id', 'Konfirmasi Pendaftaran');
		$this->email->to("yunita.ardiyanto@gmail.com");
		$this->email->subject('Test Email (Attachment)');

		$htmlContent = '<h1>HTML email with attachment testing by CodeIgniter Email Library</h1>';
		$htmlContent .= '<p>You can attach the files in this email.</p>';
		$this->email->message($htmlContent);
		$this->email->send(); 
	}
	public function create_captcha(){
		$vals = array(
                'img_path'=>'./captcha/', #folder captcha yg sudah dibuat tadi
		        'img_url'=>base_url('captcha'), #ini arahnya juga ke folder captcha
		        'img_width'=>'145', #lebar image captcha
		        'img_height'=>'45', #tinggi image captcha
		        'expiration'=>7200, #waktu expired
		        'font_path' => FCPATH . 'assets/font/coolvetica.ttf', #load font jika mau ganti fontnya
		        'pool' => '0123456789', #tipe captcha (angka/huruf, atau kombinasi dari keduanya)
		 
		        # atur warna captcha-nya di sini ya.. gunakan kode RGB
		        'colors' => array(
		                'background' => array(242, 242, 242),
		                'border' => array(255, 255, 255),
		                'text' => array(0, 0, 0),
		                'grid' => array(255, 40, 40))
            );
 
            // create captcha image
            $cap = create_captcha($vals);
 
            // store image html code in a variable
            $image = $cap['image'];
 
            // store the captcha word in a session
            $this->session->set_userdata('mycaptcha', $cap['word']);

            return $image;
	}
	public function check_captcha(){
		$captcha = $this->input->post('captcha'); #mengambil value inputan pengguna
		$word = $this->session->userdata('mycaptcha'); #mengambil value captcha
		if (isset($captcha)) { #cek variabel $captcha kosong/tidak
		   if (strtoupper($captcha)==strtoupper($word)) { #proses pencocokan captcha
		        return TRUE;
		   }
		 }
	}
	
}

