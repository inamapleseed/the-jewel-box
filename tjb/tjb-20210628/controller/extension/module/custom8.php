<?php 
class ControllerExtensionModuleCustom8 extends controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'Memberships',
            'modulename' => 'custom8',
            'fields' => array(
                array('type' => 'text', 'label' => 'Title', 'name' => 'title'),
                // array('type' => 'textarea', 'label' => 'Text Content', 'name' => 'text', 'ckeditor' =>true),

                array('type' => 'repeater', 'label' => 'Content', 'name' => 'repeater', 'fields' => array(
                    array('type' => 'image', 'label' => 'Image', 'name' => 'image'),
                    array('type' => 'text', 'label' => 'Membership Title', 'name' => 'mtitle'),
                )
            )),
        );
        $this->modulehelper->init($array);
	}
}