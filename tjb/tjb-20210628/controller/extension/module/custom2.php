<?php 
class ControllerExtensionModuleCustom2 extends controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'Bespoke',
            'modulename' => 'custom2',
            'fields' => array(
                array('type' => 'image', 'label' => 'Image', 'name' => 'image1'),
                array('type' => 'text', 'label' => 'Title', 'name' => 'title1'),
                array('type' => 'textarea', 'label' => 'Description', 'name' => 'text1', 'ckeditor' =>true),

                array('type' => 'text', 'label' => 'Section Title', 'name' => 'stitle'),
                array('type' => 'image', 'label' => 'Center Image', 'name' => 'cimage'),

                array('type' => 'repeater', 'label' => 'Preparation Steps', 'name' => 'steps', 'fields' => array(
                    // array('type' => 'image', 'label' => 'Step Number', 'name' => 'pnumber'),
                    array('type' => 'image', 'label' => 'Step Image', 'name' => 'pimage'),
                    array('type' => 'text', 'label' => 'Step Title', 'name' => 'ptitle'),
                    array('type' => 'textarea', 'label' => 'Step Description', 'name' => 'pdesc', 'ckeditor' =>true),
                )),

                array('type' => 'repeater', 'label' => 'Texts', 'name' => 'texts', 'fields' => array(
                    array('type' => 'text', 'label' => 'Title', 'name' => 'title2'),
                    array('type' => 'textarea', 'label' => 'Description', 'name' => 'desc2', 'ckeditor' =>true),
                ))
            ),
        );
        $this->modulehelper->init($array);
	}
}