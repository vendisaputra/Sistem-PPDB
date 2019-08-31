{extends file="index.tpl"}
{block name=content}
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
      <form id="myForm" method="POST" action="{base_url()}_admin/tentang/updatedata_tt">
        <!-- quick email widget -->
        <div class="box box-danger">
            <div class="box-header">
                <i class="fa fa-users"></i>
                <h3 class="box-title">Tentang Sekolah</h3>
                <!-- tools box -->
                <div class="pull-right box-tools">
                    
                </div><!-- /. tools -->
            </div>
            <div class="box-body">
                <textarea name="tt" id="textarea">{$tentang->value}</textarea>
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
{/block}
