<div class="featured-module featured_<?= $uqid; ?>">

  <div class="title-nav">
    <h2 data-aos="fade-right"><?php echo $heading_title; ?></h2>

    <div class="nav ">
      <a class="prev no-any hidden">Prev</a>
      <a class="next no-any hidden">Next</a>
    </div>
  </div>

  <div class="featured section relative" style="opacity: 0;">
    <div id="featured_slider_<?= $uqid; ?>" class="sliderr">
      <?php foreach ($products as $product) { ?>
        <?= html($product); ?>
      <?php } ?>
    </div>
    <script type="text/javascript">

      $(window).load(function(){
        setTimeout(function () {
          featured_product_slick<?= $uqid; ?>();
          AOS.init();
        }, 250);
      });

      function featured_product_slick<?= $uqid; ?>(){
        $("#featured_slider_<?= $uqid; ?>").on('init', function (event, slick) {
          $('#featured_slider_<?= $uqid; ?>').parent().removeAttr('style');
        });

        $("#featured_slider_<?= $uqid; ?>").slick({
          dots: false,
          infinite: true,
          speed: 300,
          slidesToShow: 4,
          slidesToScroll: 1,
          responsive: [
            {
              breakpoint: 993,
              settings: {
                slidesToShow: 3,
              }
            },
            {
              breakpoint: 769,
              settings: {
                slidesToShow: 2,
              }
            },
            {
              breakpoint: 541,
              settings: {
                slidesToShow: 2,
                arrows: false,
                autoplay: true,
                autoplaySpeed: 5000
              }
            },
            {
              breakpoint: 415,
              settings: {
                slidesToShow: 2,
                arrows: false,
                autoplay: true,
                autoplaySpeed: 5000
              }
            },
            {
              breakpoint: 376,
              settings: {
                slidesToShow: 1,
                arrows: false,
                autoplay: true,
                autoplaySpeed: 5000
              }
            }
          ],
          prevArrow: "<div class='pointer slick-nav left prev absolute'><div class='absolute position-center-center'><i class='fa fa-chevron-left fa-2em'></i></div></div>",
          nextArrow: "<div class='pointer slick-nav right next absolute'><div class='absolute position-center-center'><i class='fa fa-chevron-right fa-2em'></i></div></div>",
        });
      }

      let slidecount = jQuery('.slick-slide:not(.slick-cloned)').length;

      if ($(document).width() > 993) {
        if (slidecount > 3) {
        console.log(slidecount);
          $(".featured-module .nav > a").removeClass("hidden");
        }
      }

    </script>
  </div>
</div>

<script type="text/javascript">

  $(document).ready(function(){
    $(".featured .nav .prev").click(function(){
      $(".featured .slick-nav.prev").click();
    })
    $(".featured .nav .next").click(function(){
      $(".featured .slick-nav.next").click();
    })


    if ($(".featured-module .featured .slick-list").prev().hasClass("slick-nav")) {
      $(".featured .nav .prev").removeClass("hidden");
    }

    if ($(".featured-module .featured .slick-list").next().hasClass("slick-nav")) {
      $(".featured .nav .next").removeClass("hidden");
    }

  })
</script>