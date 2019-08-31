{extends file="daftar/dataa.tpl"}
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
    <section class="content-header">
      <div class="callout callout-warning">
        <h4>INFO!</h4>
        <p>Pastikan data yang anda masukkan sudah benar</p>
      </div>
    </section>
  {/if}
  <form action="{base_url()}_lod/daction/biaya_datapost" method="post">
    <!-- Main content -->
    <section class="content">
      <!-- quick email widget -->
      <div class="row">
        <div class="col-sm-12">
          <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Pengisian data biaya</h3>
            </div><!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal">
              <div class="box-body">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-3 control-label">Infaq Sekolah</label>
                  <div class="col-sm-9">
                    {assign var="increment" value=1}
                    {foreach from=$setting item=$row}
                      <div class="radio">
                        <label>    
                          <input type="radio" name="sumbangan" id="triggerr{$increment}" value="{$row->content}" checked required/>
                          {rupiah($row->content)}
                        </label>
                      </div>
                    {assign var="increment" value=$increment+1}
                    {/foreach}
                    <div class="radio">
                      <label>
                        <input type="radio" name="sumbangan" id="trigger" value="3" required/>
                        Lebih besar lagi
                      </label>
                    </div>
                    <div id="hidden_fields">
                        <div class="form-group">
                          <input type="number"  class="form-control" id="hidden_fields" name="lebih" placeholder="Rp xxx" value="0" required>
                        </div>
                    </div>
                  </div>
                </div><br/><br/>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Uang seragam</label>
                  <div class="col-sm-9">
                    <input type="number" class="form-control" name="uang_seragan" placeholder="Rp xxx" value="{$seragam->content}" readonly  required/>
                    {form_error('uang_seragan')}
                  </div>
                </div><br/><br/>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Uang SPP</label>
                  <div class="col-sm-9">
                    {foreach from=$setting_dua item=$r}
                      <div class="radio">
                        <label>
                          <input type="radio" name="uang_spp" id="optionsRadios1" value="{$r->content}" checked required/>
                          {rupiah($r->content)}
                        </label>
                      </div>
                    {/foreach}
                  </div>
                </div><br/><br/>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Uang Iuran Pengembangan Sekolah</label>
                  <div class="col-sm-9">
                    <input type="number" class="form-control" name="uang_kegiatan" placeholder="Rp xxx" value="{$kegiatan->content}" readonly  required/>
                    {form_error('uang_kegiatan')}
                  </div>
                </div><br/><br/>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Uang Buku</label>
                  <div class="col-sm-9">
                    <input type="number" class="form-control" name="uang_buku" placeholder="Rp xxx" value="{$buku->content}" readonly  required/>
                    {form_error('uang_buku')}
                  </div>
                </div>
              </div><!-- /.box-body -->
              <div class="box-footer">
                
              </div><!-- /.box-footer -->
            </form>
          </div><!-- /.box -->
        </div><!-- /.col -->
      
      </div><!-- /.row -->

      <pre class="prettyprint" style="background-color:white;">
        <button type="submit" class="pull-right btn btn-info" id="sendEmail">Simpan <i class="fa fa-arrow-circle-right"></i></button>
      </pre>
    </section><!-- /.content -->
  </form>

{/block}
{block name=footer}
<script type="text/javascript">
$(function() {
  // Get the form fields and hidden div
  var checkbox = $("#trigger");
  var checkbox2 = $("#triggerr1");
  var hidden = $("#hidden_fields");
  var populate = $("#triggerr2");
  hidden.hide();

  checkbox.change(function() {
    if (checkbox.is(':checked')) {
      // Show the hidden fields.
      hidden.show();
      $('[name="lebih"]').val("");
      // Populate the input.
      populate.val("Dude, this input got populated!");
    }else if(checkbox2.is(':checked')){
      hidden.hide();
      document.getElementById('hidden_fields').removeAttribute("required");
      $('[name="lebih"]').val("0");
    } else {
      hidden.hide();
      document.getElementById('hidden_fields').removeAttribute("required");
      $('[name="lebih"]').val("0");
    }
  });
  checkbox2.change(function() {
    if (checkbox.is(':checked')) {
      // Show the hidden fields.
      hidden.show();
      // Populate the input.
      populate.val("Dude, this input got populated!");
    }else if(checkbox2.is(':checked')){
      hidden.hide();
      document.getElementById('hidden_fields').removeAttribute("required");
      $('[name="lebih"]').val("0");
    } else {
      // Make sure that the hidden fields are indeed
      // hidden.
      hidden.hide();
      document.getElementById('hidden_fields').removeAttribute("required");
      $('[name="lebih"]').val("0");
    }
  });

  populate.change(function() {
    if (checkbox.is(':checked')) {
      // Show the hidden fields.
      hidden.show();
      // Populate the input.
      populate.val("Dude, this input got populated!");
    }else if(populate.is(':checked')){
      hidden.hide();
      document.getElementById('hidden_fields').removeAttribute("required");
      $('[name="lebih"]').val("0");
    } else {
      hidden.hide();
      document.getElementById('hidden_fields').removeAttribute("required");
      $('[name="lebih"]').val("0");
    }
  });

});
</script>
{/block}
