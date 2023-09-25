<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-gall-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-gall-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-gall-12'; ?>
    <?php } ?> 
    <div id="content" class="<?php echo $class; ?>">
      <?php echo $content_top; ?>
      <div class="content">
        <h2 data-aos="zoom-in"><?php echo $heading_title; ?></h2>

        <?php foreach ($gallimages as $imgs): ?>
          <div class="inner">
            <img src="<?= $imgs['image']; ?>" data-aos="fade-up" alt="<?= $imgs['title']; ?>" style="width: 100%; ">

            <h3 data-aos="fade-up" ><?php echo $imgs['title']; ?></h3>

            <div class="text" data-aos="fade-up" >
              <?php echo $imgs['link']; ?>
            </div>
          </div>
        <?php endforeach ?>
      </div>  
  
  <?php echo $content_bottom; ?>    
  </div>
  <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 