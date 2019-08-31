{extends file="daftar/dataa.tpl"}
{block name=content}
	<!-- Content Header (Page header) -->
    {if isset($message)}
        <section class="content-header">
          <div class="callout callout-info">
            <h4>INFO!</h4>
            <p>{$message}</p>
          </div>
        </section>
      {else}
        <section class="content-header">
          <div class="callout callout-warning">
            <h4>INFO!</h4>
            <p>Pastikan data yang anda masukkan sudah benar</p>
          </div>
        </section>
      {/if}
    <!-- Main content -->
    <section class="content">
      <!-- quick email widget -->
    <form action="{base_url()}_lod/daction/post_cs" method="post">
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
                  <input type="text"  minlength="3" class="form-control" name="ndepan" placeholder="Nama depan:" value="{set_value('ndepan')}" required/>
                  {form_error('ndepan')}
                </div>
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Nama Tengah</label>
                  <input type="text" class="form-control" name="ntengah" placeholder="Nama tengah:" value="{set_value('ntengah')}" />
                  {form_error('ntengah')}
                </div>
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Nama Belakang</label>
                  <input type="text" class="form-control" name="nbelakang" placeholder="Nama belakang:" value="{set_value('nbelakang')}" />
                  {form_error('nbelakang')}
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInputEmail1">NIK</label>
                  <input type="number" class="form-control" name="nik" placeholder="NIK:" value="{set_value('nik')}" required/>
                  {form_error('nik')}
                </div>
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Tempat Lahir</label>
                  <input type="text"  minlength="3" class="form-control" name="tmp_lahir" placeholder="Tempat Lahir" value="{set_value('tmp_lahir')}" required/>
                  {form_error('tmp_lahir')}
                </div>
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Tanggal Lahir</label>
                  <input type="text" class="form-control" id="datepicker" name="tgl_lahir" placeholder="Tanggal lahir:" value="{set_value('tgl_lahir')}" required/>
                  {form_error('tgl_lahir')}
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="row">
                <div class="col-md-4">
                  <span>Alamat Tinggal:</span>
                  <select class="form-control" name="alamat_tinggal">
                    <option value="Dalam Kota">Dalam Kota</option>
                    <option value="Luar Kota">Luar Kota</option>
                  </select>
                
                </div>
                <div class="col-md-4">
                  <span>Jenis Kelamin:</span>
                  <select class="form-control" name="jns_kelamin">
                    <option value="laki-laki">laki-laki</option>
                    <option value="perempuan">perempuan</option>
                  </select>
                
                </div>
                <div class="col-md-4">
                  <span>Kemampuan Membaca:</span>
                  <select class="form-control" name="mbaca">
                    <option value="belum bisa">belum bisa</option>
                    <option value="terbata-bata">terbata-bata</option>
                    <option value="lancar">lancar</option>
                  </select>
                
                </div>
                
              </div>
            </div>
            <div class="form-group">
              <div class="row">
                <div class="col-md-6">
                  <span>Kemampuan Menghitung:</span>
                  <select class="form-control" name="mhitung">
                    <option value="belum bisa">belum bisa</option>
                    <option value="sudah bisa 1-10">sudah bisa 1-10</option>
                    <option value="sudah bisa lebih dari angka 10">sudah bisa lebih dari angka 10</option>
                  </select>
                
                </div>
                <div class="col-md-6">
                  <span>Kemampuan Membaca Alquran:</span>
                  <select class="form-control" name="malquran">
                    <option value="belum bisa">belum bisa</option>
                    <option value="terbata-bata">terbata-bata</option>
                    <option value="lancar">lancar</option>
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
              <input  type="text" class="form-control" name="asals" placeholder="Asal Sekolah"  minlength="3" value="{set_value('asals')}" required/>
              {form_error('asals')}
            </div>
              <span>Kondisi: <br/></span>
              <div class="radio">
                <label>
                  <input type="radio" id="ckk2" name="kondisi" value="normal" required/>
                  Normal
                </label>
              </div>
              <div class="radio">
                <label>
                  <input type="radio" id="ckk" name="kondisi" value="berkebutuhan" required/> 
                  berkebutuhan khusus
                </label>
              </div>
              <div id="hidden_fields">
                  <div class="form-group">
                    <input type="text" minlength="3"  class="form-control" id="hidden_field" name="lebih" value="0"  required/>
                  </div>
              </div>
            <div class="form-group">
              <span>Tinggi Badan:</span>
              <input type="number" class="form-control" name="tbadan" placeholder="Tinggi badan: xx cm" value="{set_value('tbadan')}" required/>
              {form_error('tbadan')}
            </div>
            <div class="form-group">
              Berat Badan:
              <input type="number" class="form-control" name="bbadan" placeholder="Berat badan: xx kg" value="{set_value('bbadan')}" required/>
              {form_error('bbadan')}
            </div>
          </div><!-- /.box-body -->
        </div><!-- /.box -->
      </div><!-- /.col -->
    </div><!-- /.row -->

      <!--<div class="box box-info">
        <div class="box-header">
          <i class="fa fa-envelope"></i>
          <h3 class="box-title">Identitas CAlon siswa:</h3>
     
          <div class="pull-right box-tools">
            <button class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">
          <form action="#" method="post">
            <div class="form-group">
              <div class="row">
                <div class="col-md-4">
                  <input type="text" class="form-control" name="emailto" placeholder="Nama depan:">
                </div>
                <div class="col-md-4">
                  <input type="text" class="form-control" name="emailto" placeholder="Nama tengah:">
                </div>
                <div class="col-md-4">
                  <input type="text" class="form-control" name="emailto" placeholder="Nama belakang:">
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="row">
                <div class="col-md-6">
                  <input type="text" class="form-control" name="subject" placeholder="Tempat">
                </div>
                <div class="col-md-6">
                  <input type="text" class="form-control" name="emailto" placeholder="Tanggal lahir:">
                </div>
              </div>
            </div>
            <div class="form-group">
              <input type="text" class="form-control" name="emailto" placeholder="NIK:">
            </div>
            <div class="form-group">
              <div class="row">
                <div class="col-md-6">
                  <select class="form-control">
                    <option value="laki-laki">laki-laki</option>
                    <option value="perempuan">perempuan</option>
                  </select>
                </div>
                <div class="col-md-3">
                  <input type="number" class="form-control" name="emailto" placeholder="Tinggi badan:">
                </div>
                <div class="col-md-3">
                  <input type="number" class="form-control" name="emailto" placeholder="Berat badan:">
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="row">
                <div class="col-md-4">
                  <select class="form-control">
                    <option value="laki-laki">----Kemampuan membaca----</option>
                    <option value="laki-laki">belum bisa</option>
                    <option value="perempuan">terbata-bata</option>
                    <option value="perempuan">lancar</option>
                  </select>
                </div>
                <div class="col-md-4">
                  <select class="form-control">
                    <option value="laki-laki">----Kemampuan berhitung----</option>
                    <option value="laki-laki">belum bisa</option>
                    <option value="perempuan">sudah bisa 1-10</option>
                    <option value="perempuan">sudah bisa lebih dari angka 10</option>
                  </select>
                </div>
                <div class="col-md-4">
                  <select class="form-control">
                    <option value="laki-laki">----Kemampuan iqro/Al-quran----</option>
                    <option value="laki-laki">belum bisa</option>
                    <option value="perempuan">terbata-bata</option>
                    <option value="perempuan">lancar</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="form-group">
              <input type="radio" value="normal"> Normal <input type="radio" value="berkebutuhan"> berkebutuhan khusus
            </div>
          </form>
        </div>
        <div class="box-footer clearfix">
          <button class="pull-right btn btn-default" id="sendEmail">Send <i class="fa fa-arrow-circle-right"></i></button>
        </div>
      </div> -->


      <pre class="prettyprint" style="background-color:white;">
        <button type="submit" class="pull-right btn btn-danger" id="sendEmail">Send <i class="fa fa-arrow-circle-right"></i></button>
      </pre>
    </section><!-- /.content -->
</form>

{/block}
{block name=footer}
<!-- Datetimepicker -->
<script src="{base_url()}plugins/datetimepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script type="text/javascript">
    //function get_tanggal(){
        $(function () {
            $('#datepicker').datepicker({
              startView: 2,
              language: "id",
              orientation: "bottom auto",
              autoclose: true,
              format: 'yyyy-mm-dd',
            });
        });    
    //}      
</script>
<script type="text/javascript">
$(function() {
  // Get the form fields and hidden div
  var checkbox = $("#ckk");
  var checkbox2 = $("#ckk2");
  var hidden = $("#hidden_fields");
  var populate = $("#populate");
  hidden.hide();

  checkbox.change(function() {
    if (checkbox.is(':checked')) {
      // Show the hidden fields.
      hidden.show();
      $('[name="lebih"]').val("");
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
      $('[name="lebih"]').val("");
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
{/block}