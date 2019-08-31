{extends file="index.tpl"}
{block name=content}
	<!-- posts_sidebar -->
	<div class="posts_sidebar layout_right_sidebar clearfix">

		<!--Start Posts Areaa main_grid_layout -->
		<div class="posts_areaa col-md-8 main_grid_layout clearfix">
			<div class="row">
				<!-- grid_layout -->
				<div class="grid_layout">
					<!-- hz_post grid_post -->
					{foreach from=$content item=$row}
					<article class="hz_post grid_post clearfix">
						<div class="standard_post">
							<div class="hz_thumb_post">
								<a href="{base_url()}_lod/search/viewe/{$row->id_content}">

									<div class="icon_post_format">
										<i class="fa fa-image"></i>
									</div>

									<img src="{image($row->id_content,'thumb')}" class="img-responsive" alt="Responsive image">
								</a>
							</div>	

							<div class="hz_top_post">

								<div class="hz_title_and_meta">
									<a href="{base_url()}_lod/search/viewe/{$row->id_content}">
										<h4 class="hz_title">{$row->judul}</h4>
									</a>
									<div class="hz_meta_post">
										<span class="hz_cat_post"><i class="fa fa-folder-open"></i><a href="#">Image</a></span>
										<span class="hz_date_post"><i class="fa fa-calendar"></i><a href="#">{tgl_indo($row->tgl_terbit)}</a></span>
										<span class="hz_date_post"><i class="fa fa-comments"></i><a href="#">Comments</a></span>
									</div>
								</div>
							</div>

							<div class="hz_main_post_content">
								<div class="hz_content">
									<p align="justify">{truncate($row->isi,160,'...')}</p>
								</div>

								<div class="hz_bottom_post">

									<div class="hz_read_more">
										<a href="{base_url()}_lod/search/view/{$row->id_content}">Read More</a>
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
					</article>
					{/foreach}
					<!-- // hz_post grid_post -->
					
				</div>
				<!-- grid_layout -->
				<nav aria-label="Page navigation">
				    {$pagination}
				</nav>
			</div>
		</div>
		<!--End Posts Areaa main_grid_layout -->

		<div class="sidebar col-md-4"><!--Start Sidebar -->
			<div class="row">
				<div class="inner_sidebar"><!-- Start inner_sidebar -->

					<div class="widget widget_advertisement"><!-- Start widget Advertisement -->
						<h4 class="widget_title">Kepala Sekolah</h4>
						<div class="ads_wid">
							<a href="#"><img src="{getimage(9,'thumb')}" alt="Advertisement"></a>
						</div>
					</div><!-- End Widget Advertisement -->	

					<div class="widget widget_recent_post"><!-- Start widget recent post -->
						<h4 class="widget_title">Terkait</h4>
						<ul class="recent_post">
							{foreach from=$fasilitas item=$ter}
							<li>
								<figure class="widget_post_thumbnail">
									<a href="{base_url()}_lod/mload/viewfasilitas/{$row->id_content}"><img src="{image($ter->id_content,'thumb')}" height="80" width="80" alt="Appropriately simplify quality imperatives"></a>
								</figure>
								<div class="widget_post_info">
									<h5><a href="#">{$ter->judul}</a></h5>
									<div class="post_meta">
										<span><a href="#"><i class="fa fa-comments-o"></i> 0 comments</a></span>
										<span class="date_meta"><a href="{base_url()}_lod/mload/viewfasilitas/{$row->id_content}"><i class="fa fa-calendar"></i> {tgl_indo($ter->tgl_terbit)}</a></span>
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
						
				</div><!-- End inner_sidebar -->
			</div>
		</div><!--End Sidebar -->
	</div>
	<!-- // posts_sidebar -->
{/block}