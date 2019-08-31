<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller {

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
            $this->parser->parse("index.tpl",$data);    

    }
    public function verivikasi(){
        $data = array(
                'title' => 'Form data verifikasi',
                'username' => $this->session->userdata('username'),
            );
        $this->parser->parse("verifikasi.tpl",$data);
    }
    public function tampil_daftar(){
        $list = $this->m_main->show_data_order('daftar','tgl_daftar','DESC');
         $data = array();
         $no = 0;

         foreach ($list->result() as $k) {
             if ($this->getStatus_Data($k->id_daftar)) {
                 $getlink = '<a href="'.base_url('_admin/main/user_update/'.$k->id_daftar).'">'.$k->nama_depan.' '.$k->nama_belakang.'</a>';
             }else{
                $getlink = $k->nama_depan.' '.$k->nama_belakang;
             }
             $row = array();
             $no++;
             $row['no']                 = $no;
             $row['nama']               = $getlink;
             $row['nik']                = $k->nik; 
             $row['no_telepon']         = $k->no_telepon;
             $row['tgl_daftar']         = tgl_indo($k->tgl_daftar);
             $row['status']             = $k->status;
             $row['pass']               = $k->pass;
             $row['action']             = "<center>
                                        <span class='btn btn-danger btn-flat btn-sm' data-toggle='tooltip' onclick='hpsdt(".'"'.$k->id_daftar.'"'.")' title='hapus data'><i class='fa fa-trash-o'></i></span>
                                        <span class='btn btn-warning btn-flat btn-sm' OnClick='show_modal(".'"'.$k->id_daftar.'"'.")' data-target='#myModal' data-toggle='modal' title='edit data'><i class='fa fa-edit'></i></span>
                                        <span class='btn btn-info btn-flat btn-sm' OnClick='aktivasi(".'"'.$k->id_daftar.'"'.")' data-toggle='tooltip' title='verifikasi Data'><i class='fa fa-check'></i></span>
                                        </center>";
             $data[]=$row;
             //<a href='dttmmn/".$k->id_apotek."'><span class='btn btn-primary btn-flat btn-sm' data-toggle='tooltip'  title='detail data'><i class='fa fa-search'></i></span></a>
         }
         $output = array("data" => $data,);
         echo json_encode($output);
    }
    public function hapusdata(){
        $id = $this->input->post("id");
        $where = array('id_daftar' => $id);
        $cek = $this->m_main->deleteData('daftar', $where);
        $this->m_main->deleteData('ayah', $where);
        $this->m_main->deleteData('ibu', $where);
        $this->m_main->deleteData('calon_siswa', $where);
        $this->m_main->deleteData('biaya', $where);
        $this->m_main->deleteData('wali', $where);
        if ($cek>=1){
            echo json_encode(array("status" => TRUE));    
        }else{
            echo json_encode(array("status" => FALSE));
        }
    }
    public function show_modal(){
        $id   = $this->input->post("id");
        $k = $this->m_main->getDatasortir('daftar',array('id_daftar' => $id))->row();
        $data = array();
        $data['id_daftar']       = $k->id_daftar;
        $data['nama_depan']      = $k->nama_depan;
        $data['nama_belakang']   = $k->nama_belakang;
        $data['nik']             = $k->nik;
        $data['no_telepon']      = $k->no_telepon;
        $data['email']           = $k->email;
        echo json_encode($data);
    }
    public function aktivasi(){
        $id = $this->input->post("id");
        $where = array('id_daftar' => $id);
        $data = array('status' => 'Terverifikasi');
        $cek = $this->m_main->updateData('daftar',$data, $where);
        if ($cek>=1){
            echo json_encode(array("status" => TRUE));    
        }else{
            echo json_encode(array("status" => FALSE));
        }
    }
    public function updatedata(){
        if (empty($this->input->post("password"))) {
            $data = array(
                'nama_depan'    => $this->input->post("ndepan"),
                'nama_belakang' => $this->input->post("nbelakang"),
                'nik'           => $this->input->post("nik"),
                'no_telepon'    => $this->input->post("notelp"),
                'email'         => $this->input->post("email"),
                );
        }else{
            $data = array(
                'nama_depan'    => $this->input->post("ndepan"),
                'nama_belakang' => $this->input->post("nbelakang"),
                'nik'           => $this->input->post("nik"),
                'no_telepon'    => $this->input->post("notelp"),
                'email'         => $this->input->post("email"),
                'password'      => md5($this->input->post("password")),
                'pass'          => $this->input->post("password"),
                );
            
        }
        $this->m_main->updateData('daftar',$data,array('id_daftar' => $this->input->post("id_daftar")));
        echo json_encode(array("status" => TRUE));
    }
    public function user_update(){
        $id   = $this->uri->segment(4);
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
                    'title'              => 'Form data verifikasi',
                    'tmed_ayah'          => $this->m_main->getDatasortir('ayah',array('id_daftar' => $id))->row(),
                    'getname_ayah'       => getname('ayah',array('id_daftar' => $id)),
                    'getalamat_ayah'     => getalamat('ayah',array('id_daftar' => $id)), 
                    'dstatus_ayah'       => getstatus(array('id_daftar' => $id)),
                    'dfinalisasi_ayah'   => finalisasi(array('id_daftar' => $id)),
                    'message'            => $this->session->userdata('message'),

                    'tmed_ibu'        => $this->m_main->getDatasortir('ibu',array('id_daftar' => $id))->row(),
                    'getname_ibu'     => getname('ibu',array('id_daftar' => $id)),
                    'getalamat_ibu'   => getalamat('ibu',array('id_daftar' => $id)), 
                    'dstatus_ibu'     => getstatus(array('id_daftar' => $id)),
                    'dfinalisasi_ibu' => finalisasi(array('id_daftar' => $id)),

                    'tmed_cs'      => $this->m_main->getDatasortir('calon_siswa',array('id_daftar' => $id))->row(),
                    'getname_cs'   => getname('calon_siswa',array('id_daftar' => $id)),
                    'dstatus_cs' => getstatus(array('id_daftar' => $id)),
                    'dfinalisasi_cs' => finalisasi(array('id_daftar' => $id)),

                    'setting_biaya'     => tm_biaya('biaya')->result(),
                    'setting_dua_biaya' => tm_biaya('spp')->result(),
                    'tmed_biaya'        => $this->m_main->getDatasortir('biaya',array('id_daftar' => $id))->row(),
                    'dstatus_biaya'     => getstatus(array('id_daftar' => $id)),
                    'dfinalisasi_biaya' => finalisasi(array('id_daftar' => $id)),
                    'cek_biaya'         => get_biaya('biaya',array('id_daftar' => $id)),
                    'username' => $this->session->userdata('username'),
                    
                    'wali'              => $this->m_main->getDatasortir('wali',array('id_daftar' => $id))->row(),
                    'getname_wali'      => getname('wali',array('id_daftar' => $id)),
                );
            $this->parser->parse("user/index.tpl",$data);
        }else{
            $this->ayah_datapost();
        }
    }
    public function ayah_datapost(){
        $id   = $this->uri->segment(4);
        $data = array(
                'id_daftar'    => $id,
                'nama'         => $this->input->post('ndepan').','.$this->input->post('ntengah').','.$this->input->post('nbelakang'),
                'tmp_lahir'    => $this->input->post('tmp_lahir'),
                'tgl_lahir'    => date('Y-m-d'),//$this->input->post('tgl_lahir'),
                'nik'          => $this->input->post('nik'),
                'alamat'       => $this->input->post('rt').','.$this->input->post('rw').','.$this->input->post('dusun').','.$this->input->post('desa').','.$this->input->post('kac').','.$this->input->post('kab'),
                'pekerjaan'    => $this->input->post('pekerjaan'),
            );
        $this->m_main->updateData('ayah',$data,array('id_daftar' => $id));
        $this->session->set_flashdata('message', 'Data berhasil diupdate');
        redirect(base_url('_admin/main/user_update/'.$id), 'refresh');
    }
    public function ibu_datapost(){
        $id   = $this->uri->segment(4);
        $data = array(
                'id_daftar' => $id,
                'nama'      => $this->input->post('ndepan').','.$this->input->post('ntengah').','.$this->input->post('nbelakang'),
                'tmp_lahir' => $this->input->post('tmp_lahir'),
                'tgl_lahir' => date('Y-m-d'),//$this->input->post('tgl_lahir'),
                'nik'       => $this->input->post('nik'),
                'alamat'    => $this->input->post('rt').','.$this->input->post('rw').','.$this->input->post('dusun').','.$this->input->post('desa').','.$this->input->post('kac').','.$this->input->post('kab'),
                'pekerjaan' => $this->input->post('pekerjaan'),
            );
        $this->m_main->updateData('ibu',$data,array('id_daftar' => $id));
        $this->session->set_flashdata('message', 'Data berhasil diupdate');
        redirect(base_url('_admin/main/user_update/'.$id), 'refresh');
    }
    public function ck_datapost(){
        $id   = $this->uri->segment(4);
        $data = array(
                'id_daftar'     => $this->session->userdata('idlog'),
                'nama'          => $this->input->post('ndepan').','.$this->input->post('ntengah').','.$this->input->post('nbelakang'),
                'tmp_lahir'     => $this->input->post('tmp_lahir'),
                'tgl_lahir'     => $this->input->post('tgl_lahir'),
                'nik'           => $this->input->post('nik'),
                'jenis_kelamin' => $this->input->post('jns_kelamin'),
                'tinggi_badan'  => $this->input->post('tbadan'),
                'berat_badan'   => $this->input->post('bbadan'),
                'kondisi'       => $this->input->post('kondisi'),
                'mbaca'         => $this->input->post('mbaca'),
                'mhitung'       => $this->input->post('mhitung'),
                'malquran'      => $this->input->post('malquran'),
                'kebutuhan'     => $this->input->post('lebih'),
                'asal_sekolah'  => $this->input->post('asals'),
                
            );
        $this->m_main->updateData('calon_siswa',$data,array('id_daftar' => $id));
        $this->session->set_flashdata('message', 'Data berhasil diupdate');
        redirect(base_url('_admin/main/user_update/'.$id), 'refresh');
    }
    public function biaya_datapost(){
        $id   = $this->uri->segment(4);
        if ($this->input->post('lebih') != 0 ) {
            $sumbangan = $this->input->post('lebih');
        }else{
            $sumbangan = $this->input->post('sumbangan');
        }
        $data = array(
                'id_daftar'     => $id,
                'sumbangan'     => $sumbangan,
                'uang_seragan'  => $this->input->post('uang_seragan'),
                'uang_spp'      => $this->input->post('uang_spp'),
                'uang_kegiatan' => $this->input->post('uang_kegiatan'),
                'uang_buku'     => $this->input->post('uang_buku'),
                
            );
        $this->m_main->updateData('biaya',$data,array('id_daftar' => $id));
        $this->session->set_flashdata('message', 'Data berhasil diupdate');
        redirect(base_url('_admin/main/user_update/'.$id), 'refresh');
    }
    
    public function wali_datapost(){
        $id   = $this->uri->segment(4);
        $data = array(
                'nama'        => $this->input->post('ndepan').','.$this->input->post('ntengah').','.$this->input->post('nbelakang'),
                'nik'         => $this->input->post('nik'),
                'hubungan'    => $this->input->post('hubungan'),
                'pekerjaan'   => $this->input->post('pekerjaan'),
                'no_hp'       => $this->input->post('no_hp'),
                'no_telp'     => $this->input->post('no_telp'),
                'pendidikan'  => $this->input->post('pendidikan'),
            );
        $this->m_main->updateData('wali',$data,array('id_daftar' => $id));
        $this->session->set_flashdata('message', 'Data wali berhasil diupdate');
        redirect(base_url('_admin/main/user_update/'.$id), 'refresh');
    }

    public function cetak(){
        $data = array(
            'siswa' => $this->m_main->getData('calon_siswa')->result(),
            'getsiswa' => getnames('calon_siswa'),
            'username' => $this->session->userdata('username'),

        );

        $this->parser->parse('report/datasiswa.tpl', $data);
        $html = $this->output->get_output();
        $this->load->library('dompdf_gen');
        $this->dompdf->set_paper('A4');
        $this->dompdf->load_html($html);
        //$font = $this->dompdf->getFontMetrics()->get_font("helvetica", "bold");
        //$this->dompdf->getCanvas()->page_text(72, 18, "Header: {PAGE_NUM} of {PAGE_COUNT}", $font, 10, array(0,0,0));
        $this->dompdf->render();
        $this->dompdf->stream("Data Calon Siswa.pdf", array('Attachment' => false));
    }
    public function getStatus_Data($id_daftar){
        $siswa = $this->m_main->getDatasortir('calon_siswa',array('id_daftar' => $id_daftar))->num_rows();
        $ayah  = $this->m_main->getDatasortir('ayah',array('id_daftar' => $id_daftar))->num_rows();
        $ibu   = $this->m_main->getDatasortir('ibu',array('id_daftar' => $id_daftar))->num_rows();
        $biaya = $this->m_main->getDatasortir('biaya',array('id_daftar' => $id_daftar))->num_rows();
        if ($siswa==1 AND $ayah==1 AND $ibu==1 AND $biaya ==1) {
            return TRUE;
        }
    }
    public function daftar(){
         // validasi form
        $this->form_validation->set_rules('nama_depan', 'Nama depan', 'trim|required');
        $this->form_validation->set_rules('nama_belakang', 'Nama Belakang', 'trim|required');
        $this->form_validation->set_rules('nik', 'NIK', 'trim|required');
        $this->form_validation->set_rules('no_telepon', 'Nomor Telepon', 'trim|required');
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
        $this->form_validation->set_rules('password', 'Password', 'trim|required');
        if ($this->form_validation->run() == FALSE){
            $data = array(
                'title' => 'Form Pendaftaran',
                'username' => $this->session->userdata('username'),
                'message'  => $this->session->userdata('message'),
            );
            $this->parser->parse("pendaftaran/index.tpl",$data);   
        }else{
             $this->load_daftar();
        }
        
    }
    public function load_daftar(){
            $config = array(
                'protocol'      => 'smtp',
                'smtp_host'     => 'srv49.niagahoster.com',
                'smtp_port'     => '465',
                'smtp_user'     => 'admin@sdm16ska.sch.id',
                'smtp_pass'     => 'sdm16ska',
                'smtp_crypto'   => 'ssl', //can be 'ssl' or 'tls' for example
                'mailtype'      => 'html',
                'smtp_timeout'  => '4',
                'charset'       => 'iso-8859-1',
                'wordwrap'      => TRUE,
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
                'nik'               => $this->input->post('nik'),
                'no_telepon'        => $this->input->post('no_telepon'),
                'email'             => $kirim,
                'password'          => md5($this->input->post('password')),
                'tgl_daftar'        => date('Y-m-d'),
                'status'            => 'Terverifikasi',
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

            if($this->email->send()){
                $this->session->set_flashdata('message', 'Input data telah berhasil');
                redirect(base_url('_admin/main/daftar'));
            }else{
                $to = $this->input->post('email');
                mail($to, 'test', 'Other sent option failed');
                echo $this->input->post('email');
                show_error($this->email->print_debugger());
            }
    }
    public function mailtext($id){
        $cek = $this->m_main->getDatasortir('daftar',array('email' => $id))->row();
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
                                <center><h3 style='color:#212227'; padding-bottom:10px;>SELAMAT ANDA SUDAH TERDAFTAR</h3></center>
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
                            <td style='height:80px;background-color:#212227;border-radius:0 0 5px 5px;'><center style='color:white'>copyright 2017</center></td>
                        </tr>
                    </table>
                </body>
            </html>
        ";
    }
    
    public function reset_ulang(){
        $this->m_main->clear();
            redirect(base_url('_admin/main/verivikasi'), 'refresh');   
        
    }
    
	
}
