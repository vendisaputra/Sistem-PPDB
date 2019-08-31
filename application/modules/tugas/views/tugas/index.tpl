{extends file="index.tpl"}
{block name=content}
	{if isset($message)}
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="callout callout-success">
        <h4>INFO!</h4>
        <p>{$message}</p>
      </div>
    </section>
  {/if}
    <!-- Main content -->
    <section class="content">
        <!-- quick email widget -->
        <div class="box box-info">
            <div class="box-header">
                <i class="fa fa-users"></i>
                <h3 class="box-title">Daftar tugas</h3>
                <!-- tools box -->
                <div class="pull-right box-tools">
                    
                </div><!-- /. tools -->
            </div>
            <div class="box-body">
                <div class="well" style="border-radius:0px;height: auto; padding-top:11px; padding-bottom:11px;">
                    <div class="row">
                        <a href="{base_url()}tugas/tugas/inputTugas"><button type="button" class="btn btn-info btn-flat btn-sm"><i class="fa fa-plus"></i> Tambah data</button></a>
                    </div>
                </div>
                <div class="table-responsive">
                    <table id="extmdm" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>Judul</th>
                                <th>Tgl terbit</th>
                                <th>Isi</th>
                                <th><center>action</center></th>
                            </tr>
                        </thead>
                        <tfoot>
      
                        </tfoot>
                    </table>
                </div>
            </div>
            <div class="box-footer clearfix">
            </div>
        </div>

    </section><!-- /.content -->
{/block}
{block name=footer}
<!-- validator -->
<script src="{base_url()}plugins/validator.js" type="text/javascript"></script>
 <!-- data tables -->
<script src="{base_url()}plugins/media/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="{base_url()}plugins/media/js/dataTables.bootstrap.js" type="text/javascript"></script>
<script src="{base_url()}assets/guru/tugas.js" type="text/javascript"></script>
{/block}
