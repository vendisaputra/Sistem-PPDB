<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]>
<!--> <!--<![endif]-->
<html lang="en">
<head>

  <!-- Basic Page Needs
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta charset="utf-8">
  <title>{$title|default:'Default Page Title'}</title>
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Mobile Specific Metas
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- CSS
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link rel="stylesheet" type="text/css" href="{base_url()}assets/user/style.css">
  <link rel="stylesheet" type="text/css" href="{base_url()}assets/user/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="{base_url()}assets/user/css/bootstrap-theme.css">
  <link rel="stylesheet" type="text/css" href="{base_url()}assets/user/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="{base_url()}assets/user/css/skins/blue.css">
  <!-- Favicon
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link rel="icon" type="image/png" href="{base_url()}assets/user/img/logo.ico">

  <!-- Javascript
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <script type="text/javascript" src="{base_url()}assets/user/js/jquery.v2.1.3.js"></script>
  <script type="text/javascript" src="{base_url()}assets/user/js/bootstrap.min.js"></script>

</head>
<meta name="google-site-verification" content="1gkxCumOo8d1HUVa1z4tSQLXWLzM541-P-rv8Mx7fAo" />
<body>

  <!-- News Page Layout
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->

	<div class="all_content blog_layout animsition container-fluid">
		<div class="row">
			<div class="header"><!-- Start header -->
				<div class="top_bar"><!-- Start top_bar -->
					<div class="min_top_bar"><!-- Start min_top_bar -->
						<div class="container">
							

							<div id="top_search_ico"><!-- Start top_search_ico -->
								<div class="top_search"><!-- Start top_search -->
									<form method="get" action="{base_url()}_lod/search/index"><input type="text" name="search" placeholder="Search and hit enter..."></form>
									<di class="fa fa-search search-desktop"></i>
								</div><!-- End top_search -->

								<div id="top_search_toggle"><!-- Start top_search_toggle -->
									<div id="search_toggle_top">
									<form method="get" action="{base_url()}search/index"><input type="text" name="search" placeholder="Search and hit enter..."></form>
									</div>
									<i class="fa fa-search search-desktop"></i>
								</div><!-- End top_search_toggle -->
							</div><!-- End top_search_ico -->

							<div class="social_icon"><!-- Start social_icon -->
								<span><a href="{get_metsos('facebook')}"><i class="fa fa-facebook"></i></a></span>
								<span><a href="{get_metsos('instagram')}"><i class="fa fa-instagram"></i></a></span>
								<span><a href="{get_metsos('youtube')}"><i class="fa fa-youtube"></i></a></span>
								<span><a href="{get_metsos('nisn')}" title="NISN"><img src="{base_url()}/assets/user/img/nisn.png" width="" height="20"></a></span>
							</div><!-- End social_icon -->
						</div>
					</div><!-- End min_top_bar -->
				</div><!-- End top_bar -->

				<div class="main_header"><!-- Start main_header -->
					<div class="container">
						<div class="logo logo_blog_layout"><!-- Start logo -->
							<!-- <h3>logo</h3> -->
							<a href="{base_url()}_lod/mload/"><img src="{getimage(8,'thumb')}" alt="Logo"></a>
						</div><!-- End logo -->
						<div class="nav_bar"><!-- Start nav_bar -->
							<nav id="primary_nav_wrap"><!-- Start primary_nav_wrap -->
								<ul>
								  <li class="current-menu-item"><a href="{base_url()}_lod/mload/">Home</a></li>
								  <li><a href="{base_url()}_lod/mload/berita">Berita</a></li>
								  <li><a href="{base_url()}_lod/pengumuman/">Pengumuman</a></li>
								  <li><a href="#">Profil</a>
								    <ul>
								      <li><a href="{base_url()}_lod/content/visimisi">Visi Misi</a></li>
								      <li><a href="{base_url()}_lod/content/tentang_kami">Tentang Kami</a></li>
								      
								    </ul>
								  </li>
								  <li><a href="#">Informasi Umum</a>
								    <ul>
								      <li><a href="{base_url()}_lod/content/prestasi">Prestasi</a></li>
								      <li><a href="{base_url()}_lod/mload/fasilitas">Fasilitas</a></li>
								      <li><a href="{base_url()}_lod/content/ekstrakulikuler">Ekstrakulikuler</a></li>
								    </ul>
								  </li>
								  <li><a href="{base_url()}_lod/tugas/">Tugas</a></li>
								  <li><a href="{base_url()}_lod/mload/daftar">Daftar</a></li> 
								</ul>
							</nav><!-- End primary_nav_wrap -->
						</div><!-- End nav_bar -->
						
						<div class="hz_responsive"><!--button for responsive menu-->
							<div id="dl-menu" class="dl-menuwrapper">
								<button class="dl-trigger">Open Menu</button>
							<ul class="dl-menu">
							  <li class="current-menu-item"><a href="{base_url()}_lod/mload/">Home</a></li>
							  <li><a href="{base_url()}_lod/mload/berita">Berita</a></li>
							  <li><a href="{base_url()}_lod/pengumuman/">Pengumuman</a></li>
							  <li class="current-menu-item"><a href="#">Profil</a>
							    <ul class="dl-submenu">
							      <li><a href="{base_url()}_lod/content/visimisi">Visi Misi</a></li>
								  <li><a href="{base_url()}_lod/content/tentang_kami">Tenyang Kami</a></li>
							      <li><a href="archive.html">Lokasi</a></li>
							    </ul>
							  </li>
							  <li><a href="{base_url()}_lod/mload/berita">Informasi Umum</a>
							    <ul class="dl-submenu">
							      <li><a href="{base_url()}_lod/content/prestasi">Prestasi</a></li>
							      <li><a href="{base_url()}_lod/mload/fasilitas">Fasilitas</a></li>
							      <li><a href="{base_url()}_lod/content/ekstrakulikuler">Ekstrakulikuler</a></li>
							    </ul>
							  </li>
							  <li><a href="{base_url()}_lod/tugas/">Tugas</a></li>
							  <li><a href="{base_url()}_lod/mload/daftar">Daftar</a></li>
							</ul>
							</div><!-- /dl-menuwrapper -->
						</div><!--End button for responsive menu-->
						
					</div>
				</div><!-- End main_header -->
			</div><!-- End header -->

			<div class="main_content container"><!-- main_content -->
				{block name=content}
				<div class="mian_slider clearfix"> <!--Start Mian slider -->
					<div class="big_silder col-md-12"><!-- Start big silder -->
						<div class="row">
							<ul id="big-slid-post" class="a-post-box">
								{foreach from=$slider item=$sli}
								<li>
									<div class="feat-item img-section" data-bg-img="{image_slider($sli->id_setting,'thumb')}">
									<div class="latest-overlay"></div>
										<div class="latest-txt">
											<h3 class="latest-title"><a href="{base_url()}_lod/mload/">{get_metsos('logo')}</a></h3>
											<div class="big-latest-content">
												<p>{$sli->content}</p>
											</div>
										</div>
									</div>
								</li>
								{/foreach}
							</ul>
						</div>
					</div><!-- End big silder -->
				</div><!--End Mian slider -->
				
				<div class="breaking_news"><!-- breaking_news -->
			    	<a href="{base_url()}_lod/mload/daftar"><div class="bn_title"><h2>Daftar disini</h2><span></span></div></a>
			        <ul class="breaking_news_slider" style="padding-left:10px;"><!-- breaking_news_slider -->
			        	<li><span>SD</span> - Muhammadiyah 16 Surakarta</li>
			            <li><span>SD</span> - Muhammadiyah 16 Surakarta, SD Agamis</li>
			            <li>sekolah dasar unggul dan berorientasi pada masa depan.</li>
			            <li>Mencetak lulusan yang unggul</li>
			            <li><span>berwawasan global</span></li>
			            <li>berakhlaqul karimah dan bertaqwa kepada Allah SWT.</li>
			        </ul><!-- // breaking_news_slider -->
				</div><!-- //breaking_news -->

				<div class="featured_slider"> <!--Start featured_slider -->
					<div class="featured_title"><!-- featured_title -->
						<h4>Fasilitas</h4>
						<a href="{base_url()}_lod/mload/fasilitas" class="view_button">View All</a>
					</div><!-- // featured_title -->

					<div class="featured_posts_slider"><!-- featured_posts_slider -->
						<div id="featured_post"><!-- featured_post -->
							{foreach from=$fasilitas item=$fas}
							<div class="item"><!-- item -->
							  	<div class="img_post">
							  		<a href="{base_url()}_lod/mload/viewfasilitas/{$fas->id_content}"><img src="{image($fas->id_content,'thumb')}" alt="Owl Image"></a>
							  	</div>
							  	<div class="featured_title_post">
				                	<div class="caption_inner">
				                  		<a href="{base_url()}_lod/mload/viewfasilitas/{$fas->id_content}"><h4 class="title_post">{$fas->judul}</h4></a>
				                  		<div class="post_date"><em><a href="#">{tgl_indo($fas->tgl_terbit)}</a></em></div>
				                  		
				                	</div>
				            	</div>
							</div><!-- // item -->
							{/foreach}
						</div><!-- // featured_post -->
					</div><!-- // featured_posts_slider -->
				</div><!--End featured_slider -->

				<div class="posts_sidebar clearfix"><!--Start Posts Areaa -->
					<div class="posts_areaa col-md-8"><!-- posts_areaa -->
						<div class="row">
							<!-- block_posts block_5 -->
							<div class="block_posts block_5">
								<!-- featured_title -->
								<div class="featured_title">
									<h4>Ekstrakulikuler</h4>
									<a href="{base_url()}_lod/content/ekstrakulikuler" class="view_button">View All</a>
								</div>
								<!-- // featured_title -->

								<!-- block_inner -->
								<div class="block_inner">
									{foreach from=$ekstrakulikuler item=$eks}
									<article class="a-post-box">
										<figure class="latest-img"><img src="{image($eks->id_content,'thumb')}" alt="If you are going to use a passage of Lorem Ipsum" class="latest-cover"></figure>
										<div class="latest-overlay"></div>
										<div class="latest-txt">
											
											<h5 class="latest-title"><a href="{base_url()}_lod/content/viewekstrakulikuler/{$eks->id_content}">{$eks->judul}</a></h5>
										</div>
							    	</article>
							    	{/foreach}
								</div>
								<!-- // block_inner -->
							</div>
							<!-- // block_posts block_5 -->

							<!-- block_posts block_3 -->
							<div class="block_posts block_3">
								<!-- featured_title -->
								<div class="featured_title">
									<h4>Prestasi</h4>
									<a href="{base_url()}_lod/content/prestasi" class="view_button">View All</a>
								</div>
								<!-- // featured_title -->

								<!-- block_inner -->
								<div class="block_inner">
									<!-- featured_cat_slider -->
									<div class="featured_cat_slider">
										<div id="featured_cat_post">
											{foreach from=$prestasi item=$pre}
											<div class="item">
											  	<div class="img_post">
											  		<a href="{base_url()}_lod/content/prestasi"><img src="{image($pre->id_content,'thumb')}" alt="Owl Image"></a>
											  	</div>
											  	<div class="featured_title_post">
								                	<div class="caption_inner">
								                  		<a href="{base_url()}_lod/content/viewprestasi"><h4 class="title_post">{$pre->judul}</h4></a>
								                  		<div class="post_date"><em><a href="#">{tgl_indo($pre->tgl_terbit)}</a></em></div>
								                  		<span class="latest-cat"><a href="">prestasi</a></span>
								                	</div>
								            	</div>
											</div>
											{/foreach}
										</div>
									</div>
									<!-- // featured_cat_slider -->
								</div>
								<!-- // block_inner -->
							</div>
							<!-- // block_posts block_3 -->

							<!-- block_posts block_6 -->
							<div class="block_posts block_6">
								<!-- featured_title -->
								<div class="featured_title">
									<h4>Berita Terbaru</h4>
									<a href="{base_url()}_lod/mload/berita" class="view_button">View All</a>
								</div>
								<!-- // featured_title -->

								<!-- block_inner -->
								<div class="block_inner">
									{foreach from=$berita item=$row}
									<article class="block_hz_post">
										<div class="standard_post">
											<div class="list_thum">
												<div class="hz_thumb_post">
													<div class="cat_list_post">
														
													</div>
													<img src="{image($row->id_content,'thumb')}" class="img-responsive" alt="Responsive image">
												</div>	

											</div>	
											<div class="list_content">
												<div class="block_hz_top_post">
													<div class="block_hz_title_and_meta">
														<h4 class="hz_title"><a href="{base_url()}_lod/mload/viewberita/{$row->id_content}">{$row->judul}</a></h4>
														<div class="hz_meta_post">
															<span class="hz_date_post"><i class="fa fa-calendar"></i><a href="#">{tgl_indo($row->tgl_terbit)}</a></span>
															<span class="hz_date_post"><i class="fa fa-comments"></i><a href="#">Comments</a></span>
														</div>
													</div>
												</div>

												<div class="block_hz_main_post_content">
													<div class="hz_content">
														<p>{truncate($row->isi,140)}</p>
													</div>

													<div class="hz_bottom_post">

														<div class="hz_read_more">
															<a href="{base_url()}_lod/mload/viewberita/{$row->id_content}">Read More</a>
														</div>

														<div class="hz_icon_shere">

										                    <span class="share_toggle pi-btn">
										                        <i class="fa fa-share-alt"></i>
										                    </span>

										                    <div class="hz_share">
																<span><a href="#"><i class="fa fa-facebook"></i></a></span>
																<span><a href="#"><i class="fa fa-twitter"></i></a></span>
																<span><a href="#"><i class="fa fa-google-plus"></i></a></span>
																<span><a href="#"><i class="fa fa-stumbleupon"></i></a></span>
															</div>

														</div>

													</div>
												</div>
											</div>
										</div>
									</article>
									{/foreach}
								</div>
								<!-- // block_inner -->
							</div>
							<!-- // block_posts block_6 -->
						</div>
					</div><!--End Posts Areaa -->
					
					<div class="sidebar col-md-4"><!--Start Sidebar -->
						<div class="row">
							<div class="inner_sidebar"><!--Start Inner Sidebar -->

								<div class="widget widget_advertisement"><!-- Start widget Advertisement -->
									<h4 class="widget_title">Kepala Sekolah</h4>
									<div class="ads_wid">
									<a href="#"><img src="{getimage(9,'thumb')}" alt="Advertisement"></a>
									</div>
								</div><!-- End Widget Advertisement -->

								
									
								<div class="widget widget_recent_post"><!-- Start widget recent post -->
									<h4 class="widget_title">Recent Post</h4>
									<ul class="recent_post">
										{foreach from=$terkait item=$trk}
										<li>
											<figure class="widget_post_thumbnail">
												<a href="#"><img src="{image($trk->id_content,'thumb')}" alt="Appropriately simplify quality imperatives"></a>
											</figure>
											<div class="widget_post_info">
												<h5><a href="#">{$trk->judul}</a></h5>
												<div class="post_meta">
													<span><a href="#"><i class="fa fa-comments-o"></i> 0 comments</a></span>
													<span class="date_meta"><a href="#"><i class="fa fa-calendar"></i> {tgl_indo($trk->tgl_terbit)}</a></span>
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

							</div><!--End Inner Sidebar -->
						</div>
					</div><!--End Sidebar -->
				</div><!-- Posts And Sidebar -->
				{/block}
			</div><!-- main_content -->

			<div id="footer" class="footer container-fulid"><!-- footer -->
				<footer class="main_footer"><!-- main_footer -->
						<div class="container">
							<div class="row">
								<div class="col-sm-4"><!-- Start widget_text -->
									<div id="text-3" class="widget widget_text">
										<h4 class="widget_title">Alamat kami</h4>
										<div class="textwidget">
											{get_metsos('alamat')}
										</div>
									</div>	
								</div><!-- End widget_text -->
								
								<div class="col-sm-4"><!-- Start widget tag cloud -->
									<div class="widget  widget_tag_cloud">
										<h4 class="widget_title">Tags</h4>
										<div class="tagcloud">
											<a href="{base_url()}_lod/mload/berita">berita</a>
											<a href="{base_url()}_lod/mload/fasilitas">fasilitas</a>
											<a href="{base_url()}_lod/content/ekstrakulikuler">ektrakulikuler</a>
											<a href="{base_url()}_lod/content/prestasi">prestasi</a>
										</div>
									</div>
								</div><!-- End widget tag cloud -->

								<div class="col-sm-4"><!-- Start widget flickr -->
									<div class="widget hamzh_flickr">
										<h4 class="widget_title">SD MUHAMMADIYAH 16 SURAKARTA</h4>

										<div class="logo_widget">
											<a href="{base_url()}_lod/mload/"><img src="{getimage(8,'thumb')}" class="img-responsive" alt="Logo"></a>
										</div>


									</div>
								</div><!-- Start widget flickr -->
								

							</div>
						</div>
				</footer><!-- // main_footer -->

				<div class="copyright"><!-- copyright -->
					<div class="hmztop">Scroll To Top</div><!-- hmztop -->
					<div class="container">
						<div class="social_icon"><!-- social_icon -->
							<span><a href="{get_metsos('facebook')}"><i class="fa fa-facebook"></i></a></span>
							<span><a href="{get_metsos('instagram')}"><i class="fa fa-instagram"></i></a></span>
							<span><a href="{get_metsos('youtube')}"><i class="fa fa-youtube"></i></a></span>
							<span><a href="{get_metsos('nisn')}" title="NISN"><img src="{base_url()}/assets/user/img/nisn.png" width="" height="20"></a></span>
						</div><!-- // social_icon -->
						<p>Copyrights © 2018 All Rights Reserved by <a href="#"></a></p>
					</div>
				</div><!-- // copyright -->
			</div><!-- // footer -->

		</div><!-- End row -->
	</div><!-- End all_content -->

<!-- End Document
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->

<!-- Javascript
–––––––––––––––––––––––––––––––––––––––––––––––––– -->
	<script type="text/javascript" src="{base_url()}assets/user/js/modernizr.min.js"></script>
	<script type="text/javascript" src="{base_url()}assets/user/js/owl.carousel.js"></script>
	<script type="text/javascript" src="{base_url()}assets/user/js/isotope.js"></script>
	<script type="text/javascript" src="{base_url()}assets/user/js/jquery.jribbble-1.0.1.ugly.js"></script>
	<script type="text/javascript" src="{base_url()}assets/user/js/jquery.bxslider.min.js"></script>
	<script type="text/javascript" src="{base_url()}assets/user/js/hamzh.js"></script>
	{block name=footer}{/block}
</body>
</html>
