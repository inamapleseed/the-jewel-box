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
			<h2 data-aos="fade-up" data-aos-delay="300"><?= $heading_title; ?></h2>

			<div class="row pd-b30">
				<div class="col-xs-12">
					<div class="iframe-wrap" data-aos="fade-up"><?= $gmap_iframe ?></div>
				</div>
			</div>

			<?php if ($locations) { ?>
			<h3><?= $text_store; ?></h3>
			<div class="panel-group" id="accordion">
				<?php foreach ($locations as $index => $location) { ?>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a href="#collapse-location<?= $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" >
								<?= $location['name']; ?> <i class="fa fa-caret-down"></i>
							</a>
						</h4>
					</div>
					<div class="panel-collapse collapse" id="collapse-location<?= $location['location_id']; ?>" >
						<div class="panel-body">
							<div class="row">
								<div class="col-sm-12">
									<div class="iframe-wrap"><?= $location['gmap_iframe'] ?></div>
								</div>

							<?php if ($location['image']) { ?>
							<div class="col-sm-3"><img src="<?= $location['image']; ?>" alt="<?= $location['name']; ?>" title="<?= $location['name']; ?>" class="img-thumbnail" /></div>
							<?php } ?>
							<div class="col-sm-3"><strong><?= $location['name']; ?></strong><br />
								<address>
									<?= $location['address']; ?>
								</address>
								<?php if ($location['geocode']) { ?>
								<a href="https://maps.google.com/maps?q=<?= urlencode($location['geocode']); ?>&hl=<?= $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?= $button_map; ?></a>
								<?php } ?>
							</div>
							<div class="col-sm-3"> <strong><?= $text_telephone; ?></strong><br>
								<?= $location['telephone']; ?><br />
								<br />
								<?php if ($location['fax']) { ?>
								<strong><?= $text_fax; ?></strong><br>
								<?= $location['fax']; ?>
								<?php } ?>
							</div>
							<div class="col-sm-3">
								<?php if ($location['open']) { ?>
								<strong><?= $text_open; ?></strong><br />
								<?= $location['open']; ?><br />
								<br />
								<?php } ?>
								<?php if ($location['comment']) { ?>
								<strong><?= $text_comment; ?></strong><br />
								<?= $location['comment']; ?>
								<?php } ?>
							</div>
						</div>
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
		<?php } ?>

		<div class="row mon-row">
			<div class="col-sm-12 col-md-3 pd-b30 details">
				<h3 data-aos="fade-up"><?= $store; ?></h3>
				<div data-aos="fade-up">
					<h4>ADDRESS:</h4>
					<address>
						<?= $address; ?>
					</address>
				</div>
					<br />
				<div class="contact" data-aos="fade-up">
					<h4><?= $text_telephone; ?>:</h4>
					<a href="tel:<?= $store_telephone; ?>" alt="<?= $store_telephone; ?>" title="<?= $store_telephone; ?>" ><?= $store_telephone; ?></a><br />
					<br />
					<br />
					<h4>EMAIL:</h4>
					<a class="email" href="mailto:<?= $store_email; ?>" alt="<?= $store_email; ?>" title="<?= $store_email; ?>" ><?= $store_email; ?></a><br />
					<br />
					<br />
					<?php if ($fax) { ?>
						<h4><?= $text_fax; ?>:</h4><br>
						<a href="fax:<?= $fax; ?>" alt="<?= $fax; ?>" title="<?= $fax; ?>" ><?= $fax; ?></a>
					<?php } ?>
				</div>
				<div data-aos="fade-up">
					<?php if ($open) { ?>
					<h4><?= $text_open; ?>:</h4><br />
					<?= $open; ?><br />
					<br />
					<?php } ?>
					<?php if ($comment) { ?>
					<h4><?= $text_comment; ?>:</h4><br />
					<?= $comment; ?>
					<?php } ?>
				</div>
			</div>
			<div class="col-sm-12 col-md-9 pd-b30">
				<form id="contact-us-form" action="<?= $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
					<h3 data-aos="fade-up"><?= $store; ?></h3>
					<div class="contact-body">
						<div class="form-group required" data-aos="fade-up">
							<input type="text" name="name" value="<?= $name; ?>" id="input-name" class="form-control" placeholder="Full name" />
							<?php if ($error_name) { ?>
							<div class="text-danger"><?= $error_name; ?></div>
							<?php } ?>
						</div>

						<div class="form-group required" data-aos="fade-up">
							<input type="text" name="email" value="<?= $email; ?>" id="input-email" class="form-control" placeholder="Email address" />
							<?php if ($error_email) { ?>
							<div class="text-danger"><?= $error_email; ?></div>
							<?php } ?>
						</div>

						<div class="form-group required" data-aos="fade-up">
							<input type="tel" name="telephone" value="<?= $telephone; ?>" id="input-telephone" class="form-control input-number" placeholder="Contact number" />
							<?php if ($error_telephone) { ?>
							<div class="text-danger"><?= $error_telephone; ?></div>
							<?php } ?>
						</div>

						<div class="form-group required" data-aos="fade-up">
							<input type="text" name="subject" value="<?= $subject; ?>" id="input-subject" class="form-control" placeholder="<?= $entry_subject; ?>" />
							<?php if ($error_subject) { ?>
							<div class="text-danger"><?= $error_subject; ?></div>
							<?php } ?>
						</div>

						<div class="form-group required" data-aos="fade-up">
							<textarea name="enquiry" rows="4" id="input-enquiry" class="form-control" placeholder="<?= $entry_enquiry; ?>"><?= $enquiry; ?></textarea>
							<?php if ($error_enquiry) { ?>
							<div class="text-danger"><?= $error_enquiry; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="contact-footer text-center" data-aos="fade-up">
						<?= $captcha; ?>
						<input class="btn btn-primary pull-sm-right" type="submit" value="<?= $button_submit; ?>" />
					</div>
				</form>
			</div>
		</div>

</div>
<?= $column_right; ?></div>
<?= $content_bottom; ?>
</div>
<script>
	$(document).ready(function(){
		if($('.text-danger').length){
			var h_height = $('.fixed-header').height();
			$('html, body').animate({ scrollTop: $('.text-danger').offset().top - h_height - 150}, 500);
		}
	});

	const contact_us_form = document.getElementById('contact-us-form');
	const form_submit_handler = async function (e) {
		e.preventDefault();
		const form = e.target;
		const form_action = form.action;
		const form_id = form.id;
		const form_data = new FormData(form);

		let response = await fetch(form_action + "/ajax_submit", {
			method: 'POST',
			body: form_data
		});

		let result;
		try {
			result = await response.json();
		} catch (err) {
			swal({
				title: '<?= $error_title1 ?>',
				html: '<?= $error_text1 ?>',
				type: "error"
			});

			return;
		}

		const form_inputs = form.querySelectorAll('input, textarea');

		if (result.hasOwnProperty('error')) {
			//error-ed out, failed validation or failed sending email.
			form_inputs.forEach(function(item, index){
				var error_field = item.getAttribute('name');
				var error_msg_div_ = document.getElementById(error_field + '_error_div');
				if (result.hasOwnProperty(error_field)) {
					if (error_msg_div_ === null) {
						var error_msg_div = document.createElement('div');
						error_msg_div.id = error_field + '_error_div';
						error_msg_div.classList.add('text-danger');
						error_msg_div.classList.add('error_field');
						error_msg_div.innerText = result[error_field];
						if (error_field === 'g-recaptcha-response') {
							captcha_div = item.parentNode.parentNode;
							captcha_div.insertAdjacentElement('afterend', error_msg_div);
						} else {
							item.insertAdjacentElement('afterend', error_msg_div);
						}
					}
				} else {
					//remove the error field if it has been fixed.
					if (error_msg_div_ !== null) {
						error_msg_div_.remove();
					}
				}
			});
		} else {
			//success
			swal({
				title: 'Success!',
				html: result.message,
				type: "success"
			});

			let all_error_fields = document.querySelectorAll('.error_field');
			all_error_fields.forEach(function(item, index){
				item.remove();
			});

			form_inputs.forEach(function(item, index){
				if (item.getAttribute('type') !== 'submit') {
					item.value = '';
				}
			});

			//FACEBOOK EVENT - CONTACT
			if(result.facebookevent_status){
				if (typeof fbq == 'function') {
					fbq('track', 'Contact');
				}else{
					console.log('Pixel not found');
				}
			}
			//FACEBOOK EVENT - CONTACT END

			//TODO: add google tracking code here
		}
		grecaptcha.reset();
	};

	contact_us_form.addEventListener('submit', form_submit_handler);
</script>
<?= $footer; ?>