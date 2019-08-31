{extends file="index.tpl"}
{block name=content}
  <!-- Content Header (Page header) -->
  
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-sm-8">
            <!-- quick email widget -->
            <div class="box box-danger">
                <div class="box-header">
                    <i class="fa fa-users"></i>
                    <h3 class="box-title">Pengembangan Sekolah</h3>
                    <!-- tools box -->
                    <div class="pull-right box-tools">
                        
                    </div><!-- /. tools -->
                </div>
                <div class="box-body">
                    <div class="table-responsive">
                        <table id="extmdm" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>Nama</th>
                                    <th>jumlah</th>
                                    <th>Terbilang</th>
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
        </div>
         <div class="col-sm-4">
            <!-- quick email widget -->
            <div class="box box-success">
                <div class="box-header">
                    <i class="fa fa-users"></i>
                    <h3 class="box-title">Edit Iuran Pengembangan Sekolah</h3>
                    <!-- tools box -->
                    <div class="pull-right box-tools">
                        
                    </div><!-- /. tools -->
                </div>
                <form role="form" id="myForm" method="post" data-toggle="validator">
                  <div class="box-body">
                      <!-- form start -->
                      
                        <div class="box-body">
                          <div class="form-group">
                            <label for="exampleInputEmail1">Jumlah</label>
                            <input type="text" name="content" class="form-control" value="{$kon->content}" placeholder="BRI/BNi/Jateng dsb" required/>
                            <input type="hidden" name="id_kegiatan" class="form-control" value="{$kon->id_setting}" placeholder="BRI/BNi/Jateng dsb">
                          </div>
                        </div><!-- /.box-body -->
                      
                  </div>
                  <div class="box-footer clearfix">
                    <div class="pull-right box-tools">
                      <button type="submit" class="btn btn-success">Update Data</button>
                    </div>
                  </div>
                </form>
            </div>
        </div>
      </div>
    </section><!-- /.content -->
{/block}
{block name=footer}
<!-- validator -->
<script src="{base_url()}plugins/validator.js" type="text/javascript"></script>
 <!-- data tables -->
<script src="{base_url()}plugins/media/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="{base_url()}plugins/media/js/dataTables.bootstrap.js" type="text/javascript"></script>
<script src="{base_url()}assets/admin/js/kegiatan.js" type="text/javascript"></script>
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
