<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

class PolicyModelCategories extends JModelList {

    public function __construct($config = array()) {
	
		if (empty($config['filter_fields'])) {
			$config['filter_fields'] = array(
				'category_title',
				'published'
				);
		}
		
		parent::__construct($config);
	}

    public function getItems() {

        $items = parent::getItems();

        foreach ($items as &$item) {
            $item->url = 'index.php?option=com_policy&amp;task=category.edit&amp;category_id=' . $item->category_id;
        }

        return $items;
    }

    public function getListQuery() {

        $query = parent::getListQuery();

        $query->select('*');
        $query->from('#__pp_Category');

        $published = $this->getState('filter.published');

        if ($published == '') {
            $query->where('(published = 1 OR published = 0)');
        } else if ($published !='*') {
            $published = (int) $published;
            $query->where("published = '{$published}'");
        }

        $search = $this->getState('filter.search');

        $db = $this->getDbo();

        if (!empty($search)) {
            $search = '%' . $db->getEscaped($search, true) . '%';

            $field_searches = "(category_title LIKE '{$search}')";

            $query->where($field_searches);
        }
		
		// Column ordring
		$orderCol = $this->getState('list.ordering');
		$orderDirn = $this->getState('list.direction');
		
		if ($orderCol != '') {
			$query->order($db->getEscaped($orderCol.' '.$orderDirn));
		}

        return $query;
    }

    protected function populateState($ordering = null, $direction = null) {

        $search = $this->getUserStateFromRequest($this->context.'.filter.search', 'filter_search');
        $this->setState('filter.search', $search);

        $published = $this->getUserStateFromRequest($this->context.'filter.published', 'filter_published');
        $this->setState('filter.published', $published);

        parent::populateState($ordering, $direction);
    }

}
