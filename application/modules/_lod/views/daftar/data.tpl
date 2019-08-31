{extends file="index.tpl"}
{block name=content}
	<!-- posts_sidebar -->
	<div class="main_page about_me col-md-8"><!-- main_page about_me -->
		<div class="row">

			<div class="post_header"><!-- post_header -->
				<h1>Lengkapi data diri anda</h1>
				<span class="title_divider"></span>
			</div><br/><!-- // post_header -->

			<!--<div class="about_content"> about_content -->
			<!--</div> // about_content -->
			<div class="comment-form"><!-- comment-form -->
				<form method="post" id="myForm" class="form-js" action="{base_url()}_lod/mload/load_daftar">
					<div class="form-input">
						<i class="fa fa-user"></i>
						<input type="text" name="nama_depan" id="name" placeholder="Nama depan" required/>
					</div>
					<div class="form-input">
						<i class="fa fa-user"></i>
						<input type="text" name="nama_belakang" id="name" placeholder="Nama belakang" required/>
					</div>
					<div class="form-input">
						<i class="fa fa-user"></i>
						<input type="text" name="nik" id="name" placeholder="NIK" required/>
					</div>
					<div class="form-input">
						<i class="fa fa-phone-square"></i>
						<input type="text" name="no_telepon" id="name" placeholder="Nomor hp" required/>
					</div>
					<div class="form-input">
						<i class="fa fa-envelope"></i>
						<input type="email" name="email" id="mail" placeholder="Email" required/>
					</div>
					<div class="form-input">
						<i class="fa fa-key"></i>
						<input type="password" name="password" id="name" placeholder="Password" required/>
					</div>
					<input type="submit" class="button" value="Daftar Akun"></form>
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
        <!--<script src="{base_url()}assets/user/js/validator.js" type="text/javascript"></script>
        <script>
        $('#myForm').validator().on('submit', function (e) {
                if (e.isDefaultPrevented()) {
                   //swal("Error insert data!", "Lengkapi data terlebih dahulu", "error");
                }else{
                  var formData = $('#myForm').serialize();
                  $.ajax({
                      url: "insertdata",
                      type:"post",
                      data : formData,
                      dataType: "JSON",
                      success:function(data){
                        if(data.status) {
                            sweet("Data sudah Masuk");
                            $('[name="nik"]').val("");
                            $('[name="nama"]').val("");
                            $('[name="jabatan"]').val("");
                            $('[name="devisi"]').val("");
                            $('[name="alamat"]').val("");
                            $('[name="tempat"]').val("");
                            $('[name="tgl_lahir"]').val("dd-mm-yyyy");
                            $('[name="email_karyawan"]').val("");
                            $('[name="status"]').val("");
                            $('[name="no_telepon_karyawan"]').val("");
                            //event.preventDefault();
                        }else{
                            swal("Error insert data!", "Data yang anda masukkan sudah ada", "error");
                        }
                        $('#ayogaskan').text("kirim");
                      },error: function(jqXHR, textStatus, errorThrown){
                          $('#ayogaskan').text("kirim");
                          swal("Error insert data!", "Please try again", "error");
                        }

                  });
                  
                  e.preventDefault();
                }
        });
        </script>-->
{/block}
