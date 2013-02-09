<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

class PolicyModelPolicy extends JModelList {

    public function getListQuery() {
	
	/*  This function will return all information from a policy with the exception
	 *  of the related policies.  They will be returned with a separate function.
	 *  The policy returned will be the policy_id on the URL request sent from the
	 *  policies view.
	 */
	
	// Get the policy_id from the URL request
	$policy_id = JRequest::getInt('id');
	
	// Get an empty query string
	$query = parent::getListQuery();
	
	// Build query string to retrieve policy from database matching the passed id.
	$query->select("po.policy_id,
	                po.policy_name,
					po.policy_number,
					po.policy_approvedBy,
					po.policy_dateApproved,
					po.policy_dateReviewed,
					po.policy_purpose,
					po.policy_policyText,
					po.category_id,
					pr.procedure_procedure,
					GROUP_CONCAT(g.group_name ORDER BY group_name DESC SEPARATOR ', ') AS 'policy_groups',
					GROUP_CONCAT(rv.policyRevision_date ORDER by policyRevision_date ASC SEPARATOR ', ') AS 'policy_revisionDates'");
	$query->from('#__pp_Policy AS po');
	$query->join('INNER','#__pp_Procedure AS pr ON po.policy_id = pr.policy_id');
	$query->join('INNER','#__pp_AppliesTo AS a ON po.policy_id = a.policy_id');
	$query->join('INNER','#__pp_Group AS g ON a.group_id = g.group_id');
	$query->join('LEFT','#__pp_Revisions AS rv ON po.policy_id = rv.policy_id');
	$query->where("po.policy_id='{$policy_id}'");
	
	// Send the query back to the caller.
    return $query;
	}
	
	public function getRelatedPolicies() {
	
	/* When a policy is retrieved there are also other policies that the policy refers to.
	 * this function will retrieve a list of those policies names and id.
	 */
	
	// Get the policy_id from the URL request
	$policy_id = JRequest::getInt('id');
	
	// Get a database object
	$db = $this->getDbo();
	
	// Get an empty query object
	$query = $db->getQuery(true);
	
	// Build a query to get all the policies that are referred to in the policy passed on the request URL
	$query->select('pl.policy_id, pl.policy_name');
    $query->from('#__pp_Policy AS p');
	$query->join('LEFT', '#__pp_RelatedPolicies AS re ON p.policy_id = re.policy_id');
	$query->join('INNER', '#__pp_Policy AS pl ON pl.policy_id = re.relatedPolicy_id');
	$query->where("p.policy_id='{$policy_id}'");

	$db->setQuery($query);
	$rows = $db->loadObjectList();
	
	return $rows;
	
	}
}
/* This will retrieve a policy by policy_id

SELECT
       po.policy_id,
       po.policy_name,
       po.policy_number,
       po.policy_approvedBy,
       po.policy_dateApproved,
       po.policy_dateReviewed,
       po.policy_purpose,
       po.policy_policyText,
       po.category_id,
       GROUP_CONCAT(g.group_name ORDER BY group_name DESC SEPARATOR ', ') AS 'policy_groups',
       pr.procedure_procedure,
       GROUP_CONCAT(rv.policyRevision_date ORDER by policyRevision_date ASC SEPARATOR ', ') AS 'policy_revisionDates',
       GROUP_CONCAT(pl.policy_name Order by pl.policy_name ASC SEPARATOR ', ') as 'policy_relatedPolicies'

FROM jos_pp_Policy AS po
JOIN jos_pp_AppliesTo as a ON po.policy_id = a.policy_id
JOIN jos_pp_Group AS g ON a.group_id = g.group_id
JOIN jos_pp_Procedure AS pr ON po.policy_id = pr.policy_id
LEFT JOIN jos_pp_Revisions AS rv ON po.policy_id = rv.policy_id
LEFT JOIN jos_pp_RelatedPolicies AS re ON po.policy_id = re.policy_id
JOIN jos_pp_Policy AS pl ON pl.policy_id = re.relatedPolicy_id
WHERE po.policy_id=3

*/
