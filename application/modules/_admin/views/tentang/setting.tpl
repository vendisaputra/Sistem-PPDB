{extends file="index.tpl"}
{block name=content}
  <style>
      .kv-avatar .krajee-default.file-preview-frame,.kv-avatar .krajee-default.file-preview-frame:hover {
          margin: 0;
          padding: 0;
          border: none;
          box-shadow: none;
          text-align: center;
      }
      .kv-avatar .file-input {
          display: table-cell;
          max-width: 250px;
      }
      .kv-reqd {
          color: red;
          font-family: monospace;
          font-weight: normal;
      }
  </style>
  {if isset($message)}
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="callout callout-success">
        <h4>INFO!</h4>
        <p>{$message}</p>
      </div>
    </section>
  {/if}
    <!-- Main content -->
    <section class="content">
        <div class="row">
          <div class="col-md-6">
              <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">Sosial Meida</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div class="row">
                    <div class="col-md-10">
                      <p class="margin">Facebok</code></p>
                      <form method="POST" action="{base_url()}_admin/tentang/up_facebook">
                      <div class="input-group input-group-sm">
                        <input type="url" name="facebook" value="{get_metsos('facebook')}" class="form-control">
                        <span class="input-group-btn">
                          <button class="btn btn-info btn-flat" type="submit">Ubah!</button>
                        </span>
                      </div><!-- /input-group -->
                      </form>

                      <p class="margin">Instragram</p>
                      <form method="POST" action="{base_url()}_admin/tentang/up_instragram">
                      <div class="input-group input-group-sm">
                        <input type="url" name="input_dua" value="{get_metsos('instagram')}" class="form-control">
                        <span class="input-group-btn">
                          <button class="btn btn-info btn-flat" type="submit">Ubah!</button>
                        </span>
                      </div><!-- /input-group -->
                      </form>

                      <p class="margin">YouTube</p>
                      <form method="POST" action="{base_url()}_admin/tentang/up_google">
                      <div class="input-group input-group-sm">
                        <input type="url" name="input_tiga" value="{get_metsos('youtube')}" class="form-control">
                        <span class="input-group-btn">
                          <button class="btn btn-info btn-flat" type="submit">Ubah!</button>
                        </span>
                      </div><!-- /input-group -->
                      </form>
                      
                      <p class="margin">Nisn</p>
                      <form method="POST" action="{base_url()}_admin/tentang/up_nisn">
                      <div class="input-group input-group-sm">
                        <input type="url" name="input_empat" value="{get_metsos('nisn')}" class="form-control">
                        <span class="input-group-btn">
                          <button class="btn btn-info btn-flat" type="submit">Ubah!</button>
                        </span>
                      </div><!-- /input-group -->
                      </form>

                    </div><!-- /.col -->
                  </div><!-- /.row -->
                </div><!-- ./box-body -->
                <div class="box-footer">
                  
                </div><!-- /.box-footer -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          <div class="col-md-6">
              <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">Slider</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="{base_url()}_admin/tentang/slider">Tambah Foto</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body" id="extmdm">
                  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                      {assign var="nee" value=0}
                      {foreach from=$slider item=$tm}
                        {if $nee == 0}
                          <li data-target="#carousel-example-generic" data-slide-to="{$nee}" class="active"></li>
                        {else}
                          <li data-target="#carousel-example-generic" data-slide-to="{$nee}" class=""></li>
                        {/if}
                      {assign var="nee" value=$nee+1}
                      {/foreach}
                    </ol>
                    <div class="carousel-inner">
                    {assign var="increment" value=1}
                    {foreach from=$slider item=$row}
                      {if $increment == 1}
                        <div class="item active">
                          <img src="{image_slider($row->id_setting,'thumb')}" alt="First slide">
                          <div class="carousel-caption">
                            <a href="{base_url()}_admin/tentang/show_slider_update/{$row->id_setting}"><button class="btn btn-info" type="button">Ubah</button></a>
                            <a href="#" onClick="hpsdt({$row->id_setting})"><button class="btn btn-danger" type="button">hapus</button></a>
                            <br/>
                          </div>
                        </div>
                      {else}
                        <div class="item">
                          <img src="{image_slider($row->id_setting,'thumb')}" alt="First slide">
                          <div class="carousel-caption">
                            <a href="{base_url()}_admin/tentang/show_slider_update/{$row->id_setting}"><button class="btn btn-info" type="button">Ubah</button></a>
                            <a href="#" onClick="hpsdt({$row->id_setting})"><button class="btn btn-danger" type="button">hapus</button></a>
                            <br/>
                          </div>
                        </div>
                      {/if}
                    {assign var="increment" value=$increment+1}
                    {/foreach}
                    </div>
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                      <span class="fa fa-angle-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                      <span class="fa fa-angle-right"></span>
                    </a>
                  </div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->

        </diV>
    </section><!-- /.content -->
{/block}
{block name=footer}
    <!-- validator -->
    <script src="{base_url()}plugins/validator.js" type="text/javascript"></script>
    <script type="text/javascript">
      var menu_oTables="";
      $(document).ready(function(){
        menu_oTables = $('#extmdm');
      });
      function reload_table(){
          menu_oTables.ajax.reload(null,false); //reload datatable ajax 
      }
      function hpsdt(id_emu){
       // ajax delete data to database
        swal({
            title: 'Are you sure?',
            text: "You won't be able to delete this!",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: true
          },
          function (isConfirm) {
            if (isConfirm) {
              $.ajax({
                type: "POST",
                data: {
                  id:id_emu
                },
                dataType:"HTML",
                url: "hapusdata",
                  success: function(data) {
                      reload_table();
                  },
                  error: function (jqXHR, textStatus, errorThrown)
                  {
                    swal("Error deleting!", "Please try again", "error");
                  }
              });
            }
              
          });
      }
    </script>
{/block}
