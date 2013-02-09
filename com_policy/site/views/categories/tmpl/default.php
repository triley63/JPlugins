<?php
defined('_JEXEC') or die;
?>
<h1><?php echo $this->header ?></h1>

<?php foreach ($this->items as $item): ?>
    <p style="font-weight: bold;">
        <?php $url = 'index.php?option=com_policy&view=policies&id=' . $item->category_id; ?>
        <a href="<?php echo JRoute::_($url); ?>"><?php echo $this->escape($item->category_title) . ' Manual' ?></a>
    </p>
<?php endforeach ?>
