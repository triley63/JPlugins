<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.controlleradmin');

class PolicyControllerCategories extends JControllerAdmin {

    protected $text_prefix = 'COM_POLICY_CATEGORIES';

    public function getModel($name = 'Category', $prefix='PolicyModel', $config = array('ignore_request' => true)) {

        $model = parent::getModel($name, $prefix, $config);

        return $model;

    }

}
