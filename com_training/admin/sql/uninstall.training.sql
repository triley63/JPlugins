/* DROP FOREIGN KEYS */

-- ALTER TABLE `#__Training_AnswerPool`
    -- DROP FOREIGN KEY `fk_AnswerPool_QuestionPool_QuestionPoolID`;

ALTER TABLE `#__Training_CategoryHierarchy`
    DROP FOREIGN KEY `fk_child_categoryID`;

ALTER TABLE `#__Training_CategoryHierarchy`
    DROP FOREIGN KEY `fk_parent_categoryID`;

ALTER TABLE `#__Training_FrequencyCycle`
    DROP FOREIGN KEY `fk_FrequencyCycle_Frequency_FrequencyID`;

ALTER TABLE `#__Training_QuestionCategory`
    DROP FOREIGN KEY `fk_QuestionCategory_Category_CategoryID`;

ALTER TABLE `#__Training_QuestionCategory`
    DROP FOREIGN KEY `fk_QuestionCategory_QuestionPool_QuestionPoolID`;

ALTER TABLE `#__Training_QuestionPool`
    DROP FOREIGN KEY `fk_QuestionPool_AnswerPool_AnswerID`;

ALTER TABLE `#__Training_Test`
    DROP FOREIGN KEY `fk_Test_Training_TrainingID`;

ALTER TABLE `#__Training_TestCategories`
    DROP FOREIGN KEY `fk_TestCategories_Test_TestID`;

ALTER TABLE `#__Training_TestCategories`
    DROP FOREIGN KEY `fk_TestCategories_Category_CategoryID`;

ALTER TABLE `#__Training_TestInstance`
    DROP FOREIGN KEY `fk_TestInstance_Test_TestID`;

ALTER TABLE `#__Training_TestInstance`
    DROP FOREIGN KEY `fk_TestInstance_UserTraining_UserTrainingID`;

ALTER TABLE `#__Training_TestInstanceQuestions`
    DROP FOREIGN KEY `fk_TestInstanceQuestions_TestInstance_TestInstanceID`;

ALTER TABLE `#__Training_TestInstanceQuestions`
    DROP FOREIGN KEY `fk_TestInstanceQuestions_QuestionPool_QuestionPoolID`;

ALTER TABLE `#__Training_Training`
    DROP FOREIGN KEY `fk_Training_TrainingType_TrainingTypeID`;

ALTER TABLE `#__Training_Training`
    DROP FOREIGN KEY `fk_Training_Category_CategoryID`;

ALTER TABLE `#__Training_Training`
    DROP FOREIGN KEY `fk_Training_TrainingStyle_TrainingStyleID`;

ALTER TABLE `#__Training_Training`
    DROP FOREIGN KEY `fk_Training_Frequency_FrequencyID`;

ALTER TABLE `#__Training_UserTraining`
    DROP FOREIGN KEY `fk_UserTraining_Users_UserID`;

ALTER TABLE `#__Training_UserTraining`
    DROP FOREIGN KEY `fk_UserTraining_Training_TrainingID`;

ALTER TABLE `#__Training_UserTraining`
    DROP FOREIGN KEY `fk_UserTraining_FrequencyCycle_FrequencyCycleID`;

ALTER TABLE `#__Training_TrainingSlides`
    DROP FOREIGN KEY `fk_TrainingSlides_Training_TrainingID`;


/*****************************************************************************************************************************************************/
/* Drop Tables */

DROP TABLE IF EXISTS `#__Training_AnswerPool`;

DROP TABLE IF EXISTS `#__Training_Category`;

DROP TABLE IF EXISTS `#__Training_CategoryHierarchy`;

DROP TABLE IF EXISTS `#__Training_Frequency`;

DROP TABLE IF EXISTS `#__Training_FrequencyCycle`;

DROP TABLE IF EXISTS `#__Training_QuestionCategory`;

DROP TABLE IF EXISTS `#__Training_QuestionPool`;

DROP TABLE IF EXISTS `#__Training_Test`;

DROP TABLE IF EXISTS `#__Training_TestCategories`;

DROP TABLE IF EXISTS `#__Training_TestInstance`;

DROP TABLE IF EXISTS `#__Training_TestInstanceQuestions`;

DROP TABLE IF EXISTS `#__Training_Training`;

DROP TABLE IF EXISTS `#__Training_TrainingStyle`;

DROP TABLE IF EXISTS `#__Training_TrainingType`;

DROP TABLE IF EXISTS `#__Training_User`;

DROP TABLE IF EXISTS `#__Training_UserTraining`;

DROP TABLE `#__Training_TrainingSlides`