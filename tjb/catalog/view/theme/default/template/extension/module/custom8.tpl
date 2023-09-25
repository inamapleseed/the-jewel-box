<div class="memberships-con">
	<h2><?php echo $title; ?></h2>
	<div class="memberships">
		<?php if ($repeater): ?>
			<?php foreach ($repeater as $i => $memberships): ?>
				<div class="membership-inner">
					<img src="image/<?php echo $memberships['image']; ?>" alt="<?php echo $memberships['mtitle']; ?>" title="<?php echo $memberships['mtitle']; ?>">
				</div>
			<?php endforeach ?>
		<?php endif ?>
	</div>
</div>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
  function initSlick() {
    $('.memberships').slick({
      dots: true,
      infinite: true,
      centerMode: true,
      speed: 500,
      arrows: true,
      pauseOnHover: false,
      autoplay: false,
      slidesToShow: 3,
      responsive: [
      {
        breakpoint: 1100,
        settings: {
          centerMode: false
        }
       },
  		{
        breakpoint: 991,
        settings: {
	      arrows: false,
	      autoplay: true,
          slidesToShow: 2,
          centerMode: false
        }
       },
      {
        breakpoint: 767,
        settings: {
        arrows: false,
        autoplay: true,
          slidesToShow: 1,
          centerMode: false
        }
       },
        {
        breakpoint: 375,
        settings: {
	      arrows: false,
	      autoplay: true,
          slidesToShow: 1,
          centerMode: false
        }
      },
      ],
		prevArrow: "<div class='pointer slick-nav left prev absolute'><div class='absolute position-center-center'><i class='fa fa-chevron-left'></i></div></div>",
		nextArrow: "<div class='pointer slick-nav right next absolute'><div class='absolute position-center-center'><i class='fa fa-chevron-right'></i></div></div>",

    });
  }
  initSlick();
</script>
