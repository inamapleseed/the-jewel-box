<div class="homepage-ui">
	<div class="homepage-ui-inner">
		<?php if ($repeater): ?>
			<?php foreach ($repeater as $i => $rep): ?>
				<div class="inner <?php echo $i % 2 ? 'odd' : 'even'; ?>">
					<div class="images" data-aos="flip-left">
						<img src="image/<?=$rep['cimage'];?>" alt="image">
					</div>
					<div class="text" data-aos="fade-right">
						<div class="inner-texts">
							<?php if ($rep['ctitle']): ?>
								<h3><?php echo $rep['ctitle']; ?></h3>
							<?php endif ?>

							<div class="p">
								<?= html_entity_decode($rep['ctext']);?>
							</div>

							<div class="a">
								<a href="<?php echo $rep['url'] ?>" class="btn btn-primary"><?php echo $rep['btnname']; ?></a>
							</div>
						</div>
					</div>
				</div>
			<?php endforeach ?>
		<?php endif ?>
	</div>
</div>