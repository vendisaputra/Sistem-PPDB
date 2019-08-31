{extends file="index.tpl"}
{block name=content}
	<div class="posts_sidebar layout_right_sidebar clearfix"><!-- Start posts sidebar -->
		<div class="inner_single col-md-8"> <!-- Start inner single -->
			<div class="row">	
						
				<article class="hz_post"><!-- Start article -->
					<div class="video_post post_wrapper">

						<div class="hz_thumb_post">
							<div class="embed-responsive embed-responsive-16by9">
								<img src="{base_url()}assets/user/img/5.jpg" alt="If you are going to use a passage of Lorem Ipsum" class="latest-cover">
							</div>
						</div>	

						<div class="hz_top_post">

							<div class="hz_title_and_meta">
								<div class="hz_title"><h3><a href="#">{$content->judul}</a></h3></div>
								<div class="hz_meta_post">
									<span class="hz_post_by"><i class="fa fa-user"></i><a href="#">Admin</a></span>
									<span class="hz_cat_post"><i class="fa fa-folder-open"></i><a href="#">Design</a></span>
									<span class="hz_date_post"><i class="fa fa-calendar"></i><a href="#">{tgl_indo($content->tanggal_terbit)}</a></span>
									<span class="hz_date_post"><i class="fa fa-comments"></i><a href="#">Comments</a></span>
								</div>
							</div>
						</div>

						<div class="hz_main_post_content">
							<div class="hz_content" align="justify">
								<p>
									{$content->isi}
								</p>
							</div>

							<div class="hz_bottom_post">
								<div class="hz_tags">
									<span><a href="#">Design</a></span>
									<span><a href="#">photoshop</a></span>
									<span><a href="#">HTML</a></span>
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
					
					<div class="conmments_block"><!--Start Conmments Block -->
						<div class="post_title"><h4>Comments</h4></div>
						<div id="disqus_thread"></div>
						<ol class="commentlist clearfix">
						    
						</ol>
					</div><!--End Conmments Block -->
						

						
					
				</article><!-- End article -->
						
			</div>	
		</div><!--End Posts Areaa -->

		<div class="sidebar col-md-4"><!--Start Sidebar -->
			<div class="row"><!-- Start Row -->
				<div class="inner_sidebar"><!-- Start inner sidebar -->

					<div class="widget widget_advertisement"><!-- Start widget Advertisement -->
						<h4 class="widget_title">Kepala Sekolah</h4>
						<div class="ads_wid">
							<a href="#"><img src="{getimage(9,'thumb')}" alt="Advertisement"></a>
						</div>
					</div><!-- End Widget Advertisement -->	

					<div class="widget widget_recent_post"><!-- Start widget recent post -->
						<h4 class="widget_title">Recent Post</h4>
						<ul class="recent_post">
							{foreach from=$terkait item=$row}
							<li>
								<figure class="widget_post_thumbnail">
									<a href="#"><img src="{image($row->id_content,'thumb')}" height="80" width="80" alt="Appropriately simplify quality imperatives"></a>
								</figure>
								<div class="widget_post_info">
									<h5><a href="#">{$row->judul}</a></h5>
									<div class="post_meta">
										<span><a href="#"><i class="fa fa-comments-o"></i> 0 comments</a></span>
										<span class="date_meta"><a href="#"><i class="fa fa-calendar"></i> {$row->tgl_terbit}</a></span>
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

				</div><!-- End inner sidebar -->
			</div><!-- End Row -->
		</div><!--End Sidebar -->
	</div><!-- End posts sidebar -->
{/block}
{block name=footer}
	<script>

	/**
	*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
	*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
	/*
	var disqus_config = function () {
	this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
	this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
	};
	*/
	(function() { // DON'T EDIT BELOW THIS LINE
	var d = document, s = d.createElement('script');
	s.src = 'https://sd16muhammadiyah.disqus.com/embed.js';
	s.setAttribute('data-timestamp', +new Date());
	(d.head || d.body).appendChild(s);
	})();
	</script>
	<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
{/block}

