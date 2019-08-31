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
  <form action="{base_url()}_admin/berita/insertdata" method="post" data-toggle="validator" role="form" enctype='multipart/form-data'>
    <!-- Main content -->
    <section class="content">
        <div class="row">
        <div class="col-sm-8">
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
                        <label for="exampleInputEmail1">Cover (640, 426) pixel</label>
                        <input type="file" name="file" id="input-6" required/>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail1">Isi Content</label>
                        <textarea id="textarea" name="isi" class="form-control" ></textarea>
                      </div>
                    </div><!-- /.box-body -->
                </div>
                <div class="box-footer clearfix">
                </div>
            </div>
        </div>
         <div class="col-sm-4">
            <!-- quick email widget -->
            <div class="box box-danger">
                <div class="box-header">
                    <i class="fa fa-list-ol"></i>
                    <h3 class="box-title">Kategori</h3>
                    <!-- tools box -->
                    <div class="pull-right box-tools">
                        
                    </div><!-- /. tools -->
                </div>
                  <div class="box-body">
                      <!-- form start --> 
                      <div class="box-body">
                        <!-- radio -->
                        <div class="form-group">
                          <div class="radio">
                            <label>
                              <input type="radio" name="optionsRadios" id="optionsRadios1" value="fasilitas" checked required>
                              Fasilitas
                            </label>
                          </div>
                          <div class="radio">
                            <label>
                              <input type="radio" name="optionsRadios" id="optionsRadios2" value="berita" required>
                              Berita
                            </label>
                          </div>
                          <div class="radio">
                            <label>
                              <input type="radio" name="optionsRadios" id="optionsRadios1" value="prestasi" required>
                              Prestasi
                            </label>
                          </div>
                          <div class="radio">
                            <label>
                              <input type="radio" name="optionsRadios" id="optionsRadios2" value="ekstrakulikuler" required>
                              Ekstrakulikuler
                            </label>
                          </div>
                        </div>
                      </div><!-- /.box-body -->
                      
                  </div>
                  <div class="box-footer clearfix">
                  </div>
            </div>
            <pre class="prettyprint" style="background-color:white;">
              <button type="submit" class="pull-right btn btn-danger" id="sendEmail">Simpan data <i class="fa fa-arrow-circle-right"></i></button>
            </pre>
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
