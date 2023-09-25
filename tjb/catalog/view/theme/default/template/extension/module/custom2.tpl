<div class="bespoke-container">
	<div class="top">
		<div class="texts" data-aos="flip-right"><h3><?php echo $title1; ?></h3><?php echo html_entity_decode($text1); ?></div>
		<div class="image" data-aos="fade-up"><img src="image/<?php echo $image1; ?>" alt="<?php echo $title1; ?>"></div>
	</div>
</div>

<div class="steps-container">
	<h2><?php echo $stitle; ?></h2>

	<div class="step-inner">
		<div class="center-image">
			<img src="image/<?php echo $cimage; ?>" class="enter-image" alt="image" data-aos="flip-right">
		</div>

		<?php foreach ($steps as $i => $step): ?>
			<div class="step-<?= $i + 1; ?> steps">
				<img src="image/<?php echo $step['pimage']; ?>" alt="image" data-aos="flip-right">
				<div class="texts">
					<div class="underlay" data-aos="zoom-in" data-aos-delay="400">0<?php echo $i + 1; ?></div>
					<h4 data-aos="fade-left"><?php echo $step['ptitle']; ?></h4>

					<div class="p" data-aos="fade-left">
						<p><?php echo html_entity_decode($step['pdesc']); ?></p>
					</div>
				</div>
			</div>
		<?php endforeach ?>
	</div>
</div>

<div class="btm-texts" data-id="<?php echo $bg['bespokebtm']; ?>">
	<div class="inner">
		<?php foreach ($texts as $is => $text): ?>
			<div>
				<h4><?php echo $text['title2']; ?></h4>
				<p><?php echo html_entity_decode($text['desc2']); ?></p>
			</div>
		<?php endforeach ?>
	</div>
</div>

<script type="text/javascript">
	let bg = $(".btm-texts").data("id");
	$(".btm-texts").css("background", bg);
	let html = $(".bespoke-container").html();
	$(".bespoke-container").hide();
	$(".bespoke-container-2").append(html);
</script>

<script type="text/javascript">
	$(".nav .prev").click(function(){
		$(".standard_nav_left").click();
	})
	$(".nav .next").click(function(){
		$(".standard_nav_right").click();
	})
</script>