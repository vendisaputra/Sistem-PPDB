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
  <form action="{base_url()}_admin/guru/insertdata" method="post" data-toggle="validator" role="form" enctype='multipart/form-data'>
    <!-- Main content -->
    <section class="content">
        <div class="row">
        <div class="col-sm-12">
            <!-- quick email widget -->
            <div class="box box-info">
                <div class="box-header">
                    <i class="fa fa-plus"></i>
                    <h3 class="box-title">Tambah Data Guru</h3>
                    <!-- tools box -->
                    <div class="pull-right box-tools">
                        
                    </div><!-- /. tools -->
                </div>
                <div class="box-body">
                    <!-- form start --> 
                    <div class="box-body">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Nama</label>
                        <input type="text" name="nama" class="form-control" placeholder="nama lengkap" required/>
                      </div>

                      <div class="form-group">
                        <label for="exampleInputEmail1">Username</label>
                        <input type="text" name="username" class="form-control" placeholder="username" required/>
                      </div>

                      <div class="form-group">
                        <label for="exampleInputEmail1">Password</label>
                        <input type="password" name="password" class="form-control" placeholder="***********" required/>
                      </div>

                    </div><!-- /.box-body -->
                </div>
                <div class="box-footer clearfix">
                  <button type="submit" class="btn btn-primary">Simpan data</button>
                </div>
            </div>
        </div>
      </div>

    </section><!-- /.content -->
  </form>
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
      });
  });
</script>
{/block}
