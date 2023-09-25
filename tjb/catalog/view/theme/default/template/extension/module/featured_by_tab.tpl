<div class="fcategory_tab" style="background: <?php echo $bg['bespokeprods']; ?>">


  <div class="title-nav">
    <h2 data-aos="fade-right"><?php echo $heading_title; ?></h2>

    <div class="nav">
      <a class="prev no-any">Prev</a>
      <a class="next no-any">Next</a>
    </div>
  </div>

  <ul class="nav nav-pills margin-auto table width-auto">
    <?php foreach ($tabs as $index => $tab) { ?>
      <li <?php if(!$index){ ?>class="active"<?php } ?> >
        <a data-toggle="tab" href="#fc<?= $index; ?>-tab-content"><?= $tab['tab_name']?$tab['tab_name']:$tab['name']; ?></a>
      </li>
    <?php } ?>
  </ul>

  <div class="tab-content">
    <?php foreach ($tabs as $index => $tab) { ?>
      <div class="tab-pane fade <?= !$index?'in active':''; ?>" id="fc<?= $index; ?>-tab-content">
        <div class="fc_product_slider">
          <div class="owl-carousel" id="fc_tab_slider_<?= $uqid; ?>-<?= $index; ?>" >
            <?php foreach($tab['products'] as $product){ ?>
              <?= $product; ?>
            <?php }  ?>
          </div>
  
        </div> 
      </div>
    <?php } ?>
  </div>

  <?= $slider_script; ?>

</div>