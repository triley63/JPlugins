<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');
 
//the name of the class must be the name of your component + InstallerScript
//for example: com_contentInstallerScript for com_content.
class com_policyInstallerScript {

    function install( $parent ) {
        echo '<p>Inside the policy.script.php - install().  This is where we would execute the code to create database stuff that the joomla install.mysql.utf8.sql file will not do.</p>';
        // You can have the backend jump directly to the newly installed component configuration page
        // $parent->getParent()->setRedirectURL('index.php?option=com_democompupdate');
    }
}
