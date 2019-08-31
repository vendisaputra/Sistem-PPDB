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
          max-width: 300px;
      }
      .kv-reqd {
          color: red;
          font-family: monospace;
          font-weight: normal;
      }
  </style>
    <!-- Content Header (Page header) -->
    {if isset($message)}
      <section class="content-header">
        <div class="callout callout-info">
          <h4>INFO!</h4>
          <p>{$message}</p>
        </div>
      </section> 
    {/if}
    <!-- Main content -->
    <section class="content ">
      <form id="myForm" method="POST" action="{base_url()}_admin/tentang/ksekolah_post/{$ksekolah->id_s}" method="post" data-toggle="validator" role="form" enctype='multipart/form-data'>
        <!-- quick email widget -->
        <div class="box box-danger">
            <div class="box-header">
                <i class="fa fa-users"></i>
                <h3 class="box-title">Kepala Sekolah (300, 250) pixel</h3>
                <!-- tools box -->
                <div class="pull-right box-tools">
                    
                </div><!-- /. tools -->
            </div>
            <div class="box-body">
                <div class="form-group">
                      <div class="kv-avatar text-center" style="width:90%">
                          <input id="avatar-update" name="foto" type="file" class="file-loading">
                      </div>
                </div>
            </div>
            <div class="box-footer clearfix">
              <button type="submit" class="btn btn-danger">Update Data</button>
            </div>
        </div>
      </form>
    </section><!-- /.content -->

{/block}
{block name=footer}
<!-- validator -->
<script src="{base_url()}plugins/validator.js" type="text/javascript"></script>
<!-- file input -->
<script src="{base_url()}plugins/fileinput/js/fileinput.js" type="text/javascript"></script>
<script type="text/javascript">
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
        defaultPreviewContent: '<img src="{getimage($ksekolah->id_s,'thumb')}" alt="Your Avatar" style="width:90%"><h6 class="text-muted">Click to select</h6>',
        layoutTemplates: {
            main2: '{literal}{preview} {remove} {browse}{/literal}'
        },
        allowedFileExtensions: ["jpg", "png", "gif"]
    });
  </script>
{/block}
