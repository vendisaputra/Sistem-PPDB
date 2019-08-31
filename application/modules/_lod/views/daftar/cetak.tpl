<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
 
<body>

		<style type="text/css">
			html,body{
				margin: 30px 30px 30px 40px; 
			}
			.ukuran_font{
				font-size:10pt;font-family: TimesNewRoman;
				margin-bottom: 0;
				margin-top: 0;
			}
		</style>
		<center><p style="font-size:9pt;font-weight:bold;margin:0; padding:2 0 0 0;">MAJELIS PENDIDIKAN DASAR DAN MENENGAH PIMPINAN DAERAH MUHAMMADIYAH SURAKARTA</p></center>
<table style="width:100%">
	<tr valign="middle">
		<td><img src="{base_url()}assets/user/img/MUHAMMADIYAH.png" alt="Logo" width="58%"></td>
		<td width="90%"><center>
			<h4 style="margin:0; padding:2 0 0 0;">SEKOLAH DASAR MUHAMMADIYAH 16</h4>
			<h5 style="margin:0; padding:2 0 0 0;">KARANGASEM- LAWEYAN- SURAKARTA</h5>
			<h5 style="margin:0; padding:2 0 0 0;">NSS : 104 036 101 045</h5>
			<p style="font-size:12px;font-weight:bold;margin:2 0 0 0; padding:0;">Karangasem Rt. 02 Rw. III telp. 0271- 740700 Surakarta. 57145</p>
			</center>
		</td>
	</tr>
</table>
<div style="border-top: 3px double #000;"></div><br>
<table style="width:100%">
	<tr valign="middle">
		<td></td>
		<td width="90%">
			<center>
				<strong>
					FORMULIR PENDATAAN SISWA BARU 20.../20...
				</strong>
			</center>

		</td>
	</tr>
</table>
<table width="100%">
	<tr>
		<td></td>
		<td width="30%"><div style="float: right;text-align:center;padding:1px 13px;font-size:14pt;border:2px solid #000;">{$siswa->jenis_kelamin}</div></td>
	</tr>
</table>
<ol type="A">
<h4 style="margin:0;font-weight: bold;"><li>Identitas Siswa</li></h4>
<table style="margin-left:9%;width:100%">
	<tr>
		<td width="3%"><p class="ukuran_font">1.</p></td>
		<td width="50%"><p class="ukuran_font">Nama Lengkap</p></td>
		<td width="3%"><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$getsiswa[0]} {$getsiswa[1]} {$getsiswa[2]}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">2.</p></td>
		<td><p class="ukuran_font">Jenis Kelamin</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$siswa->jenis_kelamin}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">3.</p></td>
		<td><p class="ukuran_font">Tempat & Tanggal Lahir</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$siswa->tmp_lahir}, {tgl_indo($siswa->tgl_lahir)}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">4.</p></td>
		<td><p class="ukuran_font">Alamat Tinggal</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$siswa->alamat_tinggal}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">5.</p></td>
		<td><p class="ukuran_font">Asal Sekolah</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$siswa->asal_sekolah}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">6.</p></td>
		<td><p class="ukuran_font">Tinggi Badan</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$siswa->tinggi_badan} cm</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">7.</p></td>
		<td><p class="ukuran_font">Berat Badan</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$siswa->berat_badan} kg</p></td>
	</tr><tr>
		<td><p class="ukuran_font">8.</p></td>
		<td><p class="ukuran_font">Kondisi</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$siswa->kondisi}</p></td>
	</tr>
</table>
<br / >
<br / >
<h4 style="margin:0;font-weight: bold;"><li> Identitas Orang Tua Kandung</li></h4>
<h5 style="margin:0;font-weight: bold;">1. Ayah</h5>

