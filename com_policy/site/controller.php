<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.controller');

class PolicyController extends JController {
	public function save() {
		echo "saving policy...";
	}
	
	public function delete() {
		echo "deleting policy...";
	}
}
