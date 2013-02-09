<?php
defined('_JEXEC') or die;

class PolicyTableCategory extends JTable {

    public function __construct(&$db) {

        parent::__construct('#__pp_Category', 'category_id', $db);

    }

}
