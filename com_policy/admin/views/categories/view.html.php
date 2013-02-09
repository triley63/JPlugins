<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.view');

class PolicyViewCategories extends JView {

    protected $items;
    protected $pagination;
    protected $state;

    public function display($tpl = null) {

        $this->items = $this->get('Items');
        $this->pagination = $this->get('Pagination');
        $this->state = $this->get('State');

        $this->addToolbar();

        parent::display($tpl);
    }

    public function addToolbar() {

        JToolBarHelper::title(JText::_('COM_POLICY_CATEGORIES_TITLE'));

        JToolBarHelper::addNew('category.add');
        JToolBarHelper::editList('category.edit');

        JToolBarHelper::divider();

        JToolBarHelper::publishList('categories.publish');
        JToolBarHelper::unpublishList('categories.unpublish');

        JToolBarHelper::divider();

        JToolBarHelper::archiveList('categories.archive');
        JToolBarHelper::trash('categoriesy.trash');

        JToolBarHelper::preferences('com_policy');
    }

}
