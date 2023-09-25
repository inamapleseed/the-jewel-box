<?php
class ControllerExtensionModuleCustomContact extends Controller {

	private $error = array();

	private $posts = array(
		'name2'		=>	'',
		'subject2'	=>	'',
		'email2'		=>	'',
		'telephone2'	=>	'',
		'enquiry2'	=>	''	// This will always be the last and large box
	);


  // Add your post value to ignore in the email body content
	private $disallow_in_message_body = array(
		'var_abc_name'
	);

	public function __constructor(){
		$this->posts['name']		= $this->customer->getFirstName() . ' ' . $this->customer->getLastName();
		$this->posts['email']		= $this->customer->getEmail();
		$this->posts['telephone']	= $this->customer->getTelephone();
	}

	public function index($setting) {

		$this->load->language('extension/module/customcontact');
		$this->load->library('modulehelper');
		$modulehelper = Modulehelper::get_instance($this->registry);
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename = "customcontact";

		$this->load->model('tool/image');

		$server = $this->config->get('config_url');

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		}

		$data['urlServer'] = $server;
		$data['button_submit'] = $this->language->get('button_submit');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
      //$mail->setFrom($this->request->post['email']);
			$mail->setFrom($this->config->get('config_email'));

			$mail->setSender(html_entity_decode($this->request->post['name2'], ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject2'), $this->request->post['subject2']), ENT_QUOTES, 'UTF-8'));

			$message = "";

			foreach ($this->posts as $post_var => $post_default_value){
				if( !in_array($post_var, $this->disallow_in_message_body) ){
					$message .= $this->language->get('entry_' .$post_var) . ":\n";
          //$message .= $this->request->post[$post_var]??"";
					$message .= $this->request->post[$post_var] ? $this->request->post[$post_var] : "";
					$message .= "\n\n";
				}
			}
			$mail->setText($message);
			$mail->send();

			$this->response->redirect($this->url->link('information/contact/success'));
		}

		$data['action'] = $this->url->link('gallery/album', '', true);

		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
			$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
		}

		foreach ($this->posts as $post_var => $post_default_value){
			$data[$post_var] = $post_default_value;
			$data['error_' . $post_var] = '';

	      // Label Value
			$data['entry_' . $post_var] = $this->language->get('entry_' . $post_var);

	      // Post Value
			if( isset($this->request->post[$post_var]) ) {
				$data[$post_var] = $this->request->post[$post_var];
			}

	      // Error Value
			if( isset($this->error[$post_var]) ) {
				$data['error_' . $post_var] = $this->error[$post_var];
			}
		}

		$data['repeater'] = $modulehelper->get_field($oc, $modulename, $language_id, 'repeater');
		$data['bg'] = $modulehelper->get_field($oc, $modulename, $language_id, 'bg');

		return $this->load->view('extension/module/customcontact', $data);
	}

	protected function validate() {
			if ((utf8_strlen($this->request->post['name2']) < 3) || (utf8_strlen($this->request->post['name2']) > 32)) {
				$this->error['name2'] = $this->language->get('error_name2');
			}

			if ((int)$this->request->post['telephone2'] < 1) {
				$this->error['telephone2'] = $this->language->get('error_telephone2');
			}
			
			if (!filter_var($this->request->post['email2'], FILTER_VALIDATE_EMAIL)) {
				$this->error['email2'] = $this->language->get('error_email2');
			}
			
			if ((utf8_strlen($this->request->post['enquiry2']) < 10) || (utf8_strlen($this->request->post['enquiry2']) > 3000)) {
				$this->error['enquiry2'] = $this->language->get('error_enquiry2');
			}
			
			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');
				
				if ($captcha) {
					$this->error['captcha'] = $captcha;
				}
			}
			

		return !$this->error;
	}

	public function success() {

		$facebook_pixel_event_params_FAE = array(
			'event_name' => 'Lead');
      // stores the pixel params in the session
		$this->request->post['facebook_pixel_event_params_FAE'] =
		addslashes(json_encode($facebook_pixel_event_params_FAE));

		$this->load->language('extension/module/customcontact');


		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('common/home')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_message'] = $this->language->get('text_success');

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data = $this->load->controller('component/common', $data);

		$this->response->setOutput($this->load->view('common/success', $data));
	}
}
