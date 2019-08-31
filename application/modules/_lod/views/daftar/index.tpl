{extends file="index.tpl"}
{block name=content}
	<!-- posts_sidebar -->
	{$script_captcha}
	<!-- datetimepicker -->
    <link href="{base_url()}plugins/datetimepicker/css/bootstrap-datepicker.css" media="all" rel="stylesheet" type="text/css" />
	<div class="main_page about_me col-md-8"><!-- main_page about_me -->
		<div class="row">

			<div class="post_header"><!-- post_header -->
				<h1>PENDATAAN PESERTA DIDIK BARU</h1>
				<span class="title_divider"></span>
			</div><br/><!-- // post_header -->
			<!--<div class="about_content"> about_content -->
			<!--</div> // about_content -->
			<div class="comment-form"><!-- comment-form -->
				<form method="post" id="myForm" class="form-js" action="{base_url()}_lod/mload/daftar">
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
									    </div>
									    {form_error('nama_depan')}
						    		</div>
						    		<div class="col-sm-6">
						    			<div class="input-group">
									       <span class="input-group-addon"><i class="fa fa-user"></i></span>
									       <input type="text" class="form-control" minlength="3" name="nama_belakang" value="{set_value('nama_belakang')}" placeholder="Nama belakang" required/>
									     </div>
									     {form_error('nama_belakang')}
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
						      </div>
						      {form_error('nik')}
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
						      </div>
						      {form_error('no_telepon')}
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
						    </div>
						    {form_error('email')}
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
						      </div>
						      {form_error('password')}
						    </div>
						  </div>
		              </div>
		            </div>
					<div class="form-group">
						<div class="row">
							<div class="col-sm-3">
							</div>
							<div class="col-sm-9">
								<div class="row">
									<div class="col-sm-4">
										{$getCaptcha}
									</div>
									<div class="col-sm-8">
										<div class="input-group">
									        <span class="input-group-addon"><i class="fa fa-check"></i></span>
									        <input type="text" name="captcha" class="form-control"  placeholder="captcha" required/>
									     </div>
									     {form_error('captcha')}
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
								<input type="submit" class="button" value="Daftar Akun">
							</div>
		                </div>
		            </div><br/>
				</form>
			</div><!-- // comment-form -->
		</div>
	</div><!-- // main_page about_me -->

	<div class="sidebar col-md-4"><!--Start Sidebar -->
		<div class="row">
			<div class="inner_sidebar">

				<div class="widget widget_login"><!-- Start widget Widget Login -->
					<h4 class="widget_title">Login</h4>
					<div class="widget_login">
						<form method="POST" action="{base_url()}_lod/auth_login/cek_login">
							<input type="email" value="email" name="username" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;">
							<div class="widget_login_password">
								<input type="password" value="Password" name="password" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;">
							</div>
							<input type="submit" value="Login" class="button">
						</form>
					</div>
				</div><!-- End Widget Latest Tweets -->

					
				<div class="widget widget_recent_post"><!-- Start widget recent post -->
					<h4 class="widget_title">Recent Post</h4>
					<ul class="recent_post">

						{foreach from=$fasilitas item=$fas}
						<li>
							<figure class="widget_post_thumbnail">
								<a href="#"><img src="{image($fas->id_content,'thumb')}" height="80" width="80" alt="Appropriately simplify quality imperatives"></a>
							</figure>
							<div class="widget_post_info">
								<h5><a href="{base_url()}_lod/mload/viewfasilitas/{$fas->id_content}">{$fas->judul}</a></h5>
								<div class="post_meta">
									<span><a href="#"><i class="fa fa-comments-o"></i> 0 comments</a></span>
									<span class="date_meta"><a href="#"><i class="fa fa-calendar"></i> {tgl_indo($fas->tgl_terbit)}</a></span>
								</div>
							</div>
						</li>
						{/foreach}
					</ul>
				</div><!-- End widget recent post -->
					
				<div class="widget  widget_tag_cloud"><!-- Start widget tag cloud -->
					<h4 class="widget_title">Tags</h4>
					<div class="tagcloud">
						<a href="{base_url()}_lod/mload/berita">berita</a>
						<a href="{base_url()}_lod/mload/fasilitas">fasilitas</a>
						<a href="{base_url()}_lod/content/ekstrakulikuler">ektrakulikuler</a>
						<a href="{base_url()}_lod/content/prestasi">prestasi</a>
					</div>
				</div><!-- End widget tag cloud -->
			</div>
		</div>
	</div><!--End Sidebar -->
{/block}
{block name=footer}
    <!-- Datetimepicker -->
    <script src="{base_url()}plugins/datetimepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        //function get_tanggal(){
            $(function () {
                $('#datepicker').datepicker({
                    format: 'dd-mm-yyyy',
                });
            });    
        //}      
    </script>
{/block}
