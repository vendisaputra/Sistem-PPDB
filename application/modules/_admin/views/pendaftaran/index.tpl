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
 {else}
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="callout callout-danger">
        <h4>INFO!</h4>
        <p>Lengkapi data terlebih dahulu</p>
      </div>
    </section>
  {/if}
  
    <!-- Main content -->
    <section class="content">
        <!-- quick email widget -->
        <div class="box box-info">
            <div class="box-header">
                <i class="fa fa-users"></i>
                <h3 class="box-title">Pendaftaran peseta didik baru</h3>
                <!-- tools box -->
                <div class="pull-right box-tools">
                    
                </div><!-- /. tools -->
            </div>
            <div class="box-body">
                <form method="post" id="myForm" class="form-js" action="{base_url()}_admin/main/daftar">
					<div class="form-group">
		              <div class="row">
		                <div class="form-group">
						    <label class="control-label col-sm-3" for="inputGroupSuccess2">Nama</label>
						    <div class="col-sm-9">
						    	<div class="row">
						    		<div class="col-sm-6">
						    			<div class="input-group">
									       <span class="input-group-addon"><i class="fa fa-user"></i></span>
									       <input type="text" class="form-control" name="nama_depan" placeholder="Nama depan" minlength="3" value="{set_value('nama_depan')}" required/>
									        {form_error('nama_depan')}
									    </div>
						    		</div>
						    		<div class="col-sm-6">
						    			<div class="input-group">
									       <span class="input-group-addon"><i class="fa fa-user"></i></span>
									       <input type="text" class="form-control" minlength="3" name="nama_belakang" value="{set_value('nama_belakang')}" placeholder="Nama belakang" required/>
									        {form_error('nama_belakang')}
									     </div>
						    		</div>
						    	</div>
						    </div>
						  </div>
		              </div>
		            </div>
		            <div class="form-group">
		              <div class="row">
		                <div class="form-group">
						    <label class="control-label col-sm-3" for="inputGroupSuccess2">NIK</label>
						    <div class="col-sm-9">
						      <div class="input-group">
						        <span class="input-group-addon"><i class="fa fa-user"></i></span>
						        <input type="number" name="nik" minlength="12" class="form-control" id="name" placeholder="NIK" value="{set_value('nik')}" required/>
						        {form_error('nik')}
						      </div>
						    </div>
						  </div>
		              </div>
		            </div>
		            <div class="form-group">
		              <div class="row">
		                <div class="form-group">
						    <label class="control-label col-sm-3" for="inputGroupSuccess2">Nomor hp</label>
						    <div class="col-sm-9">
						      <div class="input-group">
						        <span class="input-group-addon"><i class="fa fa-phone-square"></i></span>
						        <input type="number" name="no_telepon" class="form-control" id="name" minlength="10" placeholder="Nomor hp" value="{set_value('no_telepon')}" required/>
						        {form_error('no_telepon')}
						      </div>
						    </div>
						  </div>
		              </div>
		            </div>
		            <div class="form-group">
		              <div class="row">
		                <div class="form-group">
						    <label class="control-label col-sm-3" for="inputGroupSuccess2">Email</label>
						    <div class="col-sm-9">
						      <div class="input-group">
						        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
						        <input type="email" name="email" class="form-control" id="mail" value="{set_value('email')}" placeholder="Email" required/>
						      </div>
						      {form_error('email')}
						    </div>
						  </div>
		              </div>
		            </div>
		            <div class="form-group">
		              <div class="row">
		                <div class="form-group">
						    <label class="control-label col-sm-3" for="inputGroupSuccess2">Password</label>
						    <div class="col-sm-9">
						      <div class="input-group">
						        <span class="input-group-addon"><i class="fa fa-key"></i></span>
						        <input type="password" name="password" class="form-control" id="name" minlength="6" placeholder="Password" required/>
						      	{form_error('password')}
						      </div>
						    </div>
						  </div>
		              </div>
		            </div>
					
		            <div class="form-group">
						<div class="row">
							<div class="col-sm-3">
							</div>
							<div class="col-sm-9">
								<input type="submit" class="btn btn-info" value="Daftar Akun">
							</div>
		                </div>
		            </div><br/>
				</form>
            </div>
            <div class="box-footer clearfix">
            </div>
        </div>

    </section><!-- /.content -->
  

  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-aqua">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Detail Data Guru</h4>
        </div>
        <div class="modal-body">
           <form role="form" id="myForm">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Nama Lengkap</label>
                  <input type="text" name="nama" class="form-control"  placeholder="Nama Depan" required/>
                  <input type="hidden" name="id_guru" class="form-control"  placeholder="Nama Depan">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">username</label>
                  <input type="text" name="username" class="form-control"  placeholder="Nama Belakang" required/>
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Password</label>
                  <input type="password" name="password" class="form-control"  placeholder="*************">
                </div>
              </div><!-- /.box-body --> 
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        </form>
      </div>
    </div>
  </div>
{/block}
{block name=footer}
<!-- validator -->
<script src="{base_url()}plugins/validator.js" type="text/javascript"></script>
{/block}
