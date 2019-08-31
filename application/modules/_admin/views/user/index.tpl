{extends file="index.tpl"}
{block name=content}
	{if isset($message)}
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="callout callout-info">
        <h4>INFO!</h4>
        <p>{$message}</p>
      </div>
    </section>
  {else}
    <section class="content-header">
      <div class="callout callout-warning">
        <h4>Perhatian!</h4>
        <p>Periksa data anda terlebih dahulu.</p>
      </div>
    </section>
  {/if}
  <form action="{base_url()}_admin/main/user_update/{$tmed_ayah->id_daftar}" method="post" data-toggle="validator" role="form" enctype='multipart/form-data'>
    <!-- Main content -->
    <section class="content">
        <div class="row">
        <div class="col-sm-12">
            <!-- quick email widget -->
            <div class="box box-info">
                <div class="box-header">
                    <i class="fa fa-edit"></i>
                    <h3 class="box-title">Upate data ayah</h3>
                    <!-- tools box -->
                    <div class="pull-right box-tools">
                        
                    </div><!-- /. tools -->
                </div>
                <div class="box-body">
                    <div class="form-group">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Nama Depan</label>
                      <input type="text" class="form-control" name="ndepan" placeholder="Nama depan:" value="{$getname_ayah[0]}" required/>
                      {form_error('ndepan')}
                    </div>
                    
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Nama Tengah</label>
                      <input type="text" class="form-control" name="ntengah" placeholder="Nama tengah:" value="{$getname_ayah[1]}">
                      {form_error('ntengah')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Nama Belakang</label>
                      <input type="text" class="form-control" name="nbelakang" placeholder="Nama belakang:" value="{$getname_ayah[2]}">
                      {form_error('nbelakang')}
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">NIK</label>
                      <input type="text" class="form-control" name="nik" placeholder="NIK:" value="{$tmed_ayah->nik}" required/>
                      {form_error('nik')}
                    </div>

                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Tempat Lahir</label>
                      <input type="text" class="form-control" name="tmp_lahir" placeholder="Tempat" value="{$tmed_ayah->tmp_lahir}" required/>
                      {form_error('tmp_lahir')}
                    </div>
                    
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Tanggal Lahir</label>
                      <input type="text" class="form-control" name="tgl_lahir" id="datepicker" placeholder="Tanggal lahir:" value="{$tmed_ayah->tgl_lahir}" required/>
                      {form_error('tgl_lahir')}
                    </div>
                    
                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-2">
                      <label for="exampleInputEmail1">RT</label>
                      <input type="number" class="form-control" name="rt" placeholder="RT:"  value="{$getalamat_ayah[0]}" required/>
                      {form_error('rt')}
                    </div>
                    <div class="col-md-2">
                      <label for="exampleInputEmail1">RW</label>
                      <input type="number" class="form-control" name="rw" placeholder="RW:"  value="{$getalamat_ayah[1]}" required/>
                      {form_error('rw')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Dusun</label>
                      <input type="text" class="form-control" name="dusun" placeholder="Dusun/Dukuh:"  value="{$getalamat_ayah[2]}" required/>
                      {form_error('dusun')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Desa</label>
                      <input type="text" class="form-control" name="desa" placeholder="Desa/Kelurahan:"  value="{$getalamat_ayah[3]}" required/>
                      {form_error('desa')}
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Kecamatan</label>
                      <input type="text" class="form-control" name="kac" placeholder="Kecamatan"  value="{$getalamat_ayah[4]}" required/>
                      {form_error('kac')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Kabupaten/Kota</label>
                      <input type="text" class="form-control" name="kab" placeholder="Kabupaten/Kota:"  value="{$getalamat_ayah[5]}" required/>
                      {form_error('kab')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Pekerjaan</label>
                      <input type="text" class="form-control" name="pekerjaan" placeholder="Pekerjaan:"  value="{$tmed_ayah->pekerjaan}" required/>
                      {form_error('pekerjaan')}
                    </div>
                  </div>
                </div>
                </div>
                <div class="box-footer clearfix">
                  <input type="submit" value="update data" class="btn btn-info pull-right">
                </div>
            </div>
        </div>
      </div>
    </section><!-- /.content -->
  </form>

  <form action="{base_url()}_admin/main/ibu_datapost/{$tmed_ibu->id_daftar}" method="post" data-toggle="validator" role="form" enctype='multipart/form-data'>
    <!-- Main content -->
    <section class="content">
        <div class="row">
        <div class="col-sm-12">
            <!-- quick email widget -->
            <div class="box box-danger">
                <div class="box-header">
                    <i class="fa fa-edit"></i>
                    <h3 class="box-title">Upate data ibu</h3>
                    <!-- tools box -->
                    <div class="pull-right box-tools">
                        
                    </div><!-- /. tools -->
                </div>
                <div class="box-body">
                    <div class="form-group">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Nama Depan</label>
                      <input type="text" class="form-control" name="ndepan" placeholder="Nama depan:" value="{$getname_ibu[0]}" required/>
                      {form_error('ndepan')}
                    </div>
                    
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Nama Tengah</label>
                      <input type="text" class="form-control" name="ntengah" placeholder="Nama tengah:" value="{$getname_ibu[1]}">
                      {form_error('ntengah')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Nama Belakang</label>
                      <input type="text" class="form-control" name="nbelakang" placeholder="Nama belakang:" value="{$getname_ibu[2]}">
                      {form_error('nbelakang')}
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">NIK</label>
                      <input type="text" class="form-control" name="nik" placeholder="NIK:" value="{$tmed_ibu->nik}" required/>
                      {form_error('nik')}
                    </div>

                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Tempat Lahir</label>
                      <input type="text" class="form-control" name="tmp_lahir" placeholder="Tempat" value="{$tmed_ibu->tmp_lahir}" required/>
                      {form_error('tmp_lahir')}
                    </div>
                    
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Tanggal Lahir</label>
                      <input type="text" class="form-control" name="tgl_lahir" id="datepicker" placeholder="Tanggal lahir:" value="{$tmed_ibu->tgl_lahir}" required/>
                      {form_error('tgl_lahir')}
                    </div>
                    
                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-2">
                      <label for="exampleInputEmail1">RT</label>
                      <input type="number" class="form-control" name="rt" placeholder="RT:"  value="{$getalamat_ibu[0]}" required/>
                      {form_error('rt')}
                    </div>
                    <div class="col-md-2">
                      <label for="exampleInputEmail1">RW</label>
                      <input type="number" class="form-control" name="rw" placeholder="RW:"  value="{$getalamat_ibu[1]}" required/>
                      {form_error('rw')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Dusun</label>
                      <input type="text" class="form-control" name="dusun" placeholder="Dusun/Dukuh:"  value="{$getalamat_ibu[2]}" required/>
                      {form_error('dusun')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Desa</label>
                      <input type="text" class="form-control" name="desa" placeholder="Desa/Kelurahan:"  value="{$getalamat_ibu[3]}" required/>
                      {form_error('desa')}
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Kecamatan</label>
                      <input type="text" class="form-control" name="kac" placeholder="Kecamatan"  value="{$getalamat_ibu[4]}" required/>
                      {form_error('kac')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Kabupaten/Kota</label>
                      <input type="text" class="form-control" name="kab" placeholder="Kabupaten/Kota:"  value="{$getalamat_ibu[5]}" required/>
                      {form_error('kab')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">Pekerjaan</label>
                      <input type="text" class="form-control" name="pekerjaan" placeholder="Pekerjaan:"  value="{$tmed_ibu->pekerjaan}" required/>
                      {form_error('pekerjaan')}
                    </div>
                  </div>
                </div>
                </div>
                <div class="box-footer clearfix">
                  <input type="submit" value="update data" class="btn btn-danger pull-right">
                </div>
            </div>
        </div>
      </div>
    </section><!-- /.content -->
  </form>

  <form action="{base_url()}_admin/main/ck_datapost/{$tmed_cs->id_daftar}" method="post" data-toggle="validator" role="form" enctype='multipart/form-data'>
    <!-- Main content -->
    <section class="content">
        <form action="{base_url()}_lod/edata/post_cs" method="post">
          <div class="row">
            <div class="col-sm-8">
              <div class="box box-primary">
                <div class="box-header with-border">
                  <i class="fa fa-envelope"></i>
                  <h3 class="box-title">Identitas Calon siswa:</h3>
                  <span class="label label-primary pull-right"><i class="fa fa-html5"></i></span>
                </div><!-- /.box-header -->
                <div class="box-body">
                
                  <div class="form-group">
                    <div class="row">
                      <div class="col-md-4">
                        <label for="exampleInputEmail1">Nama Depan</label>
                        <input type="text" class="form-control" name="ndepan" placeholder="Nama depan:" value="{$getname_cs[0]}" required/>
                        {form_error('ndepan')}
                      </div>
                      <div class="col-md-4">
                        <label for="exampleInputEmail1">Nama Tengah</label>
                        <input type="text" class="form-control" name="ntengah" placeholder="Nama tengah:" value="{$getname_cs[1]}" />
                      </div>
                      <div class="col-md-4">
                        <label for="exampleInputEmail1">Nama Belakang</label>
                        <input type="text" class="form-control" name="nbelakang" placeholder="Nama belakang:" value="{$getname_cs[2]}" />
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="row">
                      <div class="col-md-4">
                        <label for="exampleInputEmail1">NIK</label>
                        <input type="text" class="form-control" name="nik" placeholder="NIK:" value="{$tmed_cs->nik}" required/>
                        {form_error('nik')}
                      </div>
                      <div class="col-md-4">
                        <label for="exampleInputEmail1">Tempat Lahir</label>
                        <input type="text" class="form-control" name="tmp_lahir" placeholder="Tempat Lahir" value="{$tmed_cs->tmp_lahir}" required/>
                        {form_error('tmp_lahir')}
                      </div>
                      <div class="col-md-4">
                        <label for="exampleInputEmail1">Tanggal Lahir</label>
                        <input type="text" class="form-control" id="datepicker" name="tgl_lahir" placeholder="Tanggal lahir:" value="{$tmed_cs->tgl_lahir}" required/>
                        {form_error('tgl_lahir')}
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="row">
                      <div class="col-md-6">
                        <span>Jenis Kelamin:</span>
                        <select class="form-control" name="jns_kelamin">
                          {if $tmed_cs->jenis_kelamin == 'laki-laki'}
                            {assign var=foo value='selected'}
                            <option value="laki-laki" selected>laki-laki</option>
                            <option value="perempuan">perempuan</option>
                          {else}
                            {assign var=foo value='selected'}
                            <option value="laki-laki">laki-laki</option>
                            <option value="perempuan" selected>perempuan</option>
                          {/if}
                        </select>
                      
                      </div>
                      <div class="col-md-6">
                        <span>Kemampuan Membaca:</span>
                        <select class="form-control" name="mbaca">
                          {if $tmed_cs->mbaca == 'belum bisa'}
                            <option value="belum bisa" selected>belum bisa</option>_cs
                            <option value="terbata-bata">terbata-bata</option>
                            <option value="lancar">lancar</option>
                          {else if $tmed_cs->mbaca == 'terbata-bata'}
                            <option value="belum bisa">belum bisa</option>
                            <option value="terbata-bata" selected>terbata-bata</option>
                            <option value="lancar">lancar</option>
                          {else}
                            <option value="belum bisa">belum bisa</option>
                            <option value="terbata-bata">terbata-bata</option>
                            <option value="lancar" selected>lancar</option>
                          {/if}
                        </select>
                      
                      </div>
                      
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="row">
                      <div class="col-md-6">
                        <span>Kemampuan Menghitung:</span>
                        <select class="form-control" name="mhitung">
                          {if $tmed_cs->mhitung == 'belum bisa'}
                            <option value="belum bisa" selected>belum bisa</option>
                            <option value="sudah bisa 1-10">sudah bisa 1-10</option>
                            <option value="sudah bisa lebih dari angka 10">sudah bisa lebih dari angka 10</option>
                          {else if $tmed_cs->mhitung == 'sudah bisa 1-10'}
                            <option value="belum bisa">belum bisa</option>
                            <option value="sudah bisa 1-10" selected>sudah bisa 1-10</option>
                            <option value="sudah bisa lebih dari angka 10">sudah bisa lebih dari angka 10</option>
                          {else}
                            <option value="belum bisa">belum bisa</option>
                            <option value="sudah bisa 1-10">sudah bisa 1-10</option>
                            <option value="sudah bisa lebih dari angka 10" selected>sudah bisa lebih dari angka 10</option>
                          {/if}
                        </select>
                      
                      </div>
                      <div class="col-md-6">
                        <span>Kemampuan Membaca Alquran:</span>
                        <select class="form-control" name="malquran">
                          {if $tmed_cs->malquran == 'belum bisa'}
                            <option value="belum bisa" selected>belum bisa</option>
                            <option value="terbata-bata">terbata-bata</option>
                            <option value="lancar">lancar</option>
                          {else if $tmed_cs->malquran == 'terbata-bata'}
                            <option value="belum bisa">belum bisa</option>
                            <option value="terbata-bata" selected>terbata-bata</option>
                            <option value="lancar">lancar</option>
                          {else}
                            <option value="belum bisa">belum bisa</option>
                            <option value="terbata-bata">terbata-bata</option>
                            <option value="lancar" selected>lancar</option>
                          {/if}
                        </select>
                      
                      </div>
                      
                    </div>
                  </div>
                
              </div>
              </div><!-- /.box -->
            </div><!-- /.col -->
            <div class="col-sm-4">
              <div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title">Identitas Calon siswa:</h3>
                  <span class="label label-danger pull-right"><i class="fa fa-database"></i></span>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div class="form-group">
                    <span>Asal Sekolah:</span>
                    <input type="text" class="form-control" name="asals" placeholder="Asal Sekolah" value="{$tmed_cs->asal_sekolah}" required/>
                    {form_error('asals')}
                  </div>
                    <span>Kondisi: <br/></span>
                    {if $tmed_cs->kondisi == 'normal'}
                      <div class="radio">
                        <label>
                          <input type="radio" id="ckk2" name="kondisi" value="normal" checked required/>
                          Normal
                        </label>
                      </div>
                      <div class="radio">
                        <label>
                          <input type="radio" id="ckk" name="kondisi" value="berkebutuhan" required/> 
                          berkebutuhan khusus
                        </label>
                      </div>
                    {else}
                      <div class="radio">
                        <label>
                          <input type="radio" id="ckk2" name="kondisi" value="normal" required/>
                          Normal
                        </label>
                      </div>
                      <div class="radio">
                        <label>
                          <input type="radio" id="ckk" name="kondisi" value="berkebutuhan" checked required/> 
                          berkebutuhan khusus
                        </label>
                      </div>
                    {/if}
                    <div id="hidden_fields">
                        <div class="form-group">
                          <input type="text"  class="form-control" id="hidden_field" name="lebih" value="{$tmed_cs->kebutuhan}"  required/>
                        </div>
                    </div>
                  <div class="form-group">
                    <span>Tinggi Badan:</span>
                    <input type="number" class="form-control" name="tbadan" placeholder="Tinggi badan: xx cm" value="{$tmed_cs->tinggi_badan}" required/>
                    {form_error('tbadan')}
                  </div>
                  <div class="form-group">
                    Berat Badan:
                    <input type="number" class="form-control" name="bbadan" placeholder="Berat badan: xx kg" value="{$tmed_cs->berat_badan}" required/>
                    {form_error('bbadan')}
                  </div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
            <pre class="prettyprint" style="background-color:white;">
              <button type="submit" class="pull-right btn btn-danger" id="sendEmail">updata data <i class="fa fa-arrow-circle-right"></i></button>
            </pre>
      </form>
  </section><!-- /.content -->
      
  <form action="{base_url()}_admin/main/biaya_datapost/{$tmed_biaya->id_daftar}" method="post" data-toggle="validator" role="form" enctype='multipart/form-data'>
    <!-- Main content -->
    <section class="content">
      <!-- quick email widget -->
      <div class="row">
        <div class="col-sm-12">
          <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">update data biaya</h3>
            </div><!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal">
              <div class="box-body">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Sumbangan Infaq</label>
                  <div class="col-sm-9">
                    {assign var="increment" value=1}
                    {foreach from=$setting_biaya item=$row}
                      <div class="radio">
                        <label>
                          {if $row->content == $tmed_biaya->sumbangan} 
                            <input type="radio" name="sumbangan" id="triggerr{$increment}" value="{$row->content}" checked required/>
                          {else}
                            <input type="radio" name="sumbangan" id="triggerr{$increment}" value="{$row->content}" required/>
                          {/if}
                          {rupiah($row->content)}
                        </label>
                      </div>
                    {assign var="increment" value=$increment+1}
                    {/foreach}
                    <div class="radio">
                      <label>
                        
                          {if in_array($tmed_biaya->sumbangan, $cek_biaya)} 
                            <input type="radio" name="sumbangan" id="trigger" value="3" required/>
                          {else}
                            <input type="radio" name="sumbangan" id="trigger" value="3" checked required/>
                          {/if}
                        
                        Lebih besar lagi
                      </label>
                    </div>
                    <div id="hidden_fields">
                        <div class="form-group">
                          <input type="text"  class="form-control" id="hidden_fields_biaya" name="lebih" value="" placeholder="Rp xxx" required readonly/>
                        </div>
                    </div>
                  </div>
                </div><br/><br/>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Uang seragam</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" name="uang_seragan" placeholder="Rp xxx" value="{$tmed_biaya->uang_seragan}" required readonly/>
                    {form_error('uang_seragan')}
                  </div>
                </div><br/><br/>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Uang SPP</label>
                  <div class="col-sm-9">
                    {foreach from=$setting_dua_biaya item=$r}
                      <div class="radio">
                        <label>
                          <input type="radio" name="uang_spp" id="optionsRadios1" value="{$r->content}" checked required/>
                          {rupiah($r->content)}
                        </label>
                      </div>
                    {/foreach}
                  </div>
                </div><br/><br/>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Uang Pengembangan</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" name="uang_kegiatan" placeholder="Rp xxx" value="{$tmed_biaya->uang_kegiatan}" required readonly/>
                    {form_error('uang_kegiatan')}
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Uang Buku</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" name="uang_buku" placeholder="Rp xxx" value="{$tmed_biaya->uang_buku}" readonly required/>
                    {form_error('uang_buku')}
                  </div>
                </div>
              </div><!-- /.box-body -->
              <div class="box-footer">
                
              </div><!-- /.box-footer -->
            </form>
          </div><!-- /.box -->
        </div><!-- /.col -->
      
      </div><!-- /.row -->

      <pre class="prettyprint" style="background-color:white;">
        <button type="submit" class="pull-right btn btn-info" id="sendEmail">Updata data <i class="fa fa-arrow-circle-right"></i></button>
      </pre>
    </section><!-- /.content -->
  </form>
  
  
  <!-- Main content -->
    <section class="content">
      <!-- quick email widget -->
      <div class="box box-danger">
        <div class="box-header">
          <i class="fa fa-envelope"></i>
          <h3 class="box-title">Identitas Wali:</h3>
          <!-- tools box -->
          <div class="pull-right box-tools">
            <button class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
          </div><!-- /. tools -->
        </div>
        <div class="box-body">
          <form action="{base_url()}_admin/main/wali_datapost/{$wali->id_daftar}" method="post">
            <div class="form-group">
              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Nama Depan</label>
                  <input type="text" class="form-control" name="ndepan" placeholder="Nama depan:" value="{$getname_wali[0]}" >
                  {form_error('ndepan')}
                </div>
                
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Nama Tengah</label>
                  <input type="text" class="form-control" name="ntengah" placeholder="Nama tengah:" value="{$getname_wali[1]}">
                  {form_error('ntengah')}
                </div>
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Nama Belakang</label>
                  <input type="text" class="form-control" name="nbelakang" placeholder="Nama belakang:" value="{$getname_wali[2]}">
                  {form_error('nbelakang')}
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInputEmail1">NIK</label>
                  <input type="text" class="form-control" name="nik" placeholder="NIK:" value="{$wali->nik}" />
                  {form_error('nik')}
                </div>

                  <div class="col-md-4">
                      <label for="exampleInputEmail1">No Hp</label>
                      <input type="number" min="" class="form-control" name="no_hp" placeholder="No Hp" value="{$wali->no_hp}" />
                      {form_error('no_hp')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">No Telp</label>
                      <input type="number" min="" class="form-control" name="no_telp" placeholder="No Telpon" value="{$wali->no_telp}" />
                      {form_error('no_telp')}
                    </div>                
              </div>
            </div>    
            <div class="form-group">
              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Hubungan Keluarga</label>
                  <input type="text" class="form-control" name="hubungan" placeholder="Hubungan Keluarga:"  value="{$wali->hubungan}" />
                  {form_error('hubungan')}
                </div>
                <div class="col-md-4">
                      <label for="exampleInputEmail1">Pendidikan</label>
                      <input type="text" class="form-control" name="pendidikan" placeholder="Pendidikan:"  value="{$wali->pendidikan}" />
                      {form_error('pendidikan')}
                    </div>
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Pekerjaan</label>
                  <input type="text" class="form-control" name="pekerjaan" placeholder="Pekerjaan:"  value="{$wali->pekerjaan}" />
                  {form_error('pekerjaan')}
                </div>
              </div>
            </div>
          
        </div>
        <div class="box-footer clearfix">
          <button type="submit" class="pull-right btn btn-info" id="sendEmail">Simpan <i class="fa fa-arrow-circle-right"></i></button>
        </div>
        </form>
      </div>
    </section><!-- /.content -->

{/block}
{block name=footer}
<!-- validator -->
<script src="{base_url()}plugins/validator.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
  // Get the form fields and hidden div
  var checkbox = $("#ckk");
  var checkbox2 = $("#ckk2");
  var hidden = $("#hidden_fields");
  var populate = $("#populate");
  if (checkbox.is(':checked')) {
    hidden.show();
  }else{
    hidden.hide();
  }
 

  checkbox.change(function() {
    if (checkbox.is(':checked')) {
      // Show the hidden fields.
      hidden.show();
      $('[name="lebih"]').val("{$tmed_cs->kebutuhan}");
      // Populate the input.
      populate.val("Dude, this input got populated!");
    }else if(checkbox2.is(':checked')){
      hidden.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields').removeAttribute("required");
    } else {
      hidden.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields').removeAttribute("required");
    }
  });

  checkbox2.change(function() {
    if (checkbox.is(':checked')) {
      // Show the hidden fields.
      hidden.show();
      $('[name="lebih"]').val("{$tmed_cs->kebutuhan}");
      // Populate the input.
      populate.val("Dude, this input got populated!");
    }else if(checkbox2.is(':checked')){
      hidden.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields').removeAttribute("required");
    } else {
      hidden.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields').removeAttribute("required");
    }
  });

});
</script>

<script type="text/javascript">
$(function() {
  // Get the form fields and hidden div
  var check = $("#trigger");
  var check2 = $("#triggerr1");
  var sembunyi = $("#hidden_fields_biaya");
  var populate = $("#triggerr2");
  if (check.is(':checked')) {
    sembunyi.show();
    $('[name="lebih"]').val("{$tmed_biaya->sumbangan}");
  }else{
    sembunyi.hide();
    $('[name="lebih"]').val("");
    $('[name="lebih"]').removeAttr('required');
  }
  check.change(function() {
    if (check.is(':checked')) {
      // Show the hidden fields.
      sembunyi.show();
      $('[name="lebih"]').val("{$tmed_biaya->sumbangan}");
      // Populate the input.
      populate.val("Dude, this input got populated!");
    }else if(check2.is(':checked')){
      sembunyi.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields_biaya').removeAttribute("required");
    } else {
      sembunyi.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields_biaya').removeAttribute("required");
    }
  });
  check2.change(function() {
    if (check.is(':checked')) {
      // Show the hidden fields.
      sembunyi.show();
      $('[name="lebih"]').val("{$tmed_biaya->sumbangan}");
      // Populate the input.
      populate.val("Dude, this input got populated!");
    }else if(check2.is(':checked')){
      sembunyi.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields_biaya').removeAttribute("required");
    } else {
      // Make sure that the hidden fields are indeed
      // hidden.
      sembunyi.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields_biaya').removeAttribute("required");
    }
  });

  populate.change(function() {
    if (check.is(':checked')) {
      // Show the hidden fields.
      sembunyi.show();
      $('[name="lebih"]').val("{$tmed_biaya->sumbangan}");
      // Populate the input.
      populate.val("Dude, this input got populated!");
    }else if(populate.is(':checked')){
      sembunyi.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields_biaya').removeAttribute("required");
    } else {
      sembunyi.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields_biaya').removeAttribute("required");
    }
  });

});
</script>
{/block}
