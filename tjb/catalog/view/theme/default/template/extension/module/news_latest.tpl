<div class="hidden title-nav">
	<h2 class="der-title" data-aos="fade-right"></h2>

	<div class="nav ">
	  <a class="prev no-any hidden">Prev</a>
	  <a class="next no-any hidden">Next</a>
	</div>
</div>

<h3><?php echo $title; ?></h3>
<div class="">
	<?php if (!$article && isset($text_search_no_results)) { ?>
		<h4><?php echo $text_search_no_results; ?></h4>
	<?php } ?>

	<div id="news_latest" class="bnews-list nl" data-aos="fade-up">
		<?php foreach ($article as $articles) { ?>
			<div class="artblock artb">
				<div class="img_container">
					<img class="article-image" alt="image" src="<?= $articles['thumb'] ?>"/>
					<div class="bg">
						<img class="bg-article-image" alt="image" src="<?= $articles['thumb'] ?>"/>
					</div>
				</div>

				<div class="info not-home" data-id="<?php echo $bg['latestnews']; ?>">
					<?php if ($articles['name']) { ?>
						<div class="name" data-aos="fade-left"><a href="<?php echo $articles['href']; ?>"><?php echo $articles['name']; ?></a></div>
					<?php } ?>
					<?php if ($articles['description']) { ?>
						<div class="description hidden"><?php echo $articles['description']; ?></div>
					<?php } ?>
					<?php if ($articles['date_added']) { ?>
						<div class="date"><?php echo $articles['date_added']; ?></div>
					<?php } ?>
					<?php if ($articles['button']) { ?>
						<div class="blog-button hidden"><a class="button no-any" href="<?php echo $articles['href']; ?>">Read now</a></div>
					<?php } ?>
				</div>


				<?php if ($articles['name']) { ?>
					<div class="name in-home hidden" data-aos="fade-left"><a href="<?php echo $articles['href']; ?>"><?php echo $articles['name']; ?></a></div>
				<?php } ?>
		
				<?php if ($articles['button']) { ?>
					<div class="blog-button hidden in-home"><a class="button no-any" href="<?php echo $articles['href']; ?>">Read now</a></div>
				<?php } ?>

				<div class="hidden">
					<div class="article-meta">
						<?php if ($articles['category']) { ?>
							<?php echo $text_posted_in; ?> <?php echo $articles['category']; ?> |
						<?php } ?>
					</div>
					<?php if ($articles['thumb']) { ?>
						<a href="<?php echo $articles['href']; ?>"><img class="article-image" align="left" src="<?php echo $articles['thumb']; ?>" title="<?php echo $articles['name']; ?>" alt="<?php echo $articles['name']; ?>" /></a>
					<?php } ?>
					<?php if ($articles['custom1']) { ?>
						<div class="custom1"><?php echo $articles['custom1']; ?></div>
					<?php } ?>
					<?php if ($articles['custom2']) { ?>
						<div class="custom2"><?php echo $articles['custom2']; ?></div>
					<?php } ?>
					<?php if ($articles['custom3']) { ?>
						<div class="custom3"><?php echo $articles['custom3']; ?></div>
					<?php } ?>
					<?php if ($articles['custom4']) { ?>
						<div class="custom4"><?php echo $articles['custom4']; ?></div>
					<?php } ?>
					
		
					<?php if ($articles['button']) { ?>
						<div class="blog-button"><a class="button" href="<?php echo $articles['href']; ?>">Read now</a></div>
					<?php } ?>
				</div>
			</div>

		<?php } ?>
	</div>
	<div class="hidden home-btn">
		<a href="index.php?route=news/ncategory" class="btn btn-primary">View All</a>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('img.article-image').each(function(index, element) {
		var articleWidth = $(this).parent().parent().width() * 0.7;
		var imageWidth = $(this).width() + 10;
		if (imageWidth >= articleWidth) {
			$(this).attr("align","center");
			$(this).parent().addClass('bigimagein');
		}
		});
	});
</script>

