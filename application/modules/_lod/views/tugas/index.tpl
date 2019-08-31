{extends file="index.tpl"}
{block name=content}
	<div class="posts_sidebar clearfix"><!-- Start posts_sidebar -->

		<!--Start Posts Areaa -->
		<div class="posts_areaa col-md-8">
			<div class="row">
				{foreach from=$tugas item=$row}
				<article class="hz_post"><!-- Start hz_post -->
					<div class="quote_post"><!-- Start quote_post -->
						<div class="overflo img-section" data-bg-img="{base_url()}assets/user/img/5.jpg">
							<div class="hz_thumb_post">
								<div class="icon_post_format">
									<i class="fa fa-quote-left"></i>
								</div>
								<div class="quote_title"><br/>
									<!--<a href="{base_url()}_lod/tugas/view/{$row->id_tugas}"><h3>When you are courting a nice girl an hour seems like a second. When you sit on a red-hot cinder a second seems like an hour. That's relativity.</h3>
									<span>albert einstein</span>
									</a>-->
								</div>
							</div>	
						</div>
						<div class="hz_top_post">
							<div class="hz_title_and_meta">
								<a href="{base_url()}_lod/tugas/view/{$row->id_tugas}">
									<h3 class="hz_title">{$row->judul}</h3>
								</a>
								<div class="hz_meta_post">
									<span class="hz_post_by"><i class="fa fa-user"></i><a href="#">Admin</a></span>
									<span class="hz_date_post"><i class="fa fa-calendar"></i><a href="#">{tgl_indo($row->tanggal_upload)}</a></span>
									<span class="hz_date_post"><i class="fa fa-comments"></i><a href="#">Comments</a></span>
								</div>
							</div>
						</div>

						<div class="hz_main_post_content">
							<div class="hz_content">
								<p>{truncate($row->isi)}...</p>
							</div>

							<div class="hz_bottom_post">

								<div class="hz_read_more">
									<a href="{base_url()}_lod/tugas/view/{$row->id_tugas}">Read More</a>
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
					</div><!-- End quote_post -->
				</article><!-- End hz_post -->

				{/foreach}
				<nav aria-label="Page navigation">
				  
				    {$pagination}
				  
				</nav>

			</div>	
		</div>
		<!--End Posts Areaa -->

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
						
				</div><!-- End inner_sidebar -->
			</div>
		</div><!--End Sidebar -->
	</div><!-- posts_sidebar -->

{/block}