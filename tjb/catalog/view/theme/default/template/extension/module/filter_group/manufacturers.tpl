<?php if($manufacturers){ ?>

<div id="side-manufacturer">
	<div class="list-group-item item-header" data-aos="fade-down"><?= $heading_title; ?></div>
	<div class="list-group-item inner" data-aos="fade-up">
		<?php foreach($manufacturers as $manufacturer){ ?>
		<label>
			<?php if($manufacturer['checked']){ ?>
			<input type="checkbox" name="manufacturer_ids[]" value="<?= $manufacturer['mid']; ?>" checked />
			<?php }else{ ?>
			<input type="checkbox" name="manufacturer_ids[]" value="<?= $manufacturer['mid']; ?>" />
			<?php } ?>
			<?= $manufacturer['name']; ?>
		</label>
		<?php } ?>
	</div>
</div>

<?php } ?>