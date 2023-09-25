<?php
class ControllerExtensionModuleCustom2 extends Controller {
	public function index() {
		// Handle custom2 fields
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'custom2';
	    $this->load->library('modulehelper');
	    $Modulehelper = Modulehelper::get_instance($this->registry);

		$data['image1'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'image1' );
		$data['title1'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'title1' );
		$data['text1'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'text1' );
		$data['stitle'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'stitle' );
		$data['cimage'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'cimage' );
		$data['steps'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'steps' );
		$data['texts'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'texts' );
		$data['bg'] = $this->load->controller('extension/module/custom3/migrate');

		return $this->load->view('extension/module/custom2', $data);
	}
}