<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.modeladmin');

class PolicyModelCategory extends JModelAdmin {

    public function getTable($type = 'Category', $prefix = 'PolicyTable', $config = array()) {

        return JTable::getInstance($type, $prefix, $config);

    }

    protected function loadFormData() {
        $data = JFactory::getApplication()->getUserState('com_policy.edit.category.data', array());

        if (empty($data)) {
            $data = $this->getItem();
        }

        return $data;
    }

    public function getForm($data = array(), $loadData = true) {

        $form = $this->loadForm('com_policy.category', 'category', array('control' => 'jform', 'load_data' => $loadData));

        return $form;

    }

}
