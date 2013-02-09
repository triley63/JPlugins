/* Create tables for Policy and Procedure Database.  */

CREATE TABLE `#__pp_AppliesTo` (
  `appliesTo_id` int(11) NOT NULL AUTO_INCREMENT,
  `policy_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`appliesTo_id`),
  KEY `policy_id` (`policy_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

CREATE TABLE `#__pp_Category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_title` varchar(50) NOT NULL,
  `published` tinyint(4) DEFAULT NULL,
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_date` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

CREATE TABLE `#__pp_Group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(40) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

CREATE TABLE `#__pp_Policy` (
  `policy_id` int(11) NOT NULL AUTO_INCREMENT,
  `policy_name` varchar(255) NOT NULL,
  `policy_number` varchar(25) NOT NULL,
  `policy_approvedBy` varchar(75) NOT NULL,
  `policy_dateApproved` date NOT NULL,
  `policy_dateReviewed` date DEFAULT NULL,
  `policy_purpose` text NOT NULL,
  `policy_policyText` text NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`policy_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

CREATE TABLE `#__pp_Procedure` (
  `procedure_id` int(11) NOT NULL AUTO_INCREMENT,
  `policy_id` int(11) NOT NULL,
  `procedure_procedure` text NOT NULL,
  PRIMARY KEY (`procedure_id`),
  KEY `policy_id` (`policy_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

CREATE TABLE `#__pp_RelatedPolicies` (
  `relatedPolicies_id` int(11) NOT NULL AUTO_INCREMENT,
  `policy_id` int(11) NOT NULL,
  `relatedPolicy_id` int(11) NOT NULL,
  PRIMARY KEY (`relatedPolicies_id`),
  KEY `policy_id` (`policy_id`),
  KEY `relatedPolicy_id` (`relatedPolicy_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

CREATE TABLE `#__pp_Revisions` (
  `revisions_id` int(11) NOT NULL AUTO_INCREMENT,
  `policy_id` int(11) NOT NULL,
  `policyRevision_date` date NOT NULL,
  PRIMARY KEY (`revisions_id`),
  KEY `policy_id` (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/* Dump data into tables */

INSERT INTO `#__pp_AppliesTo` (`appliesTo_id`, `policy_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 1),
(9, 2, 2),
(10, 2, 3),
(11, 2, 4),
(12, 2, 5),
(13, 2, 6),
(14, 2, 7),
(15, 3, 8),
(16, 3, 4),
(17, 3, 9),
(18, 3, 10),
(19, 3, 7),
(20, 3, 11),
(21, 4, 8),
(22, 4, 12);

INSERT INTO `#__pp_Category` (`category_id`, `category_title`, `published`, `checked_out`, `checked_out_date`) VALUES
(1, 'Human Resources', 0, 0, '0000-00-00 00:00:00'),
(2, 'HIPAA Privacy', 0, 0, '0000-00-00 00:00:00'),
(3, 'HIPAA Security', 0, 0, '0000-00-00 00:00:00');

INSERT INTO `#__pp_Group` (`group_id`, `group_name`) VALUES
(1, 'Admitting'),
(2, 'Outpatient Registration'),
(3, 'Emergency Department Registration'),
(4, 'Nursing'),
(5, 'Ancillary Outpatient Departments'),
(6, 'Pharmacy'),
(7, 'Medical Staff'),
(8, 'Medical Records'),
(9, 'Laboratory'),
(10, 'Radiology'),
(11, 'Infection Control'),
(12, 'Business Office');

INSERT INTO `#__pp_Policy` (`policy_id`, `policy_name`, `policy_number`, `policy_approvedBy`, `policy_dateApproved`, `policy_dateReviewed`, `policy_purpose`, `policy_policyText`, `category_id`) VALUES
(1, 'Notice of Privacy Practices', '1', 'Medical Staff (03/20/03) Board of Trustees (04/10/2003)', '2003-04-10', '2003-01-20', 'To describe the circumstances under which the Hospital’s patients must be provided with a notice of privacy practices. ', 'It is the Hospital’s policy to provide patients with a notice that describes the Hospital’s privacy practices, and to obtain the patient’s acknowledgment of receipt of the notice, in accordance with state and federal law.', 2),
(2, 'Personal Representatives and Authority to Exercise Privacy Rights', '2', 'Medical Staff (03/20/03)  Board of Trustees (04/10/2003)', '2003-04-10', '2009-01-29', 'To describe the persons who have authority to exercise the patient’s privacy rights and to serve as the patient’s personal representative.', 'It is the policy of the Hospital to allow patients, individually or through their personal representatives, to exercise their privacy rights to extent allowed by law. The privacy rights subject to this policy are the following:\r\nThe right to receive a notice of the Hospital’s privacy practices\r\nThe right to inspect and obtain copies of the patient’s health records\r\nThe right to amend the patient’s health record\r\nThe right to obtain an accounting of disclosures\r\nThe right to request restrictions on uses and disclosures\r\nThe right to receive confidential communications', 2),
(3, 'Accountings of Disclosures', '5', 'Medical Staff (3/20/03) Board of Trustees (4/10/03)', '2003-04-10', '2009-01-20', 'To describe the measures to be followed when a patient or the patient’s personal representative asks for an accounting of disclosures of protected health information.', 'It is the policy of the Hospital to maintain an accounting of certain disclosures of the patient’s health information and to provide the accounting, upon request, to the patient or the patient’s authorized personal representative.', 2),
(4, 'Request for Restrictions on Disclosures', '6', 'Board of Trustees 04/10/2003)', '2003-04-10', '2009-01-29', 'To describe the measures to be followed when a patient or the patient’s authorized personal representative requests restrictions on the use or disclosure of the patient’s protected health information.', 'It is the policy of the Hospital to allow patients or their personal representatives to request restrictions on the use or disclosure of the patient’s health information while at the same time assuring that such restrictions do not impair the Hospital’s ability to provide appropriate care.', 2);

INSERT INTO `#__pp_Procedure` (`procedure_id`, `policy_id`, `procedure_procedure`) VALUES
(1, 1, '1.	Responsibility for Notices and Acknowledgments. [The Admissions Department] is responsible for (a) providing patients with the form entitled “Notice of Privacy Practices,” a copy of which is attached to this policy, (b) obtaining written acknowledgment of receipt, and (c) answering routine questions about the Notice.\r\n\r\nIn non-routine situations, such as when the patient raises difficult questions or concerns about the Notice or refuses to sign an acknowledgment of receipt, [the Privacy Officer] will be responsible for discussing the Notice with the patient and obtaining written acknowledgment of receipt.\r\n\r\n2.	Initial Visit.  The first time any patient receives treatment from the Hospital on or after April 14, 2003, the patient must be provided with the attached form entitled “Notice of Privacy Practices,” and asked to sign an acknowledgment of receipt. The attached form entitled “Acknowledgement of Receipt of Privacy Notice” may be used for this purpose, or the patient’s acknowledgement may be obtained by including it as part of the Hospital’s standard registration form. \r\nA.	If the patient is not able to receive and acknowledge the Notice, the Notice should be provided to and acknowledged by the patient’s personal representative. (For further information on personal representatives, see separate policy entitled “Personal Representatives and Authority to Exercise Privacy Rights.”)  References to the “patient” in this policy also refer to the patient’s personal representative.\r\nIf the person’s signature cannot be obtained, document the Hospital’s good faith attempt to obtain the acknowledgment and the reasons why it could not be obtained.\r\nB.	It is not necessary to give the Notice to inmates who are brought to the Hospital in the custody of correctional officers.\r\nC.	In an emergency, it is not necessary to provide the Notice or obtain acknowledgment until after the emergency has been resolved.  The Privacy Officer or his or her designee is responsible for following up to obtain an acknowledgment.\r\n3.	Additional Notices \r\nA.	The Notice may, but does not have to, be provided to the patient at subsequent visits.  (NOTE: Unless the Hospital has a procedure for keeping track of whether a Notice has already been provided to the patient, it is recommended that the Notice be provided at each admission or visit.)\r\nB.	A copy of the Notice must be posted prominently in the reception or admissions area, waiting areas, and billing office where it can easily be read. \r\nC.	Printed copies of the Notice must be made available to any person (whether or not a patient) who requests a copy.\r\nD.	Copies of the Notice may be provided electronically as long as the patient is advised that he or she may request a written copy as well.\r\n4.	Revisions to Notice.  Any changes to the Notice must be approved by the Privacy Officer and the Hospital’s legal counsel to assure that the revised Notice contains all required elements and accurately reflects federal and state law.\r\nA.	The Notice must be revised before the Hospital may change its privacy practices in any way inconsistent with the current description.\r\nB.	The Notice must be revised as necessary to reflect changes in state or federal privacy requirements.\r\nC.	The effective date of the new Notice must be printed on the Notice.  The effective date may not be made retroactive.\r\nD.	Any time the Notice is revised, the revised copy must be posted prominently and printed copies must be made available upon request.\r\n5.	Medical Staff.  Because the attached form of Notice covers Medical Staff members as well as the Hospital, Medical Staff members are not required to provide hospitalized patients with a separate notice. (For further information, see Hospital’s separate policy entitled “Medical Staff Uses and Disclosures.”)  Medical Staff members are, however, required to provide their own notice to patients treated in their private practices.\r\n6.	Documentation.  This version of the policy and Notice, together with all other documentation created or obtained in accordance with the policy, shall be retained by the Hospital for at least six years from the date of last use.'),
(2, 2, '1.	Responsibility for Determining Authority.  Routine decisions regarding the identity and authority of a personal representative shall be made by the person or department responsible for responding to the request to exercise the patient’s privacy rights, as described in the Hospital’s separate policies regarding such rights.\r\nNon-routine decisions, such as those involving persons who do not have appropriate identification or documentation of their authority or relationship to the patient, shall be made by the Privacy Officer. \r\n2.	Persons With Authority.  Competent adult patients and certain minor patients have authority to exercise their rights regarding the use or disclosure of Protected Health Information. In addition, other persons described in this policy may serve as the patient’s personal representative with authority to exercise, on the patient’s behalf, the patient’s privacy rights.\r\n3.	Adult Patients. For adult patients (age 18 or older), only the following persons have authority to exercise the patient’s privacy rights:\r\nA.	The patient himself, if competent.\r\n\r\nB.	A person who has been appointed by the patient under a valid durable power of attorney for health care decisions, in accordance with Tenn. Code Ann. § 34-6-201 et seq. or under any other valid power of attorney to the extent that the document describes such rights.  (Check with legal counsel if uncertain about the scope or validity of the power of attorney.)\r\n\r\nC.	The patient’s court-appointed guardian, conservator, or administrator.\r\n\r\nD.	The executor or administrator of a deceased patient’s estate.\r\n\r\nE.	The patient’s spouse or relatives only if they have been given power of attorney or validly appointed as the patient’s guardian, conservator, administrator, or executor.  (Note, however, that information may be shared with the patient’s spouse, family, and friends if they are involved in the patient’s care, as described in the Hospital’s separate policy entitled “Disclosures to Family, Friends, and Caregivers.”) \r\n4.	Minor Patients. For minor patients (under 18 years of age), only the following persons have authority to exercise the patient’s privacy rights:\r\n\r\nA.	The minor patient himself if the minor actually sought and consented to the treatment without parental involvement, and either: \r\n\r\n(1)	The minor is at least 14 years old and, in the professional judgment of a health professional on the Hospital’s medical staff, is sufficiently mature1  to make treatment decisions without parental involvement; or \r\n\r\n(2)	State law allows the minor to obtain such treatment without parental consent.  In Tennessee, minors have the right to consent to: \r\nContraceptives and/or prenatal care\r\nCare related to sexually transmitted diseases (including HIV/AIDS)\r\nSubstance abuse treatment\r\n\r\nB.	The minor patient’s court-appointed guardian, conservator, or administrator. \r\nC.	The minor patient’s parents, but not with respect to health information involving services obtained by the minor patient without parental involvement, as described in Section 4.A above.\r\n(NOTE:  Even if the parents do not have authority to exercise the minor’s privacy rights, the Hospital may nevertheless be allowed to share the minor’s medical records with the minor’s parents in accordance with the separate policy entitled “Disclosures of Minor’s Records to Parents” or in accordance with the separate policy entitled “Disclosures to Family, Friends, and Caregivers.”)\r\nD.	The executor or administrator of a deceased minor patient’s estate.\r\n5.	Verification of Identity and Authority.  If the person is not known to the Hospital, the person’s identity and authority must be verified and documented before the person may exercise any of the patient’s privacy rights. The forms attached to each of the Hospital’s policies on patient privacy rights include space for documenting such verification. \r\n\r\nA.	The patient’s confirmation of a personal representative’s identity and authority is adequate verification. The confirmation must be documented in the patient’s record.\r\nB.	Other acceptable verification of identity includes the following:\r\nDriver’s license\r\nBirth certificate\r\nPassport\r\nSocial Security card\r\nPhoto ID (with another piece of verification if possible)\r\nAny other verification deemed reasonable by the Privacy Officer\r\nC.	Acceptable verification of relationship or legal authority includes relevant official documents, including birth certificates, marriage certificates, passports, guardianship papers, attorney-in-fact appointment papers, or similar official certification.\r\n\r\nD.	If any doubts exist regarding the person’s identity or authority, Hospital personnel may contact the patient to confirm the person’s relationship, or consult with the Privacy Officer.\r\n6.	Documentation.  This version of the policy, together with any forms and other documentation obtained in accordance with the policy, shall be retained for a minimum of six years from the date of last use.'),
(3, 3, '1.	Responsibility for Requests for Accountings.  Routine requests should be routed to the Medical Record Department. \r\nNon-routine requests, such as requests for accountings that may involve disclosures to law enforcement agencies or investigators, shall be routed to the Medical Record Department. \r\n2.	Authorized Requesters.  Only the patient or his authorized personal representative may request an accounting of disclosures. If the requester is not known to the Hospital, verify and document the person’s identity and authority in accordance with the Hospital’s separate policy entitled “Personal Representatives and Authority to Exercise Privacy Rights.” References to the “patient” in this policy also refer to the patient’s personal representative.\r\n3.	Written Request.  The request must be in writing, signed, and dated. Give the patient the form entitled “Request for Accounting of Disclosures,” a copy of which is attached to this policy. \r\n4.	Deadlines and Notification.  The accounting must be provided to the patient within 60 days following receipt of the request.\r\nA.	The Privacy Officer may, for good reason only, extend the deadline by no more than 30 additional days, in which case written notice must be sent to the patient prior to the end of the 60 days explaining the reasons for the delay and the date by which the accounting will be provided. \r\nB.	If any of the Hospital’s business associates are allowed to disclose the patient’s health information for purposes other than treatment, payment, or the Hospital’s operations, immediately notify such business associates to provide the Hospital with an accounting of disclosures within 10 working days.\r\n5.	Provision of Accounting.  The accounting of disclosures (including disclosures by the Hospital’s business associates) may be provided by giving the patient a copy of his or her completed form entitled “Log for Accounting of Disclosures,” a copy of which is attached to this policy. In the alternative, the patient may be given a listing of disclosures that includes all of the following information:\r\nThe date of the disclosure\r\nThe name and address of the entity or person who received the information\r\nA brief description of the information disclosed\r\nA brief statement of the purpose of the disclosure\r\n\r\nConsult with the Privacy Office if the accounting involves disclosures related to research or if the disclosure is made on a recurring basis, in which case a more simplified accounting may be provided.\r\n\r\n6.	Scope of Accounting.  \r\nA.	Disclosures Other Than for Treatment, Payment, or Operations. The accounting must include all disclosures made for purposes other than for treatment, payment, the Hospital’s internal operations, or for which the patient has given written authorization. Other exceptions are described in Exhibit A, attached to this policy.\r\nB.	Length of Time Covered by Accounting.  The accounting need not include disclosures made prior to the period specified by the patient or, if later, April 14, 2003. The accounting need not include disclosures made more than 6 years prior to the patient’s request.\r\n7.	Requests to Limit the Accounting During an Investigation. During an investigation, law enforcement officials or health oversight agencies may request that the Hospital suspend providing the patient with an accounting of disclosures made to those agencies. In that case, the Privacy Officer shall provide the agency with the form entitled “Letter Regarding Accounting of Disclosures,” a copy of which is attached to this policy, and may grant the request upon certification by the agency that disclosure is reasonably likely to impede the agency’s activities. \r\nDuring the investigation, the Hospital must continue logging disclosures to the agency but shall redact that information from any accountings provided to the patient.  Once the investigation is completed, the disclosures must be included in any accountings provided to the patient.\r\n8.	Charges.  There shall be no charge for the first accounting.  A charge of $20.00 may be required for any additional accountings requested within a 12-month period.\r\n9.	Maintaining the Accounting of Disclosures.  \r\nA.	It is not necessary to maintain an accounting of disclosures for treatment, payment, or Hospital’s internal operations, nor is it necessary to account for disclosures made by the Hospital to its business associates for such purposes. The accounting does not have to include disclosures made to the patient or the patient’s personal representative, or disclosures for which the patient has given written authorization.  Other exceptions are listed on Exhibit A.\r\nB.	The Medical Record Department shall be primarily responsible for maintaining and coordinating the patient’s Log for Accounting of Disclosures. All persons who make a loggable disclosure must notify that Department of the disclosure within 24 hours, so the disclosure can be logged promptly. The Log may be maintained electronically or on paper.\r\n10.	Documentation.  This version of the policy, together with any forms and other documentation obtained in accordance with the policy, shall be retained for a minimum of six years from the date of last use.\r\n'),
(4, 4, '1.	Responsibility for Requests for Restrictions.  Routine requests should be routed to the Medical Record Department.\r\nNon-routine requests, such as requests to restrict use or disclosure for treatment or health care operations, shall be routed to the Privacy Officer for a determination as to whether to grant or deny the request. \r\n2.	Authorized Requesters.  Only the patient or his authorized personal representative may request a restriction. If the person is not known to the Hospital, verify and document the person’s identity and authority in accordance with the Hospital’s separate policy entitled “Personal Representatives and Authority to Exercise Privacy Rights.” References to the “patient” in this policy also refer to the patient’s personal representative.\r\n3.	Written Request.  The request must be in writing, signed, and dated. Give the patient the form entitled “Request for Restrictions on Use or Disclosure,” a copy of which is attached to this policy. \r\n\r\n4.	Not Required to Grant Request.  The Hospital is not required to grant a request for a restriction.  Requests for restrictions will be granted only as follows:\r\nA.	It is the Hospital’s policy not to grant requests to restrict uses or disclosures for treatment or for the Hospital’s health care operations.1  Any exceptions must be approved by the Privacy Officer.  (For further information on health care operations, see Hospital’s separate policy entitled “Uses and Disclosures for Health Care Operations.”)\r\nB.	A request to restrict use or disclosure for payment purposes may be granted only if conditioned upon payment in full by the patient. The patient must agree that if he or she does not pay in a timely manner, the Hospital is entitled to use or disclose the information as needed to obtain payment. Any exceptions must be approved by the Privacy Officer.\r\nC.	The Hospital will not grant requests to restrict disclosures that are required by law or any regulations, or required for public health or law enforcement purposes.\r\n5.	Notice to Patient.  Written notice should be provided to the patient within ten days advising whether the request for restrictions is accepted or denied, using the form entitled “Action on Request to Restrict Use and Disclosure of Information,” a copy of which is attached to this policy.\r\n6.	Acceptance of Restriction.  If the request for restrictions is accepted, the following actions must be taken immediately:\r\nA.	Mark all relevant portions of the patient’s health records, including the billing record, clearly identifying the restricted information and the persons or entities who may not use or receive the information.\r\nB.	Notify any of the Hospital’s business associates who may need to be aware of the restrictions in order to avoid improper use or disclosure.\r\n7.	Emergency Situations.  In an emergency, the information may be used or disclosed in order to provide appropriate treatment to the patient.  The recipients of the information must be requested to refrain from any further use or disclosure of the restricted information. Documentation must be included in the patient’s record showing the persons to whom the information was disclosed (or the reason why their names or identities could not be established), the name of the person who disclosed the information, and the fact that the recipients were requested not to further use or disclose the restricted information.\r\n8.	Termination of Restrictions. The restriction may be terminated only under the following circumstances:\r\nA.	The patient agrees, either orally or in writing, to the termination of the restriction, and this agreement is documented in the patient’s record; or\r\nB.	The Hospital sends the patient written notice advising that it is terminating its agreement to the restriction, effective as of the date of the notice.  The restrictions will continue to apply to information obtained by the Hospital prior to the date of the notice.\r\n9.	Documentation.  This version of the policy, together with any forms and other documentation obtained in accordance with the policy, shall be retained for at least six years from the date of last use.');

INSERT INTO `#__pp_RelatedPolicies` (`relatedPolicies_id`, `policy_id`, `relatedPolicy_id`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 2),
(4, 2, 3),
(5, 4, 1),
(6, 2, 4);

/* Create Foreign Keys */

ALTER TABLE `#__pp_AppliesTo`
  ADD CONSTRAINT `pp_AppliesTo_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `#__pp_Policy` (`policy_id`),
  ADD CONSTRAINT `pp_AppliesTo_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `#__pp_Group` (`group_id`);

ALTER TABLE `#__pp_Policy`
  ADD CONSTRAINT `pp_Policy_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `#__pp_Category` (`category_id`);

ALTER TABLE `#__pp_Procedure`
  ADD CONSTRAINT `pp_Procedure_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `#__pp_Policy` (`policy_id`);

ALTER TABLE `#__pp_RelatedPolicies`
  ADD CONSTRAINT `pp_RelatedPolicies_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `#__pp_Policy` (`policy_id`),
  ADD CONSTRAINT `pp_RelatedPolicies_ibfk_2` FOREIGN KEY (`relatedPolicy_id`) REFERENCES `#__pp_Policy` (`policy_id`);

ALTER TABLE `#__pp_Revisions`
  ADD CONSTRAINT `pp_Revisions_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `#__pp_Policy` (`policy_id`);

