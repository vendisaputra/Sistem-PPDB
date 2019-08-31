<?php

defined('BASEPATH') OR exit('No direct script access allowed');



class Content extends CI_Controller {



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
	public function prestasi(){
		$from = $this->uri->segment(4);
		$jumlah_data = $this->m_main->whereData('content', array('kategori' => 'prestasi'))->num_rows();
		$this->paggi('_lod/mload/prestasi',$jumlah_data,3);
		
		$data = array(
				'title'       => 'Page Prestasi',
				'content'     => $this->m_main->search_get_data('content', array('kategori' => 'prestasi'),3,$from,'tgl_terbit','DESC')->result(),
				'terkait'     => $this->m_main->getData_sort('content','4','tgl_terbit','DESC', array('kategori !=' => 'prestasi'))->result(),
				'pagination'  => $this->pagination->create_links(),
			);
		$this->parser->parse("prestasi/prestasi.tpl",$data);
	}
	public function viewprestasi(){
		$id = $this->uri->segment(4);
		$data = array(
				'title'   => 'Detail Prestasi',
				'content' => $this->m_main->whereData('content', array('id_content' => $id))->row(),
				'terkait' => $this->m_main->getData_sort('content','6','tgl_terbit','ASC', array('kategori' => 'berita'))->result(),
			);

		$this->parser->parse("prestasi/viewprestasi.tpl",$data);

	}
	public function ekstrakulikuler(){
		$from = $this->uri->segment(4);
		$jumlah_data = $this->m_main->whereData('content', array('kategori' => 'ekstrakulikuler'))->num_rows();
		$this->paggi('_lod/mload/ekstrakulikuler',$jumlah_data,10);

		$data = array(
				'title'      => 'Ekstrakulikuler',
				'content'    => $this->m_main->search_get_data('content', array('kategori' => 'ekstrakulikuler'),10,$from,'tgl_terbit','DESC')->result(),
				'terkait'     => $this->m_main->getData_sort('content','4','tgl_terbit','DESC', array('kategori !=' => 'ekstrakulikuler'))->result(),
				'pagination' => $this->pagination->create_links(),
			);
		$this->parser->parse("ekstrakulikuler/ekstrakulikuler.tpl",$data);
	}

	public function viewekstrakulikuler(){
		$id = $this->uri->segment(4);
		$data = array(
				'title'   => 'Detail Ekstrakulikuler',
				'content' => $this->m_main->whereData('content', array('id_content' => $id))->row(),
				'terkait' => $this->m_main->getData_sort('content','4','tgl_terbit','ASC', array('kategori' => 'fasilitas'))->result(),
			);
		$this->parser->parse("ekstrakulikuler/viewekstrakulikuler.tpl",$data);

	}
		public function viewfasilitas(){
		$id = $this->uri->segment(4);
		$data = array(
				'title'   => 'Detail Ekstrakulikuler',
				'content' => $this->m_main->whereData('content', array('id_content' => $id))->row(),
				'terkait' => $this->m_main->getData_sort('content','4','tgl_terbit','ASC', array('kategori' => 'fasilitas'))->result(),
			);
		$this->parser->parse("ekstrakulikuler/viewekstrakulikuler.tpl",$data);

	}

    public function viewberita(){
		$id = $this->uri->segment(4);
		$data = array(
				'title'   => 'Detail Berita',
				'content' => $this->m_main->whereData('content', array('id_content' => $id))->row(),
				'terkait' => $this->m_main->getData_sort('content','4','tgl_terbit','ASC', array('kategori' => 'berita'))->result(),
			);
		$this->parser->parse("berita/dt_berita.tpl",$data);
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
	public function visimisi(){
    	$data = array(
				'title'   => 'Visi Misi',
				'terkait' => $this->m_main->getData_sort('content','6','tgl_terbit','ASC', array('kategori' => 'fasilitas'))->result(),	
				'visi'    => $this->m_main->whereData('sekolah', array('header' => 'visi'))->row(),
				'misi'    => $this->m_main->whereData('sekolah', array('header' => 'misi'))->row(),
			);
		$this->parser->parse("fasilitas/vimi.tpl",$data);
	}
	public function tentang_kami(){
    	$data = array(
				'title'   => 'Visi Misi',
				'terkait' => $this->m_main->getData_sort('content','6','tgl_terbit','ASC', array('kategori' => 'berita'))->result(),	
				'tentang' => $this->m_main->whereData('sekolah', array('id_s' => 3))->row(),
			);
		$this->parser->parse("fasilitas/tentang.tpl",$data);
	}
}



