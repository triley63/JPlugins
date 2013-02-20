/* Create Tables */

CREATE TABLE `#__Training_Category` 
(
    `categoryID` int(11) NOT NULL AUTO_INCREMENT
    ,`description` varchar(50) NOT NULL
    ,`active` bit NOT NULL DEFAULT 1
    ,PRIMARY KEY (`categoryID`)
);


CREATE TABLE `#__Training_CategoryHierarchy`
(
    `categoryHierarchyID` int(11) NOT NULL AUTO_INCREMENT
    ,`childCategoryID` int(11) NOT NULL
    ,`parentCategoryID` int(11) NOT NULL
    ,PRIMARY KEY (`categoryHierarchyID`)
    ,KEY `childCategoryID` (`childCategoryID`)
    ,KEY `parentCategoryID` (`parentCategoryID`)
    ,CONSTRAINT `fk_child_categoryID` FOREIGN KEY (`childCategoryID`) REFERENCES `#__Training_Category` (`categoryID`)
    ,CONSTRAINT `fk_parent_categoryID` FOREIGN KEY (`parentCategoryID`) REFERENCES `#__Training_Category` (`categoryID`)
);


CREATE TABLE `#__Training_TrainingStyle`
(
    `trainingStyleID` int(11) NOT NULL AUTO_INCREMENT
    ,`name` varchar(20) NOT NULL
    ,`description` varchar(255) NOT NULL
    ,PRIMARY KEY (`trainingStyleID`)
);


CREATE TABLE `#__Training_TrainingType`
(
    `trainingTypeID` int(11) NOT NULL AUTO_INCREMENT
    ,`description` varchar(25) NOT NULL
    ,PRIMARY KEY (`trainingTypeID`)
);


CREATE TABLE `#__Training_Frequency`
(
    `frequencyID` int(11) NOT NULL AUTO_INCREMENT
    ,`description` varchar(40) NOT NULL
    ,PRIMARY KEY (`frequencyID`)
);


CREATE TABLE `#__Training_Training`
(
    `trainingID` int(11) NOT NULL AUTO_INCREMENT
    ,`description` varchar(100) NOT NULL
    ,`trainingTypeID` int(11) NOT NULL
    ,`categoryID` int(11) NOT NULL
    ,`trainingStyleID` int(11) NOT NULL
    ,`frequencyID` int(11) NOT NULL
    ,PRIMARY KEY (`trainingID`)
    ,KEY `trainingTypeID` (`trainingTypeID`)
    ,KEY `categoryID` (`categoryID`)
    ,KEY `trainingStyleID` (`trainingStyleID`)
    ,KEY `frequencyID` (`frequencyID`)
    ,CONSTRAINT `fk_Training_TrainingType_TrainingTypeID` FOREIGN KEY (`trainingTypeID`) REFERENCES `#__Training_TrainingType`(`trainingTypeID`)
    ,CONSTRAINT `fk_Training_Category_CategoryID` FOREIGN KEY (`categoryID`) REFERENCES `#__Training_Category`(`categoryID`)
    ,CONSTRAINT `fk_Training_TrainingStyle_TrainingStyleID` FOREIGN KEY (`trainingStyleID`) REFERENCES `#__Training_TrainingStyle`(`trainingStyleID`)
    ,CONSTRAINT `fk_Training_Frequency_FrequencyID` FOREIGN KEY (`frequencyID`) REFERENCES `#__Training_Frequency` (`frequencyID`)
);


CREATE TABLE `#__Training_Test`
(
    `testID` int(11) NOT NULL AUTO_INCREMENT
    ,`active` bit NOT NULL DEFAULT 1
    ,`totalQuestionCount` int(11) NOT NULL DEFAULT 0
    ,`trainingID` int(11) NOT NULL
    ,PRIMARY KEY (`testID`)
    ,KEY `trainingID` (`trainingID`)
    ,CONSTRAINT `fk_Test_Training_TrainingID` FOREIGN KEY (`trainingID`) REFERENCES `#__Training_Training` (`trainingID`)
);


