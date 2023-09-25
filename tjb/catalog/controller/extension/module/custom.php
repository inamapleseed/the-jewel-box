<?php
class ControllerExtensionModuleCustom extends Controller {
	public function index() {
		// Handle custom fields
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'custom';
	    $this->load->library('modulehelper');
	    $Modulehelper = Modulehelper::get_instance($this->registry);

        $this->load->model('extension/module/testimonial');

        $results = $this->model_extension_module_testimonial->getModuleReviews();

        foreach ($results as $result) {
            $data['reviews'][] = array(
                'review_id' => $result['review_id'],
                'text' => $result['text'],
                'author' => $result['author'],
                'title' => $result['title'],
                'image' => $result['image'],
                'date' => $result['date_added'],
            );
        }

		return $this->load->view('extension/module/custom', $data);
	}
}