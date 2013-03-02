<?php

// <editor-fold defaultstate="collapsed" desc="Header Information">
/**
 * This module is used with the Joomla framework and the
 * @see com_training component. This will provide a dynamic
 * menu for the training and examination component.
 * 
 * @copyright Copyright 2013 (c), All Rights Reserved
 * 
 * @category JPlugins
 * @package Training Module Menu (mod_training)
 * 
 * @license http://www.opensource.org/licenses/BSD-3-Clause
 * @version 1.0.0
 * @since 0.0.01
 * 
 * @author Trent Riley <triley63@vpssolutions.com, trentr@threerivershospital>
 * 
 */
// </editor-fold>

defined ( '_JEXEC' ) or die;

//get the current user
$user = JFactory::getUser();

// <editor-fold defaultstate="collapsed" desc="Database Call">
$db = JFactory::getDBO();
$query = $db->getQuery(true);

$query->select("t.trainingID, t.name, t.assignedOnly")
        ->from("#__Training_Training AS t")
        ->leftJoin("#__Training_UserTraining AS ut ON t.trainingID = ut.trainingID")
        ->leftJoin("#__users AS u ON ut.userID = u.id")
        ->where("t.active = 1 OR t.assignedOnly = 0");
        
$db->setQuery($query);
$rows = $db->loadObjectList();
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Set Menu Items">
$assigned = '<ul><h4>Assigned</h4>';
$unassigned = '<hr><h4>Additional Training</h4><ul>';

foreach ($rows as $row):
    if ($row->assignedOnly == "1")
    {
        $url = 'index.php?option=com_training&view=course&id=' . $row->trainingID;
        $assigned .= '<li><a href=' . JRoute::_($url) . '>' . $row->name . '</a>';
    }
    else
    {
        $url = 'index.php?option=com_training&view=course&id=' . $row->trainingID;
        $unassigned .= '<li><a href=' . JRoute::_($url) . '>' . $row->name . '</a>';        
    }
endforeach;

$assigned .= '</ul>';
$unassigned .= '</ul>';
// </editor-fold>

if ($user->guest)
{
    echo 'You must login to see the assigned training';
}
else
{
    echo $assigned;
}

echo $unassigned;
