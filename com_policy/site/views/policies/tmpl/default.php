<?php
defined('_JEXEC') or die;
?>
<h1><?php echo $this->header ?></h1>

<p style="font-weight: bold;">
<?php foreach ($this->items as $item): ?>
    <?php $url = 'index.php?option=com_policy&view=policy&id=' . $item->policy_id; ?>
    <ul>
        <li><?php echo '(' . $this->escape($item->policy_number). ') '; ?><a href="<?php echo JRoute::_($url); ?>"><?php echo $this->escape($item->policy_name); ?></a></li>
    </ul>
<?php endforeach ?>
</p>

