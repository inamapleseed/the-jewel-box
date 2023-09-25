<?php
class ControllerExtensionModuleCustom6 extends Controller {
	public function index() {
		// Handle custom6 fields
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'custom6';
	    $this->load->library('modulehelper');
	    $Modulehelper = Modulehelper::get_instance($this->registry);

		$data['title'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'title' );

		$this->load->model('catalog/category');

		$category_info = $this->model_catalog_category->getCategories3();
		$data['categories2'] = $category_info;

		return $this->load->view('extension/module/custom6', $data);
	}
}