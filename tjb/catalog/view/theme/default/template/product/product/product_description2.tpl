<h4><?= $heading_title; ?></h4>
<h3><?= $product_name; ?></h3>

<?php /* completecombo */ ?>
<?php if (isset($salescombopgeoffers)) {  
  foreach($salescombopgeoffers as $offer) { 
    echo html_entity_decode($offer['html']); 
  } 
} ?>
<?php /* completecombo */ ?>
<?php if ($price && !$enquiry) { ?>
<ul class="list-unstyled price-wrapper">
  <?php if (!$special) { ?>
  <li>
    <div class="product-price old-prices" ><?= $price; ?></div>
  </li>
  <?php } else { ?>
  <li>
    <div class="product-special-price new-prices sale"><?= $special; ?></div>
  </li>
  <li><span style="text-decoration: line-through;" class="old-prices dc"><?= $price; ?></span></li>
  <?php } ?>
  <?php if ($tax) { ?>
  <li class="product-tax-price product-tax" ><?= $text_tax; ?> <?= $tax; ?></li>
  <?php } ?>
  <?php if ($points) { ?>
  <li><?= $text_points; ?> <?= $points; ?></li>
  <?php } ?>
  <?php if ($discounts) { ?>
  <li>
    <hr>
  </li>
  <?php foreach ($discounts as $discount) { ?>
  <li><?= $discount['quantity']; ?><?= $text_discount; ?><?= $discount['price']; ?></li>
  <?php } ?>
  <?php } ?>
</ul>
<?php } ?>

<div class="product-description pd-b30">
  <?= $description; ?>
</div>

<?php include_once('product_options2.tpl'); ?>

<?php if($share_html){ ?>
  <div class="input-group-flex">
    <span>SHARE</span>
    <div><?= $share_html; ?></div>
  </div>
<?php } ?>

<?= $waiting_module; ?>
