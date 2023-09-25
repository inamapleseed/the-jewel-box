<?php 
class ControllerExtensionModuleCustom7 extends controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'Homepage UI',
            'modulename' => 'custom7',
            'fields' => array(
                // array('type' => 'text', 'label' => 'Page Title', 'name' => 'ptitle'),
                // array('type' => 'textarea', 'label' => 'Description', 'name' => 'text', 'ckeditor' =>true),

                array('type' => 'repeater', 'label' => 'Content', 'name' => 'repeater', 'fields' => array(
                    array('type' => 'text', 'label' => 'Title', 'name' => 'ctitle'),
                    array('type' => 'textarea', 'label' => 'Description', 'name' => 'ctext', 'ckeditor' =>true),
                    array('type' => 'image', 'label' => 'Image', 'name' => 'cimage'),
                    array('type' => 'text', 'label' => 'Button name', 'name' => 'btnname'),
                    array('type' => 'text', 'label' => 'URL', 'name' => 'url'),
                )
            )),
        );
        $this->modulehelper->init($array);
	}
}