CREATE TABLE `#__Training_TestCategories`
(
    `testCategories` int(11) NOT NULL AUTO_INCREMENT
    ,`numberOfQuestions` int(11) NOT NULL DEFAULT 0
    ,`testID` int(11) NOT NULL
    ,`categoryID` int(11) NOT NULL
    ,PRIMARY KEY (`testCategories`)
    ,KEY `testID` (`testID`)
    ,KEY `categoryID` (`categoryID`)
    ,CONSTRAINT `fk_TestCategories_Test_TestID` FOREIGN KEY (`testID`) REFERENCES `#__Training_Test` (`testID`)
    ,CONSTRAINT `fk_TestCategories_Category_CategoryID` FOREIGN KEY (`categoryID`) REFERENCES `#__Training_Category` (`categoryID`)
);


CREATE TABLE `#__Training_QuestionPool`
(
    `questionPoolID` int(11) NOT NULL AUTO_INCREMENT
    ,`question` varchar(255) NOT NULL
    ,`active` bit NOT NULL DEFAULT 1
    ,`answerPoolID` int(11) NOT NULL
    ,PRIMARY KEY (`questionPoolID`)
    ,KEY `answerPoolID` (`answerPoolID`)
);

    
CREATE TABLE `#__Training_AnswerPool`
(
    `answerPoolID` int(11) NOT NULL 
    ,`answer` varchar(255) NOT NULL
    ,`questionPoolID` int(11) NOT NULL
    ,PRIMARY KEY (`answerPoolID`)
    ,KEY `questionPoolID` (`questionPoolID`)
);


CREATE TABLE `#__Training_QuestionCategory`
(
    `questionCategoryID` int(11) NOT NULL AUTO_INCREMENT
    ,`categoryID` int(11) NOT NULL
    ,`questionPoolID` int(11) NOT NULL
    ,PRIMARY KEY (`questionCategoryID`)
    ,KEY `categoryID` (`categoryID`)
    ,KEY `questionPoolID` (`questionPoolID`)
    ,CONSTRAINT `fk_QuestionCategory_Category_CategoryID` FOREIGN KEY (`categoryID`) REFERENCES `#__Training_Category` (`categoryID`)
    ,CONSTRAINT `fk_QuestionCategory_QuestionPool_QuestionPoolID` FOREIGN KEY (`questionPoolID`) REFERENCES `#__Training_QuestionPool` (`questionPoolID`)
);

CREATE TABLE `#__Training_User`
(
    `userID` int(11) NOT NULL AUTO_INCREMENT
    ,`userName` varchar(50) NOT NULL
    ,PRIMARY KEY (`userID`)
);


CREATE TABLE `#__Training_TestInstance`
(
    `testInstanceID` int(11) NOT NULL AUTO_INCREMENT
    ,`testID` int(11) NOT NULL
    ,`userID` int(11) NOT NULL
    ,PRIMARY KEY (`testInstanceID`)
    ,KEY `testID` (`testID`)
    ,KEY `userID` (`userID`)
    ,CONSTRAINT `fk_TestInstance_Test_TestID` FOREIGN KEY (`testID`) REFERENCES `#__Training_Test` (`testID`)
    ,CONSTRAINT `fk_TestInstance_User_UserID` FOREIGN KEY (`userID`) REFERENCES `#__Training_User` (`userID`)
);


