<div class="related-module related_<?= $uqid; ?>">

  <div class="title-nav">
    <h2 data-aos="fade-right"><?php echo $heading_title; ?></h2>

    <div class="nav ">
      <a class="prev no-any">Prev</a>
      <a class="next no-any">Next</a>
    </div>
  </div>

  <div class="related section relative" style="opacity: 0;">
    <div id="related_slider_<?= $uqid; ?>" class="related-products">
      <?php foreach ($products as $product) { ?>
        <?= html($product); ?>
      <?php } ?>
    </div>
    <script type="text/javascript">

      $(window).load(function(){
        setTimeout(function () {
          related_product_slick<?= $uqid; ?>();
          AOS.init();
        }, 250);
      });

      function related_product_slick<?= $uqid; ?>(){
        $("#related_slider_<?= $uqid; ?>").on('init', function (event, slick) {
          $('#related_slider_<?= $uqid; ?>').parent().removeAttr('style');
        });

        $("#related_slider_<?= $uqid; ?>").slick({
          dots: false,
          infinite: false,
          speed: 300,
          slidesToShow: 4,
          slidesToScroll: 1,
          responsive: [
            {
              breakpoint: 1201,
              settings: {
                slidesToShow: 4,
              }
            },
            {
              breakpoint: 1025,
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
    </script>
  </div>
</div>

<script type="text/javascript">
  $(".nav .prev").click(function(){
    $("#related_slider_related_products_ .slick-nav.prev").click();
  })
  $(".nav .next").click(function(){
    $("#related_slider_related_products_ .slick-nav.next").click();
  })
</script>