<?php if ($disqus_status) { ?>
	<script type="text/javascript">
		var disqus_shortname = '<?php echo $disqus_sname; ?>';
		(function () {
		var s = document.createElement('script'); s.async = true;
		s.type = 'text/javascript';
		s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
		(document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
		}());
	</script>
<?php } ?>

<?php if ($fbcom_status) { ?>
	<script type="text/javascript">
	      window.fbAsyncInit = function() {
	        FB.init({
	          appId      : '<?php echo $fbcom_appid; ?>',
			  status     : true,
	          xfbml      : true,
			  version    : 'v2.0'
	        });
	      };

	      (function(d, s, id){
	         var js, fjs = d.getElementsByTagName(s)[0];
	         if (d.getElementById(id)) {return;}
	         js = d.createElement(s); js.id = id;
	         js.src = "//connect.facebook.net/en_US/sdk.js";
	         fjs.parentNode.insertBefore(js, fjs);
	       }(document, 'script', 'facebook-jssdk'));
	</script>
<?php } ?>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
	if ($("body").hasClass("news-ncategory")) {
		$(".news_latest h3").hide();
		$(".artb").removeClass("artblock");
		$(".blog-button").removeClass('hidden');
		$(".description").show();
		$(".bnews-list").css("overflow", "hidden");
		$(".title-nav .nav").removeClass("hidden");
		let bg = $(".info").data("id");
		$(".info").parent().parent().css("background", bg);

		function initSlicknc() {
		    $('#news_latest.bnews-list').slick({
		      dots: false,
		      infinite: true,
		      speed: 500,
		      autoplaySpeed: 6000,
		      arrows: true,
		      pauseOnHover: false,
		      autoplay: false,
		      slidesToShow: 1,
		      responsive: [
	          {
		        breakpoint: 767,
		        settings: {
			      arrows: false,
			      autoplay: true,
		        }
		      },
		      ],
				prevArrow: "<div class='pointer slick-nav left prev absolute'><div class='absolute position-center-center'></div></div>",
				nextArrow: "<div class='pointer slick-nav right next absolute'><div class='absolute position-center-center'></div></div>",
		    });
		  }
		initSlicknc();
	}

	if ($("body").hasClass("common-home")) {
		$(".news_latest h3").hide();
		let title = $(".news_latest h3").text();
		$(".der-title").parent().removeClass('hidden');
		$(".der-title").append(title);
		$("#news_latest").removeClass('bnews-list');
		$("#news_latest").addClass('newslatest-home');
		$(".blog-button").removeClass("hidden");
		$(".home-btn").removeClass("hidden");

		function initSlicknchome() {
		    $('.newslatest-home').slick({
		      dots: true,
		      infinite: true,
		      speed: 500,
		      autoplaySpeed: 6000,
		      arrows: true,
		      pauseOnHover: false,
		      autoplay: false,
		      slidesToShow: 4,
	          responsive: [
	            {
	              breakpoint: 1100,
	              settings: {
	                slidesToShow: 3,
	              }
	            },
	            {
	              breakpoint: 991,
	              settings: {
	                slidesToShow: 2,
	              }
	            },
	            {
	              breakpoint: 767,
	              settings: {
	                slidesToShow: 1,
	                arrows: false,
	                autoplay: true,
	                autoplaySpeed: 5000
	              }
	            }
	          ],
				prevArrow: "<div class='pointer slick-nav left prev absolute'><div class='absolute position-center-center'></div></div>",
				nextArrow: "<div class='pointer slick-nav right next absolute'><div class='absolute position-center-center'></div></div>",

			  customPaging: function (slider, i) {
				  // console.log(slider);
				  // return slider.slideCount;
				  // if (slider.slideCount < ) {}
			  },
		    });
		  }
		initSlicknchome();
	}
</script>

<script type="text/javascript">
	if ($('body').hasClass("common-home")) {
		if ($(".newslatest-home .slick-list").prev().hasClass("slick-nav")) {
			$(".news_latest .nav .prev").removeClass("hidden");
		}

		if ($(".newslatest-home .slick-list").next().hasClass("slick-nav")) {
			$(".news_latest .nav .next").removeClass("hidden");
		}

		$(".news_latest .nav .prev").click(function(){
			$(".nl .slick-nav.prev").click();
		})

		$(".news_latest .nav .next").click(function(){
			$(".nl .slick-nav.next").click();
		})
	}

	//art page
	$(document).ready(function(){
		$(".news-ncategory .nav .prev").addClass("hidden");
		$(".news-ncategory .nav .next").addClass("hidden");

		if ($(".news-ncategory .slick-list").prev().hasClass("slick-nav")) {
			$(".news-ncategory .nav .prev").removeClass("hidden");
		}

		if ($(".news-ncategory .slick-list").next().hasClass("slick-nav")) {
			$(".news-ncategory .nav .next").removeClass("hidden");
		}

		$(".news-ncategory .nav .prev").click(function(){
			$(".nl .slick-nav.prev").click();
		})

		$(".news-ncategory .nav .next").click(function(){
			$(".nl .slick-nav.next").click();
		})

	})
</script>