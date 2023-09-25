<?php 
class ControllerExtensionModuleCustom3 extends controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'Background Color Customizer',
            'modulename' => 'custom3',
            'fields' => array(
                array('type' => 'text', 'label' => 'Article Page: Latest News', 'name' => 'latestnews'),
                array('type' => 'text', 'label' => 'Bespoke Product Section Background', 'name' => 'bespokeprods'),
                array('type' => 'text', 'label' => 'Bespoke Text Section Background', 'name' => 'bespokebtm'),
                array('type' => 'text', 'label' => 'About Page: Review Pop-up Background', 'name' => 'abtbg'),
             ),
        );
        $this->modulehelper->init($array);
	}
}