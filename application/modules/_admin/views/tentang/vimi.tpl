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
      <form id="myForm" method="POST" action="{base_url()}_admin/tentang/updatedata">
        <!-- quick email widget -->
        <div class="box box-danger">
            <div class="box-header">
                <i class="fa fa-users"></i>
                <h3 class="box-title">Visi Sekolah</h3>
                <!-- tools box -->
                <div class="pull-right box-tools">
                    
                </div><!-- /. tools -->
            </div>
            <div class="box-body">
                <textarea name="vis" id="textarea">{$visi->value}</textarea>
            </div>
            <div class="box-footer clearfix">
              <button type="submit" class="btn btn-danger">Update Data</button>
            </div>
        </div>
      </form>
    </section><!-- /.content -->

    <section class="content">
      <form id="myForm_dua" method="POST" action="{base_url()}_admin/tentang/updatedata_dua">
        <!-- quick email widget -->
        <div class="box box-info">
            <div class="box-header">
                <i class="fa fa-users"></i>
                <h3 class="box-title">Misi Sekolah</h3>
                <!-- tools box -->
                <div class="pull-right box-tools">
                    
                </div><!-- /. tools -->
            </div>
            <div class="box-body">
                <textarea id="textareaa" name="misi">{$misi->value}</textarea>
            </div>
            <div class="box-footer clearfix">
              <button type="submit" class="btn btn-info">Update Data</button>
            </div>
        </div>
      </form>
    </section><!-- /.content -->

{/block}
{block name=footer}
<!-- validator -->
<script src="{base_url()}plugins/validator.js" type="text/javascript"></script>
<script>
    tinymce.init({
        selector: "#textareaa",theme: "modern",height: 220,
        plugins: [
             "advlist autolink link image lists charmap print preview hr anchor pagebreak",
             "searchreplace wordcount visualblocks visualchars insertdatetime media nonbreaking",
             "table contextmenu directionality emoticons paste textcolor"
       ],
       toolbar1: "undo redo | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | styleselect",
       toolbar2: "| responsivefilemanager | link unlink anchor | image media | forecolor backcolor  | print preview code ",
       image_advtab: true ,
       external_filemanager_path:"{base_url()}plugins/filemanager/",
       filemanager_title:"Responsive Filemanager" ,
       external_plugins: { "filemanager" : "../filemanager/plugin.min.js"}
    });
</script>

{/block}
