<?php

defined ( '_JEXEC' ) or die;

jimport( 'joomla.application.component.view' );
jimport( 'joomla.application.module.helper' );

class TrainingViewSlides extends JView
{

    public function display($tpl = null)
    {
        parent::display($tpl);

        //add the exam module
        $module = JModuleHelper::getModule('mod_exam','Exam Module');
        echo JModuleHelper::renderModule($module);
        
    }
}

?>
