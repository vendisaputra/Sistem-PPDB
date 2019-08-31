{extends file="index.tpl"}
{block name=content}
	{if isset($message)}
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="callout callout-success">
        <h4>INFO!</h4>
        <p>{$message}</p>
      </div>
    </section>
  {/if}
  <form action="{base_url()}_lod/edata/biaya_post" method="post">
    <!-- Main content -->
    <section class="content">
        <!-- quick email widget -->
        <div class="box box-info">
            <div class="box-header">
                <i class="fa fa-users"></i>
                <h3 class="box-title">Content web</h3>
                <!-- tools box -->
                <div class="pull-right box-tools">
                    
                </div><!-- /. tools -->
            </div>
            <div class="box-body">
                <div class="well" style="border-radius:0px;height: auto; padding-top:11px; padding-bottom:11px;">
                    <div class="row">
                        <a href="{base_url()}_admin/berita/tambahdata"><button type="button" class="btn btn-info btn-flat btn-sm"><i class="fa fa-plus"></i> Tambah data</button></a>
                    </div>
                </div>
                <div class="table-responsive">
                    <table id="extmdm" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>Judul</th>
                                <th>Tgl terbit</th>
                                <th>Isi</th>
                                <th>Kategori</th>
                                <th><center>action</center></th>
                            </tr>
                        </thead>
                        <tfoot>
      
                        </tfoot>
                    </table>
                </div>
            </div>
            <div class="box-footer clearfix">
            </div>
        </div>

    </section><!-- /.content -->
  </form>

  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-aqua">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Detail Data Akun Pendaftar</h4>
        </div>
        <div class="modal-body">
           <form role="form" id="myForm">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Nama Depan</label>
                  <input type="text" name="ndepan" class="form-control"  placeholder="Nama Depan" required/>
                  <input type="hidden" name="id_daftar" class="form-control"  placeholder="Nama Depan">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Nama Belakang</label>
                  <input type="text" name="nbelakang" class="form-control"  placeholder="Nama Belakang" required/>
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">NIK</label>
                  <input type="text" name="nik" class="form-control"  placeholder="NIK" required/>
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">No telepon</label>
                  <input type="telp" name="notelp" class="form-control"  placeholder="08xxx xxx xxx" required/>
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">email</label>
                  <input type="email" name="email" class="form-control"  placeholder="example@mail.com" required/>
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Password</label>
                  <input type="password" name="password" class="form-control"  placeholder="*************">
                </div>
              </div><!-- /.box-body --> 
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        </form>
      </div>
    </div>
  </div>

{/block}
{block name=footer}
<!-- validator -->
<script src="{base_url()}plugins/validator.js" type="text/javascript"></script>
 <!-- data tables -->
<script src="{base_url()}plugins/media/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="{base_url()}plugins/media/js/dataTables.bootstrap.js" type="text/javascript"></script>
<script src="{base_url()}assets/admin/js/content.js" type="text/javascript"></script>
<script type="text/javascript">
$('#myForm').validator().on('submit', function (e) {
  if (e.isDefaultPrevented()) {
     //swal("Error insert data!", "Lengkapi data terlebih dahulu", "error");
  }else{
    var formData = new FormData($('#myForm')[0]);
        $.ajax({
          url: "updatedata",
          data : formData,
          type:"post",
          contentType: false,
          processData: false,
          dataType: "JSON",
          beforeSend:function(){
            //$('#ayogaskan').text("proses...");
          },
          success:function(data){
            if(data.status) {
              reload_table();
              sweet("Data berhasil terupdate");
              //window.location.href="../../perusahaan/";
              //window.location('{base_url()}_admin/perusahaan/');
              
            }else{
              swal("Error update data!", "Foto Terlalu Besar", "error");
            }
            //$('#ayogaskan').text("kirim");
                  
          },
          error: function(jqXHR, textStatus, errorThrown){
            //$('#ayogaskan').text("kirim");
            swal("Error update data!", "Please try again", "error");
          }
        });
    e.preventDefault();
  }
})
</script>
{/block}
