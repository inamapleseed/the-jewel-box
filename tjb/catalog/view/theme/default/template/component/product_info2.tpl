<div class="product-gutter" id="product-<?=$product_id?>"> <?php /* product option in product component :: add product id to div  */ ?>
  <div class="product-block <?= $out_of_stock; ?>">
    <div class="product-image-block relative">
      <?php if($sticker && $sticker['name']){ ?>
        <a 
        href="<?= $href; ?>" 
        title="<?= $name; ?>" 
        class="sticker absolute <?= $sticker['image'] ? 'sticker-image':''; ?>" 
        style="color: <?= $sticker['color']; ?>; border: 1px solid <?= $sticker['background-color']; ?>;">
          <?php if($sticker['image']){ ?>
              <img src="<?= $sticker['image'] ?>" />
          <?php } else { 
              echo $sticker['name']; 
          } ?>
        </a>
      <?php } else { ?>
      <?php if($show_special_sticker && !$enquiry){ ?>
        <a 
        href="<?= $href; ?>" 
        title="<?= $name; ?>" 
        class="sticker absolute" 
        style="top:<?= $sticker ? '30px' : '0px' ?>; color: #BF0608; background-color: transparent; border: 1px solid #BF0608">
          <?= $text_sale; ?>
        </a>
      <?php } ?>
      <?php } ?>
      <a 
        href="<?= $href; ?>" 
        title="<?= $name; ?>" 
        class="product-image image-container relative" >
        <img 
          src="<?= $thumb; ?>" 
          alt="<?= $name; ?>" 
          title="<?= $name; ?>"
          class="img-responsive img1" />
        <?php if($thumb2 && $hover_image_change) { ?>
          <img 
            src="<?= $thumb2; ?>" 
            alt="<?= $name; ?>" 
            title="<?= $name; ?>"
            class="img-responsive img2" style="display: none"/>
        <?php } ?>

      </a>
      <div class="btn-group product-button">
        <?php if ($options) { ?>
            <?php if($enquiry){ ?>
          <button type="button"
              class="btn btn-default btn-enquiry btn-enquiry-<?= $product_id; ?>" data-product-id="<?= $product_id; ?>"
            >ADD TO ENQUIRY</button>
            <?php }else{ ?>
          <button type="button"
              class="btn btn-default btn-cart btn-cart-<?= $product_id; ?>" data-product-id="<?= $product_id; ?>"
            >ADD TO CART</button>
            <?php } ?>
        <?php } else { ?>
            <button type="button"
            onclick="enquiry.add('<?= $product_id; ?>', '<?= $minimum; ?>');"
            class="btn btn-primary enq">
            ADD TO ENQUIRY
            </button>

          <?php if (!$not_avail): ?>
            <?php if (!$enquiry): ?>
              <button type="button"
              onclick="cart.add('<?= $product_id; ?>', '<?= $minimum; ?>');"
              class="btn btn-primary">
              ADD TO CART
              </button>
            <?php endif ?>
          <?php endif ?>
        <?php } ?>
      </div>
    </div>
    <div class="category">
      <?php echo $category; ?>
    </div>

    <div class="product-name">
      <a href="<?= $href; ?>"><?= $name; ?></a>
    </div>

    <div class="product-details product-price-<?=$product_id?>">
      <?php if ($price && !$enquiry) { ?>
        <div class="price">
          <?php if (!$special) { ?>
            <span class="price-new"><?= $price; ?></span>
          <?php } else { ?>
            <span class="price-new sale"><?= $special; ?></span>
            <span class="price-old"><?= $price; ?></span>
          <?php } ?>
          <?php if ($tax) { ?>
            <span class="price-tax"><?= $text_tax; ?> <?= $tax; ?></span>
          <?php } ?>
        </div>
      <?php } ?>

    </div>
    <?php /* product option in product component */ ?>
      <div class="product-inputs">
        <?php if ($options && count($options) == 1) { ?>
        <div class="product-option">
            <?php foreach ($options as $option) { ?>
              <?php if ($option['type'] == 'select') { ?>
              <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
                <select name="option[<?= $option['product_option_id']; ?>]" id="input-option<?= $option['product_option_id']; ?>" class="form-control" data-product-id="<?= $product_id; ?>">
                  <option value=""><?= $text_select; ?></option>
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <option value="<?= $option_value['product_option_value_id']; ?>"><?= $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
                  <?php } ?>
                  </option>
                  <?php } ?>
                </select>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'radio') { ?>
              <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?= $option['name']; ?></label>
                <div id="input-option<?= $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="radio">
                    <label>
                      <input type="radio" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option_value['product_option_value_id']; ?>" data-product-id="<?= $product_id; ?>" />
                      <?php if ($option_value['image']) { ?>
                      <img src="<?= $option_value['image']; ?>" alt="<?= $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                      <?php } ?>                    
                      <?= $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'checkbox') { ?>
              <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?= $option['name']; ?></label>
                <div id="input-option<?= $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="option[<?= $option['product_option_id']; ?>][]" value="<?= $option_value['product_option_value_id']; ?>" data-product-id="<?= $product_id; ?>" />
                      <?php if ($option_value['image']) { ?>
                      <img src="<?= $option_value['image']; ?>" alt="<?= $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                      <?php } ?>
                      <?= $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'text') { ?>
              <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
                <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" placeholder="<?= $option['name']; ?>" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'textarea') { ?>
              <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
                <textarea name="option[<?= $option['product_option_id']; ?>]" rows="5" placeholder="<?= $option['name']; ?>" id="input-option<?= $option['product_option_id']; ?>" class="form-control"><?= $option['value']; ?></textarea>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'file') { ?>
              <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?= $option['name']; ?></label>
                <button type="button" id="button-upload<?= $option['product_option_id']; ?>" data-loading-text="<?= $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?= $button_upload; ?></button>
                <input type="hidden" name="option[<?= $option['product_option_id']; ?>]" value="" id="input-option<?= $option['product_option_id']; ?>" />
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'date') { ?>
              <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
                <div class="input-group date">
                  <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'datetime') { ?>
              <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
                <div class="input-group datetime">
                  <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'time') { ?>
              <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
                <div class="input-group time">
                  <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" data-date-format="HH:mm" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
            <?php } ?>
        </div>
        <?php } ?>
      
      </div>
    <?php /* product option in product component */ ?>
  </div>
</div>