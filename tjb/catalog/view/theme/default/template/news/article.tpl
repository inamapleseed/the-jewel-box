<div class="" data-aos="fade-up">
	<div class="pd-md-60">
		<?php if ($thumb) { ?>
		<div class="pd-b30 text-center">	
			<img class="w100" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
		</div>
		<?php } ?>

		<div class="title"><h3 class="bold"><?php echo $news_title; ?></h3></div>

		<div class="share flex flex-vcenter">
			<div class="pd-r15">SHARE</div>
			<div><?= $share_html ?></div>
		</div>

		<div class="date pd-b15"><?php echo $date_added; ?></div>

		<div class="description pd-b15"><?php echo $description; ?></div>

		<div class="navigation">
			<a <?= $prev_news ? 'href=" ' . $prev_news . ' "' : 'disabled style="pointer-event: none; opacity: 0"'; ?> class="no-any">Prev</a>
			<a <?= $next_news ? 'href=" ' . $next_news . ' "' : 'disabled style="pointer-event: none; opacity: 0"'; ?> class="no-any">Next</a>
		</div>

	</div>
	<?php if ($related_products_slider) { ?>
	<?= $related_products_slider ?>
	<?php } ?>
</div>