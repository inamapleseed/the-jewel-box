<div style="background: <?php echo $bg; ?>" class="enquiry-form">
  <h2>Enquiry Form</h2>
  <form action="<?= $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
    <div class="contact-body">
      <div class="form-group required">
        <input type="text" name="name2" placeholder="Full name" value="<?= $name2; ?>" id="input-name2" class="form-control"/>
        <?php if ($error_name2) { ?>
          <div class="text-danger"><?= $error_name2; ?></div>
        <?php } ?>                
      </div>
    
      <div class="form-group required">
        <input type="text" name="email2" placeholder="Email address" value="<?= $email2; ?>" id="input-email2" class="form-control"/>
        <?php if ($error_email2) { ?>
          <div class="text-danger"><?= $error_email2; ?></div>
        <?php } ?>
      </div>
    
      <div class="form-group required">
        <input type="tel" name="telephone2" placeholder="Contact number" value="<?= $telephone2; ?>" id="input-telephone2" class="form-control input-number"/>
        <?php if ($error_telephone2) { ?>
          <div class="text-danger"><?= $error_telephone2; ?></div>
        <?php } ?>
      </div>

      <div class="form-group required">
        <select name="subject2" value="<?= $subject2; ?>" id="input-subject2" class="form-control select">
          <option disabled class="option" selected="selected">Services</option>
          <?php foreach ($repeater as $key => $subject): ?>
            <option value="<?php echo $subject['esubject'] ?>">
              <?php echo $subject['esubject'] ?>
            </option>
          <?php endforeach ?>
        </select>
      </div>

      <div class="form-group required">
        <textarea name="enquiry2" rows="5" placeholder="Message" id="input-enquiry2" class="form-control" ><?= $enquiry2; ?></textarea>
        <?php if ($error_enquiry2) { ?>
          <div class="text-danger"><?= $error_enquiry2; ?></div>
        <?php } ?>
      </div>

    </div>
    <div class="contact-footer text-center">
      <?= $captcha; ?>
      <div class="the-button">
        <input class="btn btn-default pull-sm-right" type="submit" value="<?= $button_submit; ?>" />
      </div>
    </div>
  </form>
</div>