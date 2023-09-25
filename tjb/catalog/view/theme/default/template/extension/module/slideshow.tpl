<div class="slideshow1 slideshow relative"  style="opacity: 1; width: 100%;">
  <?php foreach ($banners as $banner) { ?>
    <div class="relative h100">
      <img src="<?= $banner['image']; ?>" alt="<?= $banner['title']; ?>" class="img-responsive hidden-xs" />
      <img src="<?= $banner['mobile_image']; ?>" alt="<?= $banner['title']; ?>" class="img-responsive visible-xs" />

          <?php if($banner['description']){ ?>
            <div class="slider-slideshow-description <?= $banner['title']; ?> w100 absolute position-center-center background-type-<?= $banner['theme']; ?>">
              <div class="container">
                <div class="slider-slideshow-description-texts">
                  <?= html_entity_decode( $banner['description']); ?>
                  <p style="font-size: calc(27px + (<?php echo $banner['title_font_size'] ? $banner['title_font_size'] : '40'; ?> - 27) * (100vw - 320px) / (1920 - 320));"><?= html_entity_decode( $banner['title_text']); ?></p>

                  <?php if ( $banner['link'] && $banner['link_text'] ) { ?>
                      <div class="slider-slideshow-description-link" style="text-align: <?php echo $banner['btn_pos'] ?>">
                        <a href="<?= $banner['link']; ?>" class="btn btn-primary">
                          <?= $banner['link_text']; ?>
                        </a>
                      </div>
                  <!--class:slider-slideshow-description-link-->
                  <?php } ?>
                </div>
                <!--class:slider-slideshow-description-texts-->
              </div>
              <!--class:container-->
            </div>
            <!--class:slider-slideshow-description-->
          <?php } ?>
            
      <?php if($banner['link']){ ?>
        <a href="<?= $banner['link']; ?>" class="block absolute position-left-top w100 h100"></a>
      <?php } ?>
    </div>
  <?php } ?>
</div>

<div class="slideshow2 slideshow relative"  style="opacity: 0; width: 100%;">
  <?php foreach ($banners as $banner) { ?>
    <div class="relative h100">
      <img src="<?= $banner['image']; ?>" alt="<?= $banner['title']; ?>" class="img-responsive hidden-xs" />
      <img src="<?= $banner['mobile_image']; ?>" alt="<?= $banner['title']; ?>" class="img-responsive visible-xs" />
      <?php if($banner['description']){ ?>
        <div class="slider-slideshow-description <?= $banner['title']; ?> w100 absolute position-center-center background-type-<?= $banner['theme']; ?>">
          <div class="container">
            <div class="slider-slideshow-description-texts">
              <?= html_entity_decode($banner['description']); ?>
              <p style="font-size: calc(27px + (<?php echo $banner['title_font_size'] ? $banner['title_font_size'] : '40'; ?> - 27) * (100vw - 320px) / (1920 - 320));"><?= html_entity_decode( $banner['title_text']); ?></p>

              <?php if ( $banner['link'] && $banner['link_text'] ) { ?>
              <div class="slider-slideshow-description-link" style="text-align: <?php echo $banner['btn_pos'] ?>">
                <a href="<?= $banner['link']; ?>" class="btn btn-primary">
                  <?= $banner['link_text']; ?>
                </a>
              </div>
              <!--class:slider-slideshow-description-link-->
              <?php } ?>
            </div>
            <!--class:slider-slideshow-description-texts-->
          </div>
          <!--class:container-->
        </div>
        <!--class:slider-slideshow-description-->
      <?php } ?>
      
      <?php if($banner['link']){ ?>
        <a href="<?= $banner['link']; ?>" class="block absolute position-left-top w100 h100"></a>
      <?php } ?>
      
    </div>
  <?php } ?>
</div>
<?php //include('slideshow_script_slick.tpl'); ?>
<?php //include('slideshow_script_owl.tpl'); ?>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script type="text/javascript">
  function initSlick2() {
    $('.slideshow1').slick({
      dots: false,
      infinite: true,
      speed: 1000,
      autoplaySpeed: 6000,
      arrows: false,
      pauseOnHover: false,
      slidesToShow: 1
    });
  }
  initSlick2();
</script>
<script type="text/javascript">
  function initSlick4() {
    $('.slideshow2').slick({
      dots: false,
      infinite: true,
      speed: 1000,
      autoplaySpeed: 6000,
      arrows: false,
      pauseOnHover: false,
      asNavFor: '.slideshow1',
      slidesToShow: 1,
    });
  }
  initSlick4();
</script>