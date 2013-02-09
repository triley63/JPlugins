<?php defined('_JEXEC') or die; ?>
<form action="index.php?option=com_policy&amp;view=policies" method="post" name="adminForm" id="adminForm">
    <table class="adminlist">
        <thead>
            <tr>
                <th width="1%"><input type="checkbox" name="checkall-toggle" value="" onclick="checkAll(this)" /></th>
                <th><?php echo JText::_('COM_POLICY_FIELD_POLICY_NAME_LABEL') ?></th>
                <th><?php echo JText::_('COM_POLICY_FIELD_CATEGORY_ID_LABEL') ?></th>
                <!-- <th><?php echo JText::_('JSTATUS') ?></th> -->
            </tr>
        </thead>
        <tbody>
            <?php foreach ($this->items as $i => $item): ?>
                <tr class="row<?php echo $i % 2 ?>">
                    <td class="center"><?php echo JHtml::_('grid.id', $i, $item->policy_id); ?></td>
                    <td><a href="<?php echo $item->url; ?>"><?php echo $this->escape($item->policy_name) ?></a></td>
                    <td><?php echo $item->category_id; ?></td>
                    <!-- <td class="center"><?php echo JHtml::_('jgrid.published', $item->published, $i, 'policies.', true, 'cb'); ?></td> -->
                </tr>
            <?php endforeach ?>
        </tbody>
    </table>
</form>
