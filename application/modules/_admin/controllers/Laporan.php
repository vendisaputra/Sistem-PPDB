<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Laporan extends CI_Controller {

	function __construct(){

		
		parent::__construct();	

		$this->load->model('modalmain');
    if($this->session->userdata('status') != "loginadmin" AND !$this->session->userdata('username')){
        redirect(base_url("_admin/aut_login/"));
    }

		


	}
	
	function index(){
		
		
		 // Load plugin PHPExcel nya
    include APPPATH.'third_party/PHPExcel/PHPExcel.php';
    
    // Panggil class PHPExcel nya
    $excel = new PHPExcel();

    // Settingan awal fil excel
    $excel->getProperties()->setCreator('SD 16 Muhammadiyah')
                 ->setLastModifiedBy('SD 16 Muhammadiyah')
                 ->setTitle("Data Pendaftar")
                 ->setSubject("Pendaftar")
                 ->setDescription("Laporan Semua Data Pendaftar")
                 ->setKeywords("Data Pendaftar");

    // Buat sebuah variabel untuk menampung pengaturan style dari header tabel
    $style_col = array(
      'font' => array('bold' => true), // Set font nya jadi bold
      'alignment' => array(
        'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, // Set text jadi ditengah secara horizontal (center)
        'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
      ),
      'borders' => array(
        'top' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border top dengan garis tipis
        'right' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),  // Set border right dengan garis tipis
        'bottom' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border bottom dengan garis tipis
        'left' => array('style'  => PHPExcel_Style_Border::BORDER_THIN) // Set border left dengan garis tipis
      )
    );

    // Buat sebuah variabel untuk menampung pengaturan style dari isi tabel
    $style_row = array(
      'alignment' => array(
        'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
      ),
      'borders' => array(
        'top' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border top dengan garis tipis
        'right' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),  // Set border right dengan garis tipis
        'bottom' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border bottom dengan garis tipis
        'left' => array('style'  => PHPExcel_Style_Border::BORDER_THIN) // Set border left dengan garis tipis
      )
    );

    $excel->setActiveSheetIndex(0)->setCellValue('A1', "Data Pendaftar"); // Set kolom A1 dengan tulisan "DATA SISWA"
    $excel->getActiveSheet()->mergeCells('A1:AL1'); // Set Merge Cell pada kolom A1 sampai E1
    $excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE); // Set bold kolom A1
    $excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15); // Set font size 15 untuk kolom A1
    $excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER); // Set text center untuk kolom A1

    // Buat header tabel nya pada baris ke 3
    $excel->setActiveSheetIndex(0)->setCellValue('A3', "NO"); // Set kolom A3 dengan tulisan "NO"
    $excel->setActiveSheetIndex(0)->setCellValue('B3', "No Pendaftaran"); // 
    $excel->setActiveSheetIndex(0)->setCellValue('C3', "Nama Ayah"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('D3', "Tempat Lahir"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('E3', "Tanggal Lahir"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('F3', "NIK"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('G3', "Alamat"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('H3', "No Hp"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('I3', "No Telepon"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('J3', "Pendidikan"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('K3', "Pekerjaan"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('L3', "Nama Ibu"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('M3', "Tempat Lahir"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('N3', "Tanggal Lahir"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('O3', "NIK"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('P3', "Alamat"); // Set kolom E3 dengan tulisan "ALAMA"
    $excel->setActiveSheetIndex(0)->setCellValue('Q3', "No Hp"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('R3', "No Telepon"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('S3', "Pendidikan"); // Set kolom E3 dengan tulisan "AL
    $excel->setActiveSheetIndex(0)->setCellValue('T3', "Pekerjaan");
    $excel->setActiveSheetIndex(0)->setCellValue('U3', "Nama Wali"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('V3', "NIK"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('W3', "Hubungan"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('X3', "No Hp"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('Y3', "No Telepon"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('Z3', "Pendidikan"); // Set kolom E3 dengan tulisan "AL"
    $excel->setActiveSheetIndex(0)->setCellValue('AA3', "Pekerjaan");

    $excel->setActiveSheetIndex(0)->setCellValue('AB3', "Nama Siswa"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('AC3', "Tempat Lahir"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('AD3', "Tanggal Lahir"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('AE3', "Alamat Tinggal"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('AF3', "NIK"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('AG3', "Jenis Kelamin"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('AH3', "Tinggi Badan");
    $excel->setActiveSheetIndex(0)->setCellValue('AI3', "Berat Badan"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('AJ3', "Kondisi"); // Set kolom E3 dengan tulisan "ALAMAT
    $excel->setActiveSheetIndex(0)->setCellValue('AK3', "Keterangan"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('AL3', "Asal Sekolah"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('AM3', "Kemampuan Membaca Latin"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('AN3', "Kemampuan Berhitung"); // Set kolom E3 dengan tulisan "ALAMAT"
    $excel->setActiveSheetIndex(0)->setCellValue('AO3', "Kemampuan Membaca iqra'/Al Quran"); // Set kolom E3 dengan tulisan "ALAMAT"

    // Apply style header yang telah kita buat tadi ke masing-masing kolom header
    $excel->getActiveSheet()->getStyle('A3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('B3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('C3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('D3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('E3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('F3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('G3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('H3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('I3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('J3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('K3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('L3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('M3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('N3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('O3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('P3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('Q3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('R3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('S3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('T3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('U3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('V3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('W3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('X3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('Y3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('Z3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AA3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AB3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AC3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AD3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AE3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AF3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AG3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AH3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AI3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AJ3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AK3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AL3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AM3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AN3')->applyFromArray($style_col);
    $excel->getActiveSheet()->getStyle('AO3')->applyFromArray($style_col);
   
    

    // Panggil function view yang ada di SiswaModel untuk menampilkan semua data siswanya
    $pendaftar = $this->modalmain->getDatasortir("daftar", array('status' => 'Terverifikasi'))->result();

    $no = 1; // Untuk penomoran tabel, di awal set dengan 1
    $numrow = 4; // Set baris pertama untuk isi tabel adalah baris ke 4
    foreach($pendaftar as $data){ // Lakukan looping pada variabel siswa
    $ayah = $this->modalmain->getDatasortir("ayah", array('id_daftar' => $data->id_daftar))->result();
    $ibu = $this->modalmain->getDatasortir("ibu", array('id_daftar' => $data->id_daftar))->result();
    $wali = $this->modalmain->getDatasortir("wali", array('id_daftar' => $data->id_daftar))->result();
    $siswa = $this->modalmain->getDatasortir("calon_siswa", array('id_daftar' => $data->id_daftar))->result();
    $nayah = getname('ayah',array('id_daftar' => $data->id_daftar));
    $nibu = getname('ibu',array('id_daftar' => $data->id_daftar));
    $nwali = getname('wali',array('id_daftar' => $data->id_daftar));
    $nsiswa = getname('calon_siswa',array('id_daftar' => $data->id_daftar));
      $excel->setActiveSheetIndex(0)->setCellValue('A'.$numrow, $no);
      
     $excel->setActiveSheetIndex(0)->setCellValue('B'.$numrow, $data->id_daftar);

      foreach ($ayah as $ra) {
      	
      	  $nm = explode(',', $ra->nama);
          $alamat = explode(',', $ra->alamat);
         
         
        

      	  $excel->setActiveSheetIndex(0)->setCellValue('C'.$numrow, "$nayah[0] $nayah[1] $nayah[2]");
	      $excel->setActiveSheetIndex(0)->setCellValue('D'.$numrow, $ra->tmp_lahir);
	      $excel->setActiveSheetIndex(0)->setCellValue('E'.$numrow, date('d F Y', strtotime($ra->tgl_lahir)));
	      $excel->setActiveSheetIndex(0)->setCellValueExplicit('F'.$numrow, "$ra->nik", PHPExcel_Cell_DataType::TYPE_STRING);
	      $excel->setActiveSheetIndex(0)->setCellValue('G'.$numrow, "$alamat[2] Rt $alamat[0]/$alamat[1] $alamat[3], $alamat[4], $alamat[5]");
	      $excel->setActiveSheetIndex(0)->setCellValue('H'.$numrow, $ra->no_hp);
	      $excel->setActiveSheetIndex(0)->setCellValue('I'.$numrow, $ra->no_telp);
	      $excel->setActiveSheetIndex(0)->setCellValue('J'.$numrow, $ra->pendidikan);
	      $excel->setActiveSheetIndex(0)->setCellValue('K'.$numrow, $ra->pekerjaan);
      }
      foreach ($ibu as $ri) {
      	  $nmi = explode(',', $ri->nama);
          $alamat = explode(',', $ri->alamat);
      	  $excel->setActiveSheetIndex(0)->setCellValue('L'.$numrow, "$nibu[0] $nibu[1] $nibu[2]");
	      $excel->setActiveSheetIndex(0)->setCellValue('M'.$numrow, $ri->tmp_lahir);
	      $excel->setActiveSheetIndex(0)->setCellValue('N'.$numrow, date('d F Y', strtotime($ri->tgl_lahir)));
	      $excel->setActiveSheetIndex(0)->setCellValueExplicit('O'.$numrow, "$ri->nik", PHPExcel_Cell_DataType::TYPE_STRING);
	      $excel->setActiveSheetIndex(0)->setCellValue('P'.$numrow, "$alamat[2] Rt $alamat[0]/$alamat[1] $alamat[3], $alamat[4], $alamat[5]");
	      $excel->setActiveSheetIndex(0)->setCellValue('Q'.$numrow, $ri->no_hp);
	      $excel->setActiveSheetIndex(0)->setCellValue('R'.$numrow, $ri->no_telp);
	      $excel->setActiveSheetIndex(0)->setCellValue('S'.$numrow, $ri->pendidikan);
	      $excel->setActiveSheetIndex(0)->setCellValue('T'.$numrow, $ri->pekerjaan);
      }
	  foreach ($wali as $rw) {
      	  
      	  $excel->setActiveSheetIndex(0)->setCellValue('U'.$numrow, "$nwali[0] $nwali[1] $nwali[2]");
	      $excel->setActiveSheetIndex(0)->setCellValueExplicit('V'.$numrow, "$rw->nik", PHPExcel_Cell_DataType::TYPE_STRING);
	      $excel->setActiveSheetIndex(0)->setCellValue('W'.$numrow, $rw->hubungan);
	      $excel->setActiveSheetIndex(0)->setCellValue('X'.$numrow, $rw->no_hp);
	      $excel->setActiveSheetIndex(0)->setCellValue('Y'.$numrow, $rw->no_telp);
	      $excel->setActiveSheetIndex(0)->setCellValue('Z'.$numrow, $rw->pendidikan);
	      $excel->setActiveSheetIndex(0)->setCellValue('AA'.$numrow, $rw->pekerjaan);
	  }

       foreach ($siswa as $rs) {
      	  $nmi = explode(',', $rs->nama);
      	  $excel->setActiveSheetIndex(0)->setCellValue('AB'.$numrow, "$nsiswa[0] $nsiswa[1] $nsiswa[2]");
	      $excel->setActiveSheetIndex(0)->setCellValue('AC'.$numrow, $rs->tmp_lahir);
	      $excel->setActiveSheetIndex(0)->setCellValue('AD'.$numrow, $rs->alamat_tinggal);
	      $excel->setActiveSheetIndex(0)->setCellValue('AE'.$numrow, date('d F Y', strtotime($rs->tgl_lahir)));
	      $excel->setActiveSheetIndex(0)->setCellValueExplicit('AF'.$numrow, "$rs->nik", PHPExcel_Cell_DataType::TYPE_STRING);
	      $excel->setActiveSheetIndex(0)->setCellValue('AG'.$numrow, $rs->jenis_kelamin);
	      $excel->setActiveSheetIndex(0)->setCellValue('AH'.$numrow, $rs->tinggi_badan);
	      $excel->setActiveSheetIndex(0)->setCellValue('AI'.$numrow, $rs->berat_badan);
	      $excel->setActiveSheetIndex(0)->setCellValue('AJ'.$numrow, $rs->kondisi);
	      $excel->setActiveSheetIndex(0)->setCellValue('AK'.$numrow, $rs->kebutuhan);
	      $excel->setActiveSheetIndex(0)->setCellValue('AL'.$numrow, $rs->asal_sekolah);
	      $excel->setActiveSheetIndex(0)->setCellValue('AM'.$numrow, $rs->mbaca);
	      $excel->setActiveSheetIndex(0)->setCellValue('AN'.$numrow, $rs->mhitung);
	      $excel->setActiveSheetIndex(0)->setCellValue('AO'.$numrow, $rs->malquran);
	  }

      // Apply style row yang telah kita buat tadi ke masing-masing baris (isi tabel)
      $excel->getActiveSheet()->getStyle('A'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('B'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('C'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('D'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('E'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('F'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('G'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('H'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('I'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('J'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('K'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('L'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('M'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('N'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('O'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('P'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('Q'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('R'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('S'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('T'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('U'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('V'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('W'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('X'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('Y'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('Z'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AA'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AB'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AC'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AD'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AE'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AF'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AG'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AH'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AI'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AJ'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AK'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AL'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AM'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AN'.$numrow)->applyFromArray($style_row);
      $excel->getActiveSheet()->getStyle('AO'.$numrow)->applyFromArray($style_row);
      
     
    
      
      $no++; // Tambah 1 setiap kali looping
      $numrow++; // Tambah 1 setiap kali looping
    }

    // Set width kolom
    $excel->getActiveSheet()->getColumnDimension('A')->setWidth(5); // Set width kolom A
    $excel->getActiveSheet()->getColumnDimension('B')->setWidth(20); // Set width kolom B
    $excel->getActiveSheet()->getColumnDimension('C')->setWidth(40); // Set width kolom C
    $excel->getActiveSheet()->getColumnDimension('D')->setWidth(20); // Set width kolom D
    $excel->getActiveSheet()->getColumnDimension('E')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('F')->setWidth(40); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('G')->setWidth(50); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('H')->setWidth(25); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('I')->setWidth(40); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('J')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('K')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('L')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('M')->setWidth(50); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('N')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('O')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('P')->setWidth(40); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('Q')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('R')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('S')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('T')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('U')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('V')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('W')->setWidth(30); // Set width kolom E
   $excel->getActiveSheet()->getColumnDimension('X')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('Y')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('Z')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AA')->setWidth(50); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AB')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AC')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AD')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AE')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AF')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AG')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AH')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AI')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AH')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AK')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AL')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AM')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AN')->setWidth(30); // Set width kolom E
    $excel->getActiveSheet()->getColumnDimension('AO')->setWidth(40); // Set width kolom E
    
  
    
    // Set height semua kolom menjadi auto (mengikuti height isi dari kolommnya, jadi otomatis)
    $excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(-1);

    // Set orientasi kertas jadi LANDSCAPE
    $excel->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);

    // Set judul file excel nya
    $excel->getActiveSheet(0)->setTitle("Laporan Data Pendaftar");
    $excel->setActiveSheetIndex(0);

    // Proses file excel
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment; filename="Data Pendaftar.xlsx"'); // Set nama file excel nya
    header('Cache-Control: max-age=0');

    $write = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
    $write->save('php://output');
	}

}
?>