<?php

defined( '_JEXEC' ) or die;

class TrainingTableCourse extends JTable
{
    public function __construct(&$db)
    {
        parent::__construct('#__Training_Training', 'trainingID', $db);
    }
}
?>
