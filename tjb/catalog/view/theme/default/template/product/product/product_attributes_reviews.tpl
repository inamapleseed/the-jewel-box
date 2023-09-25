<?php if ($attribute_groups || $review_status || isset($available_offers['tab']) && $available_offers['tab'] ) { ?>
  <ul id="product-tabs" class="nav nav-tabs">

  <!--   <?php if(isset($available_offers['tab']) && $available_offers['tab']) { ?>
      <li><a href="#tab-available-offers" data-toggle="tab"><?php echo $tab_available_offers; ?></a></li>
    <?php } ?> -->

    <?php if ($attribute_groups) { ?>
      <?php foreach ($attribute_groups as $index_1 => $attribute_group) { ?>
        <?php foreach ($attribute_group['attribute'] as $index_2 => $attribute) { ?>
          <div class="set">
            <li class="<?= !$index_2?'active':''; ?>" >
              <div class='a' href="#tab-attribute-<?= $index_1; ?>-<?= $index_2; ?>" data-toggle="collapse"><?= $attribute['name']; ?></div>
              <span class="plus">+</span>
            </li>
            <div class="tab-pane collapse <?= !$index_2?'active':''; ?>" id="tab-attribute-<?= $index_1; ?>-<?= $index_2; ?>">
              <?= html($attribute['text']); ?>
            </div>
          </div>
        <?php } ?>
      <?php } ?>
    <?php } ?>

  </ul>
<?php } ?>