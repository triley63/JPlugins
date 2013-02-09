<?php
defined('_JEXEC') or die;
?>
<!-- Display Policy to user -->
<h2><?php echo $this->items[0]->policy_name ?></h2>
<hr />
<p>&nbsp;</p>
<table width="100%">
<?php foreach($this->items as $item): ?>
<!-- Head of policy -->
<tr valign="top">
    <td colspan="2" width="64%"><?php echo $this->params->get('facility_name'); ?></td>
    <td>POLICY #: <?php echo $item->policy_number; ?></td>
</tr>
<tr valign="top">
    <td colspan="2">SUBJECT: <?php echo $item->policy_name; ?>></td>
    <td> APPROVED BY: <?php echo $item->policy_approvedBy; ?>></td>
</tr>
<tr valign="top">
    <td colspan="2" rowspan="3">APPLICABLE DEPARTMENTS: <?php echo $item->policy_groups; ?></td>
    <td>DATE APPROVED: <?php echo $item->policy_dateApproved; ?></td>
</tr>
<tr valign="top">
    <td>DATE REVIEWED: <?php echo $item->policy_dateReviewed; ?></td>
</tr>
<tr valign="top">
    <td>DATE REVISED: <?php echo $item->policy_revisionDates; ?></td>
</tr>
<!-- Body of Policy -->
<tr valign="top">
    <td width="14%">PURPOSE:</td>
    <td colspan="2"><?php echo $item->policy_purpose; ?></td>
</tr>
<tr valign="top">
    <td>POLICY:</td>
    <td colspan="2"><?php echo $item->policy_policyText; ?></td>
</tr>
<tr valign="top">
    <td>RELATED POLICIES:</td>
    <td colspan="2">
        <?php foreach($this->relatedPolicies as $rp):?>
        <?php $url='index.php?option=com_policy&view=policy&id=' . $rp->policy_id; ?>
        <a href="<?php echo JRoute::_($url); ?>"><?php echo $rp->policy_name; ?></a><br />
        <?php endforeach ?>
    </td>
</tr>

<tr valign="top">
    <td>PROCEDURE:</td>
    <td colspan="2"><?php echo $item->procedure_procedure; ?></td>
</tr>

<?php endforeach; ?>
</table>
<h3><a href="<?php echo 'index.php?option=com_policy&amp;view=policies&amp;id=' . $this->items[0]->category_id; ?>">Return to policy list</a></h3>

