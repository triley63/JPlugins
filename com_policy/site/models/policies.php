<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

class PolicyModelPolicies extends JModelList {

    public function getListQuery() {

        // Get a list of policy names by a specific category.  The category will be on the URL

        $category_id = JRequest::getInt('id');

        $query = parent::getListQuery();

        $query->select('policy_id, policy_name, policy_number');
        $query->from('#__pp_Policy')
              ->where("category_id = '{$category_id}'");

        return $query;
    }

    public function getCategory() {

        $category_id = JRequest::getInt('id');

        $db = $this->getDbo();
        $query = $db->getQuery(true);

        $query->select('category_title');
        $query->from('#__pp_Category');
        $query->where("category_id ='{$category_id}'");

        $db->setQuery($query);

        $row = $db->loadObject();

        return $row;
    }

}