CREATE TABLE `#__Training_TestInstanceQuestions`
(
    `testInstanceQuestionsID` int(11) NOT NULL AUTO_INCREMENT
    ,`testInstanceID` int(11) NOT NULL
    ,`questionPoolID` int(11) NOT NULL
    ,PRIMARY KEY (`testInstanceQuestionsID`)
    ,KEY `testInstanceID` (`testInstanceID`)
    ,KEY `questionPoolID` (`questionPoolID`)
    ,CONSTRAINT `fk_TestInstanceQuestions_TestInstance_TestInstanceID` FOREIGN KEY (`testInstanceID`) REFERENCES `#__Training_TestInstance` (`testInstanceID`)
    ,CONSTRAINT `fk_TestInstanceQuestions_QuestionPool_QuestionPoolID` FOREIGN KEY (`questionPoolID`) REFERENCES `#__Training_QuestionPool` (`questionPoolID`)
);


CREATE TABLE `#__Training_FrequencyCycle`
(
    `frequencyCycleID` int(11) NOT NULL AUTO_INCREMENT
    ,`description` varchar(255) NOT NULL
    ,`frequencyID` int(11) NOT NULL
    ,PRIMARY KEY (`frequencyCycleID`)
    ,KEY `frequencyID` (`frequencyID`)
    ,CONSTRAINT `fk_FrequencyCycle_Frequency_FrequencyID` FOREIGN KEY (`frequencyID`) REFERENCES `#__Training_Frequency` (`frequencyID`)
);


CREATE TABLE `#__Training_UserTraining`
(
    `userTrainingID` int(11) NOT NULL AUTO_INCREMENT
    ,`numberOfAttempts` int(11) NOT NULL DEFAULT 0
    ,`passed` bit NOT NULL DEFAULT 0
    ,`userID` int(11) NOT NULL
    ,`trainingID` int(11) NOT NULL
    ,`frequencyID` int(11) NOT NULL
    ,PRIMARY KEY (`userTrainingID`)
    ,KEY `trainingID` (`trainingID`)
    ,KEY `frequencyID` (`frequencyID`)
    ,CONSTRAINT `fk_UserTraining_User_UserID` FOREIGN KEY (`userID`) REFERENCES `#__Training_User` (`userID`)
    ,CONSTRAINT `fk_UserTraining_Traning_TrainingID` FOREIGN KEY (`trainingID`) REFERENCES `#__Training_Training` (`trainingID`)
);


/*****************************************************************************************************************************************************/
/* Added Constraints */

ALTER TABLE `#__Training_QuestionPool`
    ADD CONSTRAINT `fk_QuestionPool_AnswerPool_AnswerID` FOREIGN KEY (`answerPoolID`) REFERENCES `#__Training_AnswerPool` (`answerPoolID`);

ALTER TABLE `#__Training_AnswerPool`
    ADD CONSTRAINT `fk_AnswerPool_QuestionPool_QuestionPoolID` FOREIGN KEY (`questionPoolID`) REFERENCES `#__Training_QuestionPool` (`questionPoolID`);

/*****************************************************************************************************************************************************/
/* Insert data into tables */
INSERT INTO `#__Training_TrainingStyle` (`name`, `description`) VALUES ('Exam', 'This will watch the training first with the exam at the end');
INSERT INTO `#__Training_TrainingStyle` (`name`, `description`) VALUES ('Side By Side', 'The training and exam will be completed at the same time');

INSERT INTO `#__Training_TrainingType` (`description`) VALUES('Video');
INSERT INTO `#__Training_TrainingType` (`description`) VALUES('SlideShow');
INSERT INTO `#__Training_TrainingType` (`description`) VALUES('Document');

INSERT INTO `#__Training_Frequency` (`description`) VALUES ('Annual');
INSERT INTO `#__Training_Frequency` (`description`) VALUES ('Semi-Annual');
INSERT INTO `#__Training_Frequency` (`description`) VALUES ('Quarterly');
INSERT INTO `#__Training_Frequency` (`description`) VALUES ('Monthly');
INSERT INTO `#__Training_Frequency` (`description`) VALUES ('Bi-Monthly');
INSERT INTO `#__Training_Frequency` (`description`) VALUES ('Weekly');
INSERT INTO `#__Training_Frequency` (`description`) VALUES ('Bi-Weekly');
