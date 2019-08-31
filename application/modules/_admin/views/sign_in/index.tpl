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
                  {/if}
                <!-- Main content -->
                <section class="content">
                    <!-- quick email widget -->
                            <div class="box box-info">
                                <div class="box-header">
                                    <i class="fa fa-plus"></i>
                                    <h3 class="box-title">Guru</h3>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        
                                    </div>
                                </div>
                                <div class="box-body">
                                    <form method="POST" data-toggle="validator" role="form" id="myForm" enctype='multipart/form-data' action="{base_url()}_admin/set/updatedata">
                                        <!-- text input -->
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input type="text" name="username" class="form-control" value="{$tmed->username}" placeholder="Nomer Induk Karyawan" required/>
                                            <input type="hidden" name="id_admin" class="form-control" value="{$tmed->id_admin}" placeholder="Nomer Induk Karyawan" required/>
                                        </div>
                                        <div class="form-group">
                                            <label>Password Baru</label>
                                            <input type="password" name="password" data-minlength="6" id="inputPassword" class="form-control" placeholder="*************" required/>
                                            <div class="help-block">Minimum of 6 characters</div>
                                        </div>
                                        <div class="form-group">
                                            <label>Konfirmasi Password</label>
                                            <input type="Password" name="confirmpassword" class="form-control" id="inputPasswordConfirm" data-match="#inputPassword" data-match-error="Whoops, these don't match" placeholder="Confirm password" required/>
                                        </div>
                                        <div class="form-group">
                                            <label>Password Lama</label>
                                            <input type="password" name="password_lama" class="form-control" placeholder="*************" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-info" id="ayogaskan" value="edit">
                                        </div>
                                        
                                    </form>
                                </div>
                                <div class="box-footer clearfix">
                                    
                                </div>
                            </div>

                </section><!-- /.content -->
{/block}
{block name=footer}
        <script src="{base_url()}plugins/validator.js" type="text/javascript"></script>
{/block}
            