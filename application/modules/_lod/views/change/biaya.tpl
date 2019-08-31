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
    {/if}
  <form action="{base_url()}_lod/edata/biaya_post" method="post">
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
                          {if $row->content == $tmed->sumbangan} 
                            <input type="radio" name="sumbangan" id="triggerr{$increment}" value="{$row->content}" checked required/>
                          {else}
                            <input type="radio" name="sumbangan" id="triggerr{$increment}" value="{$row->content}" required/>
                          {/if}
                          {rupiah($row->content)}
                        </label>
                      </div>
                    {assign var="increment" value=$increment+1}
                    {/foreach}
                    <div class="radio">
                      <label>
                        
                          {if in_array($tmed->sumbangan, $cek)} 
                            <input type="radio" name="sumbangan" id="trigger" value="3" required/>
                          {else}
                            <input type="radio" name="sumbangan" id="trigger" value="3" checked required/>
                          {/if}
                        
                        Lebih besar lagi
                      </label>
                    </div>
                    <div id="hidden_fields">
                        <div class="form-group">
                          <input type="text"  class="form-control" id="hidden_fields" name="lebih" value="" placeholder="Rp xxx" required/>
                        </div>
                    </div>
                  </div>
                </div><br/><br/>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Uang seragam</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" name="uang_seragan" placeholder="Rp xxx" value="{$tmed->uang_seragan}" readonly required/>
                    {form_error('uang_seragan')}
                  </div>
                </div><br/><br/>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Uang SPP</label>
                  <div class="col-sm-9">
                     {assign var="d" value=1}
                    {foreach from=$setting_dua item=$r}
                      <div class="radio">
                        <label>
                          
                          {if $r->content == $tmed->uang_spp} 
                            <input type="radio" name="uang_spp" id="triggerr{$d}" value="{$r->content}" checked required/>
                          {else}
                            <input type="radio" name="uang_spp" id="triggerr{$d}" value="{$r->content}"  required/>
                          {/if}
                          {rupiah($r->content)}
                        </label>
                      </div>
                      {assign var="d" value=$d+1}
                    {/foreach}
                  </div>
                </div><br/><br/>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Uang Iuran Pengembangan Sekolah</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" name="uang_kegiatan" placeholder="Rp xxx" value="{$tmed->uang_kegiatan}" readonly required/>
                    {form_error('uang_kegiatan')}
                  </div>
                </div>
                <br/><br/>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-3 control-label">Uang Buku</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" name="uang_buku" placeholder="Rp xxx" value="{$tmed->uang_buku}" readonly required/>
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
  if (checkbox.is(':checked')) {
    hidden.show();
    $('[name="lebih"]').val("{$tmed->sumbangan}");
  }else{
    hidden.hide();
    $('[name="lebih"]').val("");
    $('[name="lebih"]').removeAttr('required');
  }
  checkbox.change(function() {
    if (checkbox.is(':checked')) {
      // Show the hidden fields.
      hidden.show();
      $('[name="lebih"]').val("{$tmed->sumbangan}");
      // Populate the input.
      populate.val("Dude, this input got populated!");
    }else if(checkbox2.is(':checked')){
      hidden.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields').removeAttribute("required");
    } else {
      hidden.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields').removeAttribute("required");
    }
  });
  checkbox2.change(function() {
    if (checkbox.is(':checked')) {
      // Show the hidden fields.
      hidden.show();
      $('[name="lebih"]').val("{$tmed->sumbangan}");
      // Populate the input.
      populate.val("Dude, this input got populated!");
    }else if(checkbox2.is(':checked')){
      hidden.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields').removeAttribute("required");
    } else {
      // Make sure that the hidden fields are indeed
      // hidden.
      hidden.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields').removeAttribute("required");
    }
  });

  populate.change(function() {
    if (checkbox.is(':checked')) {
      // Show the hidden fields.
      hidden.show();
      $('[name="lebih"]').val("{$tmed->sumbangan}");
      // Populate the input.
      populate.val("Dude, this input got populated!");
    }else if(populate.is(':checked')){
      hidden.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields').removeAttribute("required");
    } else {
      hidden.hide();
      $('[name="lebih"]').val("0");
      document.getElementById('hidden_fields').removeAttribute("required");
    }
  });

});
</script>
{/block}
