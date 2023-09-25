<?php 
class ControllerExtensionModuleCustom4 extends controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'Masterpiece Category',
            'modulename' => 'custom4',
            'fields' => array(
            //     array('type' => 'text', 'label' => 'Title', 'name' => 'title'),
            //     array('type' => 'textarea', 'label' => 'Text Content', 'name' => 'text', 'ckeditor' =>true),

            //     array('type' => 'repeater', 'label' => 'Content', 'name' => 'repeater', 'fields' => array(
            //         array('type' => 'image', 'label' => 'Image', 'name' => 'image'),
            //     ))
            )
        );
        $this->modulehelper->init($array);
	}
}