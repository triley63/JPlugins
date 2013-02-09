<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.view');

class PolicyViewPolicy extends JView {

    protected $items; // Holds policy returned from getListQuery() in model
    protected $relatedPolicies;  // Holds list of related policies from getRelatedPolicies() in model
    protected $params; // Holds the config parameters of the component.
	
    public function display($tpl=null) {
	
    $this->items = $this->get('Items');
    $this->relatedPolicies = $this->get('RelatedPolicies');
    $this->params = JFactory::getApplication()->getParams();
	
    parent::display($tpl);
	
    }
}
