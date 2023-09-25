<?php
class ControllerExtensionModuleCustom3 extends Controller {
	public function index() {
		// Handle custom3 fields
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'custom3';
	    $this->load->library('modulehelper');
	    $Modulehelper = Modulehelper::get_instance($this->registry);

		$data['latestnews'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'latestnews' );
		$data['bespokebtm'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'bespokebtm' );
		$data['bespokeprods'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'bespokeprods' );
		$data['abtbg'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'abtbg' );

		return $this->load->view('extension/module/custom3', $data);
	}
	public function migrate() {
		// Handle custom3 fields
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'custom3';
	    $this->load->library('modulehelper');
	    $Modulehelper = Modulehelper::get_instance($this->registry);

		$data['latestnews'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'latestnews' );
		$data['bespokebtm'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'bespokebtm' );
		$data['bespokeprods'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'bespokeprods' );
		$data['abtbg'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'abtbg' );

		return $data;
	}
}