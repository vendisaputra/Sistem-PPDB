{extends file="index.tpl"}
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

    {/if}
    <!-- Main content -->
    <section class="content">
      <form id="myForm" method="POST" action="{base_url()}_admin/tentang/update_kop/{$logo->id_s}" method="post" data-toggle="validator" role="form" enctype='multipart/form-data'>
        <!-- quick email widget -->
        <div class="box box-danger">
            <div class="box-header">
                <i class="fa fa-users"></i>
                <h3 class="box-title">Logo Sekolah</h3>
                <!-- tools box -->
                <div class="pull-right box-tools">
                    
                </div><!-- /. tools -->
            </div>
            <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Logo (282, 70) pixel</label>
                  <input type="file" name="file" id="input-6">
                </div>

                <div class="form-group">
                  <label for="exampleInputEmail1">Nama Sekolah</label>
                  <input type="text" name="nsekolah" class="form-control" value="{$logo->value}" required/>
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
<script>
  $(document).on('ready', function() {
      $("#input-6").fileinput({
          showUpload: false,
          maxFileCount: 10,
          mainClass: "input-group-lg",
          defaultPreviewContent: '<img src="{getimage($logo->id_s,'thumb')}" alt="Your Avatar" style="width:90%"><h6 class="text-muted">Click to select</h6>',
      });
  });
</script>
{/block}
