<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.view');

class PolicyViewPolicies extends JView {

    protected $items; // holds the policies retrieved by the model

    public function display($tpl = null) {

        // Get the items (policies) from the model.
        $this->items = $this->get('Items');

        parent::display($tpl);

    }


}