<table style="margin-left:9%;width:100%;">
	<tr>
		<td width="3%"><p class="ukuran_font">1.</p></td>
		<td width="50%"><p class="ukuran_font">Nama Ayah</p></td>
		<td width="3%"><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$getname[0]} {$getname[1]} {$getname[2]}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">2.</p></td>
		<td><p class="ukuran_font">Tempat & Tanggal Lahir</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$ayah->tmp_lahir}, {tgl_indo($ayah->tgl_lahir)}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">3.</p></td>
		<td><p class="ukuran_font">Alamat</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$getalamat[2]} Rt {$getalamat[0]}/{$getalamat[1]} {$getalamat[3]}, {$getalamat[4]}, {$getalamat[5]} </p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">4.</p></td>
		<td><p class="ukuran_font">No Telp / No Hp</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$ayah->no_telp} / {$ayah->no_hp} </p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">5.</p></td>
		<td><p class="ukuran_font">Pendidikan</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$ayah->pendidikan}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">6.</p></td>
		<td><p class="ukuran_font">Pekerjaan</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$ayah->pekerjaan}</p></td>
	</tr>
</table>
<br />
<h5 style="margin:0;font-weight: bold;">2. Ibu</h5>
<table style="margin-left:9%;width:100%;font-size: 15px;" cellspacing="0">
	<tr>
		<td width="3%" style="font-size:12pt;"><p class="ukuran_font">1.</p></td>
		<td width="50%" style="font-size:12pt;"><p class="ukuran_font">Nama Ibu</p></td>
		<td width="3%" style="font-size:12pt;"><p class="ukuran_font">:</p></td>
		<td style="font-size:12pt;"><p class="ukuran_font">{$getibu[0]} {$getibu[1]} {$getibu[2]}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">2.</p></td>
		<td><p class="ukuran_font">Tempat & Tanggal Lahir</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$ibu->tmp_lahir}, {tgl_indo($ibu->tgl_lahir)}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">3.</p></td>
		<td><p class="ukuran_font">Alamat</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$getaibu[2]} Rt {$getaibu[0]}/{$getaibu[1]} {$getaibu[3]}, {$getaibu[4]}, {$getaibu[5]}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">4.</p></td>
		<td><p class="ukuran_font">No Telp / No Hp</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$ibu->no_telp} / {$ibu->no_hp} </p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">5.</p></td>
		<td><p class="ukuran_font">Pendidikan</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$ibu->pendidikan}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">6.</p></td>
		<td><p class="ukuran_font">Pekerjaan</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$ibu->pekerjaan}</p></td>
	</tr>
</table>
<h4 style="margin:0;font-weight: bold;"><li>Wali Murid (Jika Ikut Wali Murid)</li></h4>
<table style="margin-left:9%;width:100%;font-size: 15px;" cellspacing="0">

	<tr>
		<td width="3%" style="font-size:12pt;"><p class="ukuran_font">1.</p></td>
		<td width="50%" style="font-size:12pt;"><p class="ukuran_font">Nama</p></td>
		<td width="3%" style="font-size:12pt;"><p class="ukuran_font">:</p></td>
		<td style="font-size:12pt;"><p class="ukuran_font">{$getwali[0]} {$getwali[1]} {$getwali[2]}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">2.</p></td>
		<td><p class="ukuran_font">Hubungan Keluarga</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$wali->hubungan}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">3.</p></td>
		<td><p class="ukuran_font">Pendidikan</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$wali->pendidikan}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">4.</p></td>
		<td><p class="ukuran_font">Pekerjaan</p></td>
		<td><p class="ukuran_font">:</p></td>
		<td><p class="ukuran_font">{$wali->pekerjaan}</p></td>
	</tr>
</table>
</ol>
<table width="100%">
	<tr>
		<td><div style="float:left;posistion:relative;">
<div style="font-size:10pt;font-weight:bold;">NOMOR PENDAFTARAN</div>
	<div style="text-align: center;padding: 1px 13px;border:2px solid #000;font-size: 14pt;">
		{$ibu->id_daftar}
	</div>
