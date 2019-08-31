<?php

defined('BASEPATH') OR exit('No direct script access allowed');



class Tugas extends CI_Controller {



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

		$from = $this->uri->segment(4);

		$jumlah_data = $this->m_main->show_data_order('tugas','tanggal_upload','DESC')->num_rows();

		$this->paggi('_lod/tugas/index/',$jumlah_data,10);

		

		$data = array(

				'title'      => 'Page tugas',

				'tugas' 	 => $this->m_main->searchGet('tugas',10,$from,'tanggal_upload','DESC')->result(),

				'fasilitas'  => $this->m_main->getData_sort('content','6','tgl_terbit','DESC', array('kategori' => 'fasilitas'))->result(),

				'pagination' => $this->pagination->create_links(),

			);

		$this->parser->parse("tugas/index.tpl",$data);

	}

	public function view(){

		$id = $this->uri->segment(4);

		$data = array(

				'title'   => 'Detail tugas',

				'tugas' => $this->m_main->whereData('tugas', array('id_tugas' => $id))->row(),

				'terkait' => $this->m_main->getData_sort('content','6','tgl_terbit','ASC', array('kategori' => 'berita'))->result(),

			);

		$this->parser->parse("tugas/db_view.tpl",$data);

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

}



