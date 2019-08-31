{extends file="index.tpl"}
{block name=content}
	<div class="main_content author_list container"><!-- Start posts sidebar -->
		<div class="main_page col-md-8"><!-- main_page -->
			<div class="post_header"><!-- post_header -->
				<h1>Tentang Kami</h1>
				<span class="title_divider"></span>
			</div><!-- // post_header -->

			<div class="main_author"><!-- main_author -->
				<div class="authorInfo"><!-- authorInfo -->
					
					<p class="authordescrption">{$tentang->value}</p>
				</div><!-- // authorInfo -->
			</div><!-- // main_author --><br/>
		</div><!-- // main_page -->


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
									<a href="{base_url()}_lod/mload/viewberita/{$row->id_content}"><img src="{image($row->id_content,'thumb')}" height="80" width="80" alt="Appropriately simplify quality imperatives"></a>
								</figure>
								<div class="widget_post_info">
									<h5><a href="{base_url()}_lod/mload/viewberita/{$row->id_content}">{$row->judul}</a></h5>
									<div class="post_meta">
										<span class="date_meta"><a href="#"><i class="fa fa-calendar"></i> {tgl_indo($row->tgl_terbit)}</a></span>
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
{/block}S