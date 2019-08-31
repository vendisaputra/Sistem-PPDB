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
    {/if}
    <!-- Main content -->
    <section class="content ">
      <form id="myForm" method="POST" action="{base_url()}_admin/tentang/alamatpost/{$logo->id_s}" method="post" data-toggle="validator" role="form" enctype='multipart/form-data'>
        <!-- quick email widget -->
        <div class="box box-danger">
            <div class="box-header">
                <i class="fa fa-users"></i>
                <h3 class="box-title">Alamat Sekolah</h3>
                <!-- tools box -->
                <div class="pull-right box-tools">
                    
                </div><!-- /. tools -->
            </div>
            <div class="box-body">
                <div class="form-group">
                      <textarea class="form-control" name="content" required>{$logo->value}</textarea>
                </div>
            </div>
            <div class="box-footer clearfix">
              <button type="submit" class="btn btn-danger pull-right">Update Data</button>
            </div>
        </div>
      </form>
    </section><!-- /.content -->

{/block}
{block name=footer}
<!-- validator -->
<script src="{base_url()}plugins/validator.js" type="text/javascript"></script>
{/block}
