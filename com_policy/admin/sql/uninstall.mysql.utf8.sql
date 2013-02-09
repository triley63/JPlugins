/* Drop foreign key constraints */
ALTER TABLE `#__pp_AppliesTo` DROP FOREIGN KEY `pp_AppliesTo_ibfk_1`;
ALTER TABLE `#__pp_AppliesTo` DROP FOREIGN KEY `pp_AppliesTo_ibfk_2`;
ALTER TABLE `#__pp_Policy` DROP FOREIGN KEY `pp_Policy_ibfk_1`;
ALTER TABLE `#__pp_Procedure` DROP FOREIGN KEY `pp_Procedure_ibfk_1`;
ALTER TABLE `#__pp_RelatedPolicies` DROP FOREIGN KEY `pp_RelatedPolicies_ibfk_1`;
ALTER TABLE `#__pp_RelatedPolicies` DROP FOREIGN KEY `pp_RelatedPolicies_ibfk_2`;
ALTER TABLE `#__pp_Revisions` DROP FOREIGN KEY `pp_Revisions_ibfk_1`;

/* Drop Policy Tables */
DROP TABLE `#__pp_AppliesTo`;
DROP TABLE `#__pp_Category`;
DROP TABLE `#__pp_Group`;
DROP TABLE `#__pp_Policy`;
DROP TABLE `#__pp_Procedure`;
DROP TABLE `#__pp_RelatedPolicies`;
DROP TABLE `#__pp_Revisions`;

