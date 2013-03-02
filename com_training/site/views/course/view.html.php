<?php

defined ( '_JEXEC' ) or die;
jimport ( 'joomla.application.component.view' );


class TrainingViewCourse extends JView
{
    protected $item;
    
    public function display($tpl = null)
    {
        $this->item = $this->get('Item');

        if (empty($this->item->trainingID))
        {
            $this->item->trainingID = 0;
            $this->item->name = "TRH Training";
            $this->item->description = "Please select the training from the from the Training and Exam menu!";
        }
        parent::display($tpl);
    }
}
?>
