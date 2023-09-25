<?php 
class ControllerExtensionModuleAboutUs extends controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'About Us',
            'modulename' => 'aboutus',
            'fields' => array(
                array('type' => 'text', 'label' => 'Page Title', 'name' => 'ptitle'),
                array('type' => 'textarea', 'label' => 'Description', 'name' => 'text', 'ckeditor' =>true),

                array('type' => 'repeater', 'label' => 'Content', 'name' => 'repeater', 'fields' => array(
                    array('type' => 'text', 'label' => 'Title', 'name' => 'ctitle'),
                    array('type' => 'textarea', 'label' => 'Description', 'name' => 'ctext', 'ckeditor' =>true),
                    array('type' => 'image', 'label' => 'Image', 'name' => 'cimage'),
                ))
            ),
        );
        $this->modulehelper->init($array);
	}
}