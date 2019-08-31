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
          <p>Isi jika calon siswa ikut wali murid, Jika tidak langsung klik Simpan!!</p>

        </div>
      </section>
      {/if}
    <!-- Main content -->
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
          <form action="{base_url()}_lod/edata/post_wali" method="post">
            <div class="form-group">
              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Nama Depan</label>
                  <input type="text" class="form-control" name="ndepan" placeholder="Nama depan:" value="{$getname[0]}" >
                  {form_error('ndepan')}
                </div>
                
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Nama Tengah</label>
                  <input type="text" class="form-control" name="ntengah" placeholder="Nama tengah:" value="{$getname[1]}">
                  {form_error('ntengah')}
                </div>
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Nama Belakang</label>
                  <input type="text" class="form-control" name="nbelakang" placeholder="Nama belakang:" value="{$getname[2]}">
                  {form_error('nbelakang')}
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInputEmail1">NIK</label>
                  <input type="text" class="form-control" name="nik" placeholder="NIK:" value="{$tmed->nik}" />
                  {form_error('nik')}
                </div>

                  <div class="col-md-4">
                      <label for="exampleInputEmail1">No Hp</label>
                      <input type="number" min="" class="form-control" name="no_hp" placeholder="No Hp" value="{$tmed->no_hp}" />
                      {form_error('no_hp')}
                    </div>
                    <div class="col-md-4">
                      <label for="exampleInputEmail1">No Telp</label>
                      <input type="number" min="" class="form-control" name="no_telp" placeholder="No Telpon" value="{$tmed->no_telp}" />
                      {form_error('no_telp')}
                    </div>                
              </div>
            </div>    
            <div class="form-group">
              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Hubungan Keluarga</label>
                  <input type="text" class="form-control" name="hubungan" placeholder="Hubungan Keluarga:"  value="{$tmed->hubungan}" />
                  {form_error('hubungan')}
                </div>
                <div class="col-md-4">
                      <label for="exampleInputEmail1">Pendidikan</label>
                      <input type="text" class="form-control" name="pendidikan" placeholder="Pendidikan:"  value="{$tmed->pendidikan}" />
                      {form_error('pendidikan')}
                    </div>
                <div class="col-md-4">
                  <label for="exampleInputEmail1">Pekerjaan</label>
                  <input type="text" class="form-control" name="pekerjaan" placeholder="Pekerjaan:"  value="{$tmed->pekerjaan}" />
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
{/block}