</div></td>
	</tr>
</table>

<div style="float: right;">
	<table width="100%" style="text-align: center;">
		<tr>
			<td></td>
			<td></td>
			<td width="30%">Surakarta,_________________</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td>Orang Tua / Wali</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td><div style="padding: 50px 80px;"></div><br/><br/></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<TD>.........................................</TD>
		</tr>
	</table>
</div>
<style>
    .tablestyle {
    border-collapse: collapse;
    width:100%;
    }
    
    .tablestyle td {
        border: 1px solid black;
        padding: 2px 5px 2px 5px;
    }
    .page_break { page-break-before: always; }
    .column {
    float: left;
    width: 30%;
    background-color:red;
}

/* Clear floats after the columns */
    .row:after {
    content: "";
    display: table;
    clear: both;
}
</style>
<br/><div class="page_break"></div>
<table style="font-size:11pt;">
    <tr>
        <td>Nama Anak</td>
        <td>:</td>
        <td>{$getsiswa[0]} {$getsiswa[1]} {$getsiswa[2]}</td>
    </tr>
    <tr>
        <td>No. Pendaftaran</td>
        <td>:</td>
        <td>{$ayah->id_daftar}</td>
    </tr>
    <tr>
        <td>Asal TK</td>
        <td>:</td>
        <td>{$siswa->asal_sekolah}</td>
    </tr>
</table>
<h4 style="margin:0 0 5px 2% ;font-weight: bold;">Rincian Biaya</h4>
<table style="margin-left:9%;width:100%;font-size: 15px;" class="tablestyle" cellspacing="0">

	<tr>
		<td width="3%" style="font-size:12pt;"><p class="ukuran_font">No</p></td>
		<td width="50%" style="font-size:12pt;" colspan="2"><p class="ukuran_font">Administrasi Siswa Baru</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">1.</p></td>
		<td><p class="ukuran_font">Seragam</p></td>
		<td><p class="ukuran_font">{rupiah($biaya->uang_seragan)}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">2.</p></td>
		<td><p class="ukuran_font">SPP</p></td>
		<td><p class="ukuran_font">{rupiah($biaya->uang_spp)}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">3.</p></td>
		<td><p class="ukuran_font">Iuran Pengembangan Sekolah</p></td>
		<td><p class="ukuran_font">{rupiah($biaya->uang_kegiatan)}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">4.</p></td>
		<td><p class="ukuran_font">Infaq Sekolah</p></td>
		<td><p class="ukuran_font">{rupiah($biaya->sumbangan)}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">5.</p></td>
		<td><p class="ukuran_font">Buku-buku Selama 1 tahun</p></td>
		<td><p class="ukuran_font">{rupiah($biaya->uang_buku)}</p></td>
	</tr>
	<tr>
		<td colspan="2"><p class="ukuran_font"><center>Jumlah</center></p></td>
		<td><p class="ukuran_font">Rp. {rupiah($biaya->uang_seragan+$biaya->uang_spp+$biaya->sumbangan+$biaya->uang_kegiatan+$biaya->uang_buku)}</p></td>
	</tr>
</table>

<div style="clear:both; position:relative;">
    
    <div style="margin-left:2%;font-size:12pt;">
        <table width="100%" border='0' style="text-align:left;" class="tablestyle">
            <tr>
                <td style="font-size:10pt;"><label>Catatan:</label>
                <ul type="1">
                    <li>Uang yang sudah dibayarkan tidak dapat diminta kembali</li>
                    <li>Daftar ulang maksimal 7hari setelah dinyatakan <u><b>Diterima</b></u> apabila dalam 7 hari tidak daftar ulang maka dianggap <u><b>mengundurkan diri</b></u>.</li>
                </ul>
                    
                    </td>
                <td><table width="100%" style="text-align: center;">
		<tr>
			
			<td width="30%">Surakarta, _________________</td>
		</tr>
		<tr>
			
			<td>Orang Tua / Wali</td>
		</tr>
		<tr>
			
			<td><div style="padding: 50px 80px;"></div><br/><br/></td>
		</tr>
		<tr>
			
			<TD>.........................................</TD>
		</tr>
	</table></td>
            </tr>
        
	</table>
    </div>
