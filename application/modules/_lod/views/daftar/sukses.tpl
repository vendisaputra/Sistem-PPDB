{extends file="index.tpl"}
{block name=content}
	<!-- posts_sidebar -->
	<div class="main_page about_me col-md-8"><!-- main_page about_me -->
		<div class="row">

			<div class="post_header"><!-- post_header -->
				<h1>PENDAFTARAN PESERTA DIDIK BARU</h1>
				<span class="title_divider"></span>
			</div><br/><!-- // post_header -->
			<!--<div class="about_content"> about_content -->
			<!--</div> // about_content -->
			<div class="comment-form"><!-- comment-form -->
				<div class="hamzh-alert red" align="justify">
					terima kasih sudah melakukan pendaftaran akun, silakan
					melakukan pembayaran melalui transfer ke bank <strong>{$kon[0]}</strong> nomor rekening <strong>{$kon[1]}</strong> dan kemudian kirimkan bukti
					pembayaran anda kepada contact person <strong>{$kon[2]}</strong> melalui <strong>{$kon[3]}</strong>
				</div>
				<div class="hamzh-alert red">
					<h3>Pendaftaran telah berhasil dilakukan</h3>
				</div>	
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

						<li>
							<figure class="widget_post_thumbnail">
								<a href="#"><img src="{base_url()}assets/user/img/demo/wid/1.png" height="80" width="80" alt="Appropriately simplify quality imperatives"></a>
							</figure>
							<div class="widget_post_info">
								<h5><a href="#">Appropriately simplify quality imperatives</a></h5>
								<div class="post_meta">
									<span><a href="#"><i class="fa fa-comments-o"></i> 0 comments</a></span>
									<span class="date_meta"><a href="#"><i class="fa fa-calendar"></i> Mar 10, 2015</a></span>
								</div>
							</div>
						</li>

						<li>
							<figure class="widget_post_thumbnail">
								<a href="#"><img src="{base_url()}assets/user/img/demo/wid/2.png" height="80" width="80" alt="Appropriately simplify quality imperatives"></a>
							</figure>
							<div class="widget_post_info">
								<h5><a href="#">Appropriately simplify quality imperatives</a></h5>
								<div class="post_meta">
									<span><a href="#"><i class="fa fa-comments-o"></i> 0 comments</a></span>
									<span class="date_meta"><a href="#"><i class="fa fa-calendar"></i> Mar 10, 2015</a></span>
								</div>
							</div>
						</li>

						<li>
							<figure class="widget_post_thumbnail">
								<a href="#"><img src="{base_url()}assets/user/img/demo/wid/3.png" height="80" width="80" alt="Appropriately simplify quality imperatives"></a>
							</figure>
							<div class="widget_post_info">
								<h5><a href="#">Appropriately simplify quality imperatives</a></h5>
								<div class="post_meta">
									<span><a href="#"><i class="fa fa-comments-o"></i> 0 comments</a></span>
									<span class="date_meta"><a href="#"><i class="fa fa-calendar"></i> Mar 10, 2015</a></span>
								</div>
							</div>
						</li>

						<li>
							<figure class="widget_post_thumbnail">
								<a href="#"><img src="{base_url()}assets/user/img/demo/wid/4.png" height="80" width="80" alt="Appropriately simplify quality imperatives"></a>
							</figure>
							<div class="widget_post_info">
								<h5><a href="#">Appropriately simplify quality imperatives</a></h5>
								<div class="post_meta">
									<span><a href="#"><i class="fa fa-comments-o"></i> 0 comments</a></span>
									<span class="date_meta"><a href="#"><i class="fa fa-calendar"></i> Mar 10, 2015</a></span>
								</div>
							</div>
						</li>
					</ul>
				</div><!-- End widget recent post -->
					
				<div class="widget  widget_tag_cloud"><!-- Start widget tag cloud -->
					<h4 class="widget_title">Tags</h4>
					<div class="tagcloud">
						<a href="#">audio</a>
						<a href="#">dailymotion</a>
						<a href="#">Gallery</a>
						<a href="#">LightBox</a>
						<a href="#">Link</a>
						<a href="#">mp3</a>
						<a href="#">nature</a>
						<a href="#">post</a>
						<a href="#">Quote</a>
						<a href="#">slider</a>
						<a href="#">soundcloud</a>
						<a href="#">sport</a>
						<a href="#">Standard</a>
						<a href="#">Twitter</a>
						<a href="#">vimeo</a>
					</div>
				</div><!-- End widget tag cloud -->
			</div>
		</div>
	</div><!--End Sidebar -->
{/block}
{block name=footer}
  
{/block}
