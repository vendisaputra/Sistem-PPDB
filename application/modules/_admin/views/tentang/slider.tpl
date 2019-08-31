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
          max-width:100%;
      }
      .kv-reqd {
          color: red;
          font-family: monospace;
          font-weight: normal;
      }
  </style>
  <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
        <div class="row">
          <form method="POST" action="{base_url()}_admin/tentang/slider" enctype="multipart/form-data">
            <div class="col-md-12">
              <div class="box box-success">
                <div class="box-header with-border">
                  <h3 class="box-title">Carousel</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div class="row">
                  <div class="col-md-6">
                    <div class="box box-info">
                      <div class="box-header with-border">
                        <h3 class="box-title">Foto</h3>
                      </div><!-- /.box-header -->
                      <div class="box-body">
                          <div class="form-group">
                              <div class="kv-avatar text-center">
                                  <input id="avatar-update" name="avatar-2" type="file" class="file-loading">
                              </div>
                              {form_error('avatar-2')}
                          </div>
                      </div><!-- /.box-body -->
                    </div><!-- /.box -->
                  </div>

                  <div class="col-md-6">
                    <div class="box box-danger">
                      <div class="box-header with-border">
                        <h3 class="box-title">Text</h3>
                      </div><!-- /.box-header -->
                      <div class="box-body">
                          <div class="form-group">
                              <textarea class="textarea" name="content" placeholder="Place some text here" style="width: 100%; height: 396px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                              {form_error('content')}
                          </div>
                      </div><!-- /.box-body -->
                    </div><!-- /.box -->
                    
                  </div>
                  </div>
                </div><!-- /.box-body -->
                <div class="box-footer">
                  <div class="box-tools pull-right">
                    <button type="submit" class="btn btn-info btn-flat">Simpan data <i class="fa fa-save"></i></button>
                  </div>
                </div><!-- /.box-footer -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </form>  
        </diV>
    </section><!-- /.content -->
{/block}
{block name=footer}
    <!-- validator -->
    <script src="{base_url()}plugins/validator.js" type="text/javascript"></script>
    <!-- file input -->
    <script src="{base_url()}plugins/fileinput/js/fileinput.js" type="text/javascript"></script>
    <script>
      $("#avatar-update").fileinput({
            overwriteInitial: true,
            maxFileSize: 10000,
            showClose: false,
            showCaption: false,
            showBrowse: false,
            browseOnZoneClick: true,
            removeLabel: '',
            removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
            removeTitle: 'Cancel or reset changes',
            elErrorContainer: '#kv-avatar-errors-2',
            msgErrorClass: 'alert alert-block alert-danger',
            defaultPreviewContent: '<img src="{base_url()}assets/user/img/slider/1.jpg" alt="Your Avatar" style="width:100%"><h6 class="text-muted">Click to select</h6>',
            layoutTemplates: {
                main2: '{literal}{preview} {remove} {browse}{/literal}'
            },
            allowedFileExtensions: ["jpg", "png", "gif"]
        });
    </script>
{/block}
