<!-- <?php if ($reviews): ?>
	<div class="testimonial-con">
		<h2 data-aos="fade-up" data-aos-delay="300">Testimonials</h2>

		<div class="testimonial-slick">
			<?php foreach ($reviews as $rev): ?>
				<div class="inner">
					<div class="text-con">
						<?php if ($rev['title']): ?>
							<h3 class="title">"<?php echo $rev['title']; ?>"</h3>
						<?php endif ?>

						<div class="p">
							<p><?php echo $rev['text']; ?></p>
						</div>
						<h4 class="name"><?php echo $rev['author']; ?></h4>
						<div class="bg"></div>
					</div>
				</div>
			<?php endforeach ?>
		</div>

		<div class="der-btn">
			<a href="" class="btn btn-primary">Leave a Review</a>
		</div>
	</div>

	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script type="text/javascript">
	  function initSlick3s() {
	    $('.testimonial-slick').slick({
		      dots: true,
		      infinite: false,
		      speed: 500,
		      arrows: false,
		      pauseOnHover: false,
		      autoplay: false,
		      adaptiveHeight: true,
		      slidesToShow: 3,
		      responsive: [
		      {
		        breakpoint: 991,
		        settings: {
			      arrows: false,
			      autoplay: true,
		          slidesToShow: 2
		        }
		       },
		        {
		        breakpoint: 767,
		        settings: {
			      arrows: false,
			      autoplay: true,
		          slidesToShow: 1
		        }
		      },
		      ],
				prevArrow: "<div class='pointer slick-nav left prev absolute'><div class='absolute position-center-center'><i class='fa fa-chevron-left'></i></div></div>",
				nextArrow: "<div class='pointer slick-nav right next absolute'><div class='absolute position-center-center'><i class='fa fa-chevron-right'></i></div></div>",

		    });
		  }
	  initSlick3s();
	</script>

<?php endif ?> -->