</div>
<br />
<br />
<br />
<br />
<hr />
<br />
<br />
<table style="font-size:11pt;">
    <tr>
        <td>Nama Anak</td>
        <td>:</td>
        <td>{$getsiswa[0]} {$getsiswa[1]} {$getsiswa[2]}</td>
    </tr>
    <tr>
        <td>No. Pendaftaran</td>
        <td>:</td>
        <td>{$ayah->id_daftar}</td>
    </tr>
    <tr>
        <td>Asal TK</td>
        <td>:</td>
        <td>{$siswa->asal_sekolah}</td>
    </tr>
</table>
<h4 style="margin:0 0 5px 2% ;font-weight: bold;">Rincian Biaya</h4>
<table style="margin-left:9%;width:100%;font-size: 15px;" class="tablestyle" cellspacing="0">

	<tr>
		<td width="3%" style="font-size:12pt;"><p class="ukuran_font">No</p></td>
		<td width="50%" style="font-size:12pt;" colspan="2"><p class="ukuran_font">Administrasi Siswa Baru</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">1.</p></td>
		<td><p class="ukuran_font">Seragam</p></td>
		<td><p class="ukuran_font">{rupiah($biaya->uang_seragan)}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">2.</p></td>
		<td><p class="ukuran_font">SPP</p></td>
		<td><p class="ukuran_font">{rupiah($biaya->uang_spp)}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">3.</p></td>
		<td><p class="ukuran_font">Iuran Pengembangan Sekolah</p></td>
		<td><p class="ukuran_font">{rupiah($biaya->uang_kegiatan)}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">4.</p></td>
		<td><p class="ukuran_font">Infaq Sekolah</p></td>
		<td><p class="ukuran_font">{rupiah($biaya->sumbangan)}</p></td>
	</tr>
	<tr>
		<td><p class="ukuran_font">5.</p></td>
		<td><p class="ukuran_font">Buku-buku Selama 1 tahun</p></td>
		<td><p class="ukuran_font">{rupiah($biaya->uang_buku)}</p></td>
	</tr>
	<tr>
		<td colspan="2"><p class="ukuran_font"><center>Jumlah</center></p></td>
		<td><p class="ukuran_font">Rp. {rupiah($biaya->uang_seragan+$biaya->uang_spp+$biaya->sumbangan+$biaya->uang_kegiatan+$biaya->uang_buku)}</p></td>
	</tr>
</table>

<div style="clear:both; position:relative;">
    
    <div style="margin-left:2%;font-size:12pt;">
        <table width="100%" border='0' style="text-align:left;" class="tablestyle">
            <tr>
                <td style="font-size:10pt;"><label>Catatan:</label>
                <ul type="1">
                    <li>Uang yang sudah dibayarkan tidak dapat diminta kembali</li>
                    <li>Daftar ulang maksimal 7hari setelah dinyatakan <u><b>Diterima</b></u> apabila dalam 7 hari tidak daftar ulang maka dianggap <u><b>mengundurkan diri</b></u>.</li>
                </ul>
                    
                    </td>
                <td><table width="100%" style="text-align: center;">
		<tr>
			
			<td width="30%">Surakarta, _________________</td>
		</tr>
		<tr>
			
			<td>Orang Tua / Wali</td>
		</tr>
		<tr>
			
			<td><div style="padding: 50px 80px;"></div><br/><br/></td>
		</tr>
		<tr>
			
			<TD>.........................................</TD>
		</tr>
	</table></td>
            </tr>
        
	</table>
    </div>
</div>
</body>
</html>
