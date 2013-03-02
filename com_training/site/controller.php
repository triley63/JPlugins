<?php

defined ( '_JEXEC' ) or die;

jimport( 'joomla.application.component.controller' );

class TrainingController extends JController
{
    public function Save()
    {
        echo "I'm saving something ...";
    }
    
    public function Delete()
    {
        echo "I'm deleting something";
    }
}

?>
