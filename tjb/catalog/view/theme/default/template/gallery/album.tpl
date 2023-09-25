<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <h2>Our Services</strong></h2>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <?php echo $content_top; ?>
 
      <div class="album-container">
        <?php foreach ($albums as $i => $album): ?>
          <?php if ($album['status'] != 0): ?>
            <div class="inner" data-aos="fade-up">
              <div class="images">
                <img src="<?php echo $album['image']; ?>" alt="image" class="bg">

                <img src="<?php echo $album['image']; ?>" alt="image">

                <div class="overlay">
                  <a href="<?php echo $album['href']; ?>" class="btn btn-primary">Read More</a>
                </div>
              </div>

              <div class="description">
                <h3><?php echo $album['name']; ?></h3>
                <?php echo html_entity_decode($album['description']); ?>
              </div>
            </div>
          <?php endif ?>
        <?php endforeach ?>
      </div>
   
      <?php echo $pagination; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div> 
    <?php echo $content_bottom; ?>
<?php echo $footer; ?> 