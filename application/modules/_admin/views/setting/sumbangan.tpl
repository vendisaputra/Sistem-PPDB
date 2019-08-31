{extends file="index.tpl"}
{block name=content}
	<!-- Content Header (Page header) -->
    
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-sm-12">
            <!-- quick email widget -->
            <div class="box box-info">
                <div class="box-header">
                    <i class="fa fa-users"></i>
                    <h3 class="box-title">Infaq Sekolah</h3>
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
                                    <th>Jumlah</th>
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
        </div>
         
      </div>
    </section><!-- /.content -->
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header bg-aqua">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Edit Infaq Sekolah</h4>
          </div>
          <div class="modal-body">
             <form role="form" id="myForm" data-toggle="validator">
                <div class="box-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Jumlah Infaq </label>
                    <input type="text" name="content" class="form-control"  placeholder="jumlah Infaq" required/>
                    <input type="hidden" name="id_sumbangan" class="form-control"  placeholder="Infaq Sekolah">
                  </div>
                </div><!-- /.box-body --> 
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Update</button>
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
<script src="{base_url()}assets/admin/js/sumbangan.js" type="text/javascript"></script>
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
