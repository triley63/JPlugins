<?php

defined ( '_JEXEC' ) or die;
jimport ( 'joomla.application.component.model' );

class TrainingModelCourse extends JModel
{
    public function getItem()
    {
        $user = JFactory::getUser();
        $trainingID = JRequest::getInt('id');
        
        $db = JFactory::getDBO();
        $query = $db->getQuery(true);
        
        $query->select("t.trainingID, t.name, t.description, ti.active, ts.name AS 'style', tt.description AS 'type'")
                ->from("#__Training_Training AS t")
                ->innerJoin("#__Training_TrainingStyle AS ts ON t.trainingStyleID = ts.trainingStyleID")
                ->innerJoin("#__Training_TrainingType AS tt ON t.trainingTypeID = tt.trainingTypeID")
                ->leftJoin("#__Training_UserTraining AS ut ON t.trainingID = ut.trainingID")
                ->leftJoin("#__Training_TestInstance AS ti ON ut.userTrainingID = ti.userTrainingID")
                ->leftJoin("#__users AS u ON ut.userID = u.id AND u.userName = '" . $user . "'")
                ->where("t.trainingID = " . $trainingID . " AND (t.active = 1 OR t.active IS NULL)")
                ->order("t.trainingID DESC");
        
        $db->setQuery($query,0,1);
        $row = $db->loadObject();
        
        return $row;
    }
}
?>
