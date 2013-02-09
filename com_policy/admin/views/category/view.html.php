<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.view');

class PolicyViewCategory extends JView {

    protected $item;
    protected $form;

    public function display($tpl = null) {
        $this->item = $this->get('Item');
        $this->form = $this->get('Form');

        $this->addToolbar();

        parent::display($tpl);
    }

    public function addToolbar() {
        if ($this->item->category_id) {
            JToolBarHelper::title(JText::_('COM_POLICY_EDIT_CATEGORIES_TITLE'));
        } else {
            JToolBarHelper::title(JText::_('COM_POLICY_ADD_CATEGORIES_TITLE'));
        }

        JToolBarHelper::apply('category.apply', 'JTOOLBAR_APPLY');
        JToolBarHelper::save('category.save', 'JTOOLBAR_SAVE');
        JToolBarHelper::save2new('category.save2new', 'JTOOLBAR_SAVE_AND_NEW');

        JToolBarHelper::cancel('category.cancel');
        }
}
		
