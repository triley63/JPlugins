<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.view');

class PolicyViewPolicies extends JView {

    protected $header; // This is for the header
    protected $items;  // This is for the list of policies returned by the model
    protected $category_name; // This is the category for the policies retrieved from getCategory()

    public function display($tpl = null) {

        $this->items = $this->get('Items');
        $this->category_name = $this->get('Category');
        $this->header = $this->category_name->category_title .' - Policy Manual';

        parent::display($tpl);
    }

}
