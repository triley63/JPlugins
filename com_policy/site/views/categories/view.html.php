<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.view');

class PolicyViewcategories extends JView {

    protected $header; // This is for the header
    protected $items; // Returned categories by model

    public function display($tpl = null) {

        $this->header = 'Policy Manual Categories';
        $this->items = $this->get('Items');

        parent::display($tpl);
    }

}
