<?php
class ControllerExtensionModuleCustom8 extends Controller {
	public function index() {
		// Handle custom8 fields
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'custom8';
	    $this->load->library('modulehelper');
	    $Modulehelper = Modulehelper::get_instance($this->registry);

		$data['title'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'title' );
		$data['repeater'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'repeater' );

		return $this->load->view('extension/module/custom8', $data);
	}
}