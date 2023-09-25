<?php
class ControllerExtensionModuleCustom4 extends Controller {
	public function index() {
		// Handle custom4 fields
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'custom4';
	    $this->load->library('modulehelper');
	    $Modulehelper = Modulehelper::get_instance($this->registry);

		$data['text'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'text' );

		$this->load->model('catalog/category');

		$category_info = $this->model_catalog_category->getCategories();
// debug($category_info);
		$data['categories'] = $category_info;
		return $this->load->view('extension/module/custom4', $data);
	}
}