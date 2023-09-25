<?php
class ControllerExtensionModuleCustom7 extends Controller {
	public function index() {
		// Handle custom7 fields
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'custom7';
	    $this->load->library('modulehelper');
	    $Modulehelper = Modulehelper::get_instance($this->registry);

		// $data['ptitle'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'ptitle' );
		// $data['text'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'text' );
		$data['repeater'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'repeater' );

		return $this->load->view('extension/module/custom7', $data);
	}
}