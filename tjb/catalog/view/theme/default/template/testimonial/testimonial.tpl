<?= $header; ?>
<div class="container">
    <?= $content_top; ?>
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?= $breadcrumb['href']; ?>"><?= $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?= $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?= $class; ?>">
            <div class="about">
                <div class="title-text">
                    <h2 data-aos="fade-up"><?php echo $about['ptitle']; ?></h2>
                    <p data-aos="fade-up"><?php echo html_entity_decode($about['text']); ?></p>
                </div>

                <div class="about-inner">
                    <?php if ($about['repeater']): ?>
                        <?php foreach ($about['repeater'] as $i => $rep): ?>
                                <div class="inner <?php echo $i % 2 ? 'odd' : 'even'; ?>">
                                    <div class="images images<?php echo $i ?>" data-aos="flip-left">
                                        <img data-id="<?=$rep['cimage'];?>" src="" alt="image">
                                        <script type="text/javascript">
                                            let src<?php echo $i; ?> = $(".about-inner .images<?php echo $i ?> img").data("id");

                                            let http<?php echo $i; ?> = src<?php echo $i; ?>.startsWith("http");
                                            if (http<?php echo $i; ?> == false) {
                                                // console.log(http<?php echo $i; ?>);
                                                // console.log(src<?php echo $i; ?>);
                                                let new_src<?php echo $i; ?> = 'image/'+src<?php echo $i; ?>;
                                                // console.log(new_src<?php echo $i; ?>);
                                                $(".images<?php echo $i; ?> img").attr("src", new_src<?php echo $i; ?>);
                                            } else {
                                                $(".images<?php echo $i; ?> img").attr("src", src<?php echo $i; ?>);
                                            }

                                        </script>
                                    </div>
                                    <div class="text" data-aos="fade-right">
                                        <?php if ($rep['ctitle']): ?>
                                            <h3><?php echo $rep['ctitle']; ?></h3>
                                        <?php endif ?>
                                        <?= html_entity_decode($rep['ctext']);?>
                                    </div>
                                </div>
                        <?php endforeach ?>
                    <?php endif ?>
                </div>
            </div>

            <h2 data-aos="fade-up" data-aos-delay="300">Testimonials</h2>

            <?php if ($testimonials): ?>
                <div class="testimonial-con">

                    <div class="testimonial-slick">
                        <?php foreach ($testimonials as $rev): ?>
                            <div class="inner">
                                <div class="text-con">
                                    <?php if ($rev['title']): ?>
                                        <h3 class="title">"<?php echo $rev['title']; ?>"</h3>
                                    <?php endif ?>

                                    <div class="p">
                                        <p><?php echo $rev['description']; ?></p>
                                    </div>
                                    <h4 class="name"><?php echo $rev['author']; ?></h4>
                                    <div class="bg"></div>
                                </div>
                            </div>
                        <?php endforeach ?>
                    </div>

                    <div class="der-btn">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#review-btn">Leave a Review</button>
                    </div>
                </div>
            <?php endif ?>            


            <div class="modal fade" id="review-btn" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content" style="background: <?php echo $bg['abtbg']; ?>">
                  <div class="modal-header close-btn" data-dismiss="modal" >
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>

                  <div class="modal-body">
                    <?php if ($review_status) { ?>
                        <h2>Leave a Review</h2>

                        <form class="form-horizontal" id="form-review">
                            
                            <?php if ($review_guest) { ?>
                                
                            <div class="form-group required">
                                <div class="col-sm-12">
                                    <input type="text" name="name" placeholder="Full name" value="<?= $customer_name; ?>" id="input-name" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group required time-date">
                                <div class="inner-form">
                                      <input type="text" name="date_of_purchase" readonly placeholder="Date of purchase (Optional)" value="<?= $date_of_purchase; ?>" id="input-date_of_purchase2" class="form-control has-time-date"  />

                                      <input type="date" value="<?= $date_of_purchase; ?>" max="<?php $date = date('Y-m-d'); echo $date; ?>" class="og-btn" id="input-date_of_purchase" class="form-control"  />
                                      <div class="erase-data hidden">&times;</div>
                                      <div class="time-date-icon"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>

                            <div class="form-group required">
                                <div class="col-sm-12">
                                    <textarea name="text" rows="5" placeholder="Your review" id="input-review" class="form-control"></textarea>
                                </div>
                            </div>

                            <div class="form-group required hidden">
                                <div class="col-sm-12">
                                    <label class="control-label"><?= $entry_rating; ?></label>
                                    &nbsp;&nbsp;&nbsp; <?= $entry_bad; ?>&nbsp;
                                    <input type="radio" name="rating" value="1" />
                                    &nbsp;
                                    <input type="radio" name="rating" value="2" />
                                    &nbsp;
                                    <input type="radio" name="rating" value="3" />
                                    &nbsp;
                                    <input type="radio" name="rating" value="4" />
                                    &nbsp;
                                    <input type="radio" name="rating" checked="checked" value="5" />
                                    &nbsp;<?= $entry_good; ?></div>
                            </div>

                            <div class="contact-footer">
                                <?php if (isset($site_key) && $site_key) { ?>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <div class="g-recaptcha" data-sitekey="<?= $site_key; ?>"></div>
                                        </div>
                                    </div>
                                <?php } elseif(isset($captcha) && $captcha){ ?>
                                <?= $captcha; ?>
                                <?php } ?>
                                <div class="buttons clearfix">
                                    <button type="button" id="button-review" data-loading-text="<?= $text_loading; ?>" class="btn btn-primary">Submit</button>
                                </div>
                                <?php } else { ?>
                                    <?= $text_login; ?>
                                <?php } ?>
                            </div>
                        </form>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
        </div>

        <?= $column_right; ?>
    </div>
    <?= $content_bottom; ?>

    <script type="text/javascript">
        $('#button-review').on('click', function () {
            $.ajax({
                url: '<?= html($write); ?>',
                type: 'post',
                dataType: 'json',
                data:  $("#form-review").serialize(),
                beforeSend: function () {
                    if ($("textarea").is("#g-recaptcha-response")) {
                        grecaptcha.reset();
                    }
                    $('#button-review').button('loading');
                },
                complete: function () {
                    $('#button-review').button('reset');
                },
                success: function (json) {
                    $('.alert-success, .alert-danger').remove();
                    if (json['error']) {
                        $('#form-review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                    }
                    if (json['success']) {
                        $('#form-review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                        $('input[name=\'name\']').val('');
                        $('input[name=\'date_of_purchase\']').val('');
                        $('textarea[name=\'text\']').val('');
                        $('input[name=\'rating\']:checked').prop('checked', false);
                    }
                }
            });
        });
    </script>
</div>
<?= $footer; ?>

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
              // autoplay: true,
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


<script type="text/javascript">
  $("#input-date_of_purchase").on("change", function(){
    let weddingtime = $(this).val();
    $("#input-date_of_purchase2").val(weddingtime);
    $(this).parent().find('.erase-data').removeClass('hidden');
    $(this).parent().find('.erase-data').show();
  })

  //click hidden overlay, click underneath
  $(".og-btn").click(function(){
    $(".time-date-icon i").css("color", "black");
  })

  //to erase value in readonly input
  $(".erase-data").click(function(){
    $(this).parent().find("input[type=text]").val('');
    $(this).hide();
    $(this).parent().find(".time-date-icon i").css("color", "black");
  })

  //if readonly is clicked, highlight icon to warn
  $(".has-time-date").click(function(){
    $(this).parent().find(".time-date-icon i").css("color", "red");
  })
</script>