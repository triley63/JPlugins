<?php

defined ( '_JEXEC' ) or die;

$db = JFactory::getDBO();

$query = $db->getQuery(true);
$query->select('trainingID, name')
        ->from('#__Training_Training')
        ->where ('active = 1');

$db->setQuery($query);
$rows = $db->loadObjectList();

?>

<?php
    if (empty($rows))
    {
        echo "Topics will go here";
    }
    else
    {
?>
    <ul>
    <?php foreach ($rows as $row): ?>
        <li>
            <?php $url = 'index.php?option=com_training&view=course&id=' . $row->trainingID; ?>
            <a href="<?php echo JRoute::_($url); ?>"><?php echo $row->name; ?></a>
        </li>
    <?php endforeach; ?>
    </ul>
<?php }?>