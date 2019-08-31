<center><h4>Data Pendaftar</h4></center>
<table style="width:100%" border="1">
	<tr style="font-weight: bold;text-align: center;">
		<td width="5%">No</td>
		<td width="25%">No Pendaftaran</td>
		<td width="40%">Nama Siswa</td>
		<td width="30%">Asal Sekolah</td>
	</tr>
	{$no = 1}
	{foreach $siswa as $r}
		{assign var="tmp" value=','|explode:$r->nama}
	<tr>
		<td>{$no}</td>
		<td>{$r->id_daftar}</td>
		<td>{$tmp[0]} {$tmp[1]} {$tmp[2]}</td>
		<td>{$r->asal_sekolah}</td>
	</tr>
	{$no = $no+1}
	{/foreach}
	
</table>
