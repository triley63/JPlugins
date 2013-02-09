<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

class PolicyModelPolicies extends JModelList {

    public function getItems() {

        // Get the items from getListQuery() through parent
        $items = parent::getItems();
        // Create a url that will create an edit link for each policy.
        foreach ($items as &$item) {
            $item->url = 'index.php?option=com_policy&amp;task=policy.edit&amp;policy_id=' . $item->policy_id;
        }

        return $items;

    }

    public function getListQuery() {

    // Get a list of policies by policy_name and category_id
    // Get an empty query object
    $query = parent::getListQuery();

    $query->select('policy_id, policy_name, category_id');
    $query->from('#__pp_Policy');

    return $query;

    }


}
