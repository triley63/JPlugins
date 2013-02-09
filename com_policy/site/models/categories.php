<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

class PolicyModelCategories extends JModelList {

    public function getListQuery() {

    /* We need a list of categories from the #__pp_Category table.  The index of the category
     * will be used to generate a list of policies that are available in that particualar
     * category.  The problem is that every category listed does not have policies associated
     * with it.  So I need to figure out the following.
     *
     * 1) Either generate a list of only those categories that have policies asscociated with them
     *    prepending any category parent to the category(ies) name. (or)
     * 2) Cycle through each category to determine if it has policies associated with it and just
     *    display that category.
     */

    // Get an empty query object
    $query = parent::getListQuery();

    // Select only those categories that have policies attached to them.
    $query->select('DISTINCT c.category_id, c.category_title');
    $query->from('#__pp_Category AS c')
          ->join('', '#__pp_Policy AS p ON c.category_id = p.category_id');
          //->where('p.category_id IS NOT NULL');

    return $query;
    }

}
