<div class="category-con">
	<?php foreach ($categories as $i => $cats): ?>
		<div class="inner" data-aos="fade-up">
			<div class="image">
				<img src="image/<?php echo $cats['image']; ?>">
				<div class="overlay">
					<a href="index.php?route=product/category&path=<?php echo $cats['category_id']; ?>" class="btn btn-primary">View More</a>
				</div>
			</div>
			<h4>
				<?php echo $cats['name']; ?>
			</h4>
		</div>
	<?php endforeach ?>
</div>