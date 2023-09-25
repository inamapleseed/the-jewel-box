<?php 
class ControllerExtensionModuleCustomContact extends controller {
    public function index() {
        $array = array(
            'oc' => $this,
            'heading_title' => 'Enquiry Form',
            'modulename' => 'customcontact',
            'fields' => array(
                array('type' => 'text', 'label' => 'Our Services: Enquiry Form ', 'name' => 'bg'),

                array('type' => 'repeater', 'label' => 'repeater', 'name' => 'repeater', 'fields' => array(
                    array('type' => 'text', 'label' => 'Enquiry Subject', 'name' => 'esubject'),
                )),
            )
        );
        $this->modulehelper->init($array);
    }
}