{extends file="index.tpl"}
{block name=content}
	{if isset($message)}
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="callout callout-info">
        <h4>INFO!</h4>
        <p>{$message}</p>
      </div>
    </section>
  {else}
    <section class="content-header">
      <div class="callout callout-danger">
        <h4>Perhatian!</h4>
        <p>Mohon lengkapi data diri terlebih dahulu.</p>
      </div>
    </section>
  {/if}
  <form action="{base_url()}_admin/pengumuman/insertdata" method="post" data-toggle="validator" role="form" enctype='multipart/form-data'>
    <!-- Main content -->
    <section class="content">
            <!-- quick email widget -->
            <div class="box box-info">
                <div class="box-header">
                    <i class="fa fa-plus"></i>
                    <h3 class="box-title">Insert data</h3>
                    <!-- tools box -->
                    <div class="pull-right box-tools">
                        
                    </div><!-- /. tools -->
                </div>
                <div class="box-body">
                    <!-- form start --> 
                    <div class="box-body">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Judul</label>
                        <input type="text" name="judul" class="form-control" placeholder="judul" required/>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail1">Isi pengumuman</label>
                        <textarea id="textarea" name="isi" class="form-control" ></textarea>
                      </div>
                    </div><!-- /.box-body -->
                </div>
                <div class="box-footer clearfix">
                  <button type="submit" class="btn btn-primary">Simpan data</button>
                </div>
            </div>
    </section><!-- /.content -->
  </form>
{/block}
{block name=footer}
<!-- validator -->
<script src="{base_url()}plugins/validator.js" type="text/javascript"></script>
{/block}
