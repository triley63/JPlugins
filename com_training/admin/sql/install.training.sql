/* Create Tables */

CREATE TABLE IF NOT EXISTS `#__Training_Category` 
(
    `categoryID` int(11) NOT NULL AUTO_INCREMENT
    ,`description` varchar(50) NOT NULL
    ,`active` bit NOT NULL DEFAULT 1
    ,PRIMARY KEY (`categoryID`)
);


CREATE TABLE IF NOT EXISTS `#__Training_CategoryHierarchy`
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


CREATE TABLE IF NOT EXISTS `#__Training_TrainingStyle`
(
    `trainingStyleID` int(11) NOT NULL AUTO_INCREMENT
    ,`name` varchar(20) NOT NULL
    ,`description` varchar(255) NOT NULL
    ,PRIMARY KEY (`trainingStyleID`)
);


CREATE TABLE IF NOT EXISTS `#__Training_TrainingType`
(
    `trainingTypeID` int(11) NOT NULL AUTO_INCREMENT
    ,`description` varchar(25) NOT NULL
    ,PRIMARY KEY (`trainingTypeID`)
);


CREATE TABLE IF NOT EXISTS `#__Training_Frequency`
(
    `frequencyID` int(11) NOT NULL AUTO_INCREMENT
    ,`description` varchar(40) NOT NULL
    ,PRIMARY KEY (`frequencyID`)
);


CREATE TABLE IF NOT EXISTS `#__Training_Training`
(
    `trainingID` int(11) NOT NULL AUTO_INCREMENT
    ,`name` varchar(100) NOT NULL
    ,`description` text NULL
    ,`trainingTypeID` int(11) NOT NULL
    ,`categoryID` int(11) NOT NULL
    ,`trainingStyleID` int(11) NOT NULL
    ,`frequencyID` int(11) NOT NULL
    ,`active` bit NOT NULL DEFAULT 1
    ,`assignedOnly` bit NOT NULL DEFAULT 0
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


CREATE TABLE IF NOT EXISTS `#__Training_Test`
(
    `testID` int(11) NOT NULL AUTO_INCREMENT
    ,`active` bit NOT NULL DEFAULT 1
    ,`totalQuestionCount` int(11) NOT NULL DEFAULT 0
    ,`trainingID` int(11) NOT NULL
    ,PRIMARY KEY (`testID`)
    ,KEY `trainingID` (`trainingID`)
    ,CONSTRAINT `fk_Test_Training_TrainingID` FOREIGN KEY (`trainingID`) REFERENCES `#__Training_Training` (`trainingID`)
);


CREATE TABLE IF NOT EXISTS `#__Training_TestCategories`
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


CREATE TABLE IF NOT EXISTS `#__Training_QuestionPool`
(
    `questionPoolID` int(11) NOT NULL AUTO_INCREMENT
    ,`question` varchar(255) NOT NULL
    ,`active` bit NOT NULL DEFAULT 1
    ,`answerPoolID` int(11) NOT NULL
    ,PRIMARY KEY (`questionPoolID`)
    ,KEY `answerPoolID` (`answerPoolID`)
);

    
CREATE TABLE IF NOT EXISTS `#__Training_AnswerPool`
(
    `answerPoolID` int(11) NOT NULL AUTO_INCREMENT
    ,`answer` varchar(255) NOT NULL
    ,`questionPoolID` int(11) NOT NULL
    ,PRIMARY KEY (`answerPoolID`)
    ,KEY `questionPoolID` (`questionPoolID`)
);


CREATE TABLE IF NOT EXISTS `#__Training_QuestionCategory`
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

CREATE TABLE IF NOT EXISTS `#__Training_User`
(
    `userID` int(11) NOT NULL AUTO_INCREMENT
    ,`userName` varchar(50) NOT NULL
    ,PRIMARY KEY (`userID`)
);


CREATE TABLE IF NOT EXISTS `#__Training_FrequencyCycle`
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
    ,`frequencyCycleID` int(11) NOT NULL
    ,PRIMARY KEY (`userTrainingID`)
    ,KEY `trainingID` (`trainingID`)
    ,KEY `frequencyCycleID` (`frequencyCycleID`)
    ,CONSTRAINT `fk_UserTraining_Users_UserID` FOREIGN KEY (`userID`) REFERENCES `#__Users` (`id`)
    ,CONSTRAINT `fk_UserTraining_Training_TrainingID` FOREIGN KEY (`trainingID`) REFERENCES `#__Training_Training` (`trainingID`)
    ,CONSTRAINT `fk_UserTraining_FrequencyCycle_FrequencyCycleID` FOREIGN KEY (`frequencyCycleID`) REFERENCES `#__Training_FrequencyCycle` (`frequencyCycleID`)
);


CREATE TABLE `#__Training_TestInstance`
(
    `testInstanceID` int(11) NOT NULL AUTO_INCREMENT
    ,`testID` int(11) NOT NULL
    ,`userTrainingID` int(11) NOT NULL
    ,`active` bit NOT NULL DEFAULT 1
    ,PRIMARY KEY (`testInstanceID`)
    ,KEY `testID` (`testID`)
    ,KEY `userTrainingID` (`userTrainingID`)
    ,CONSTRAINT `fk_TestInstance_Test_TestID` FOREIGN KEY (`testID`) REFERENCES `#__Training_Test` (`testID`)
    ,CONSTRAINT `fk_TestInstance_UserTraining_UserTrainingID` FOREIGN KEY (`userTrainingID`) REFERENCES `#__Training_UserTraining` (`userTrainingID`)
);


CREATE TABLE IF NOT EXISTS `#__Training_TestInstanceQuestions`
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


CREATE TABLE IF NOT EXISTS `#__Training_TrainingSlides`
(
    `trainingSlidesID` int(11) NOT NULL AUTO_INCREMENT
    ,`title` varchar(100) NULL
    ,`description` text NOT NULL
    ,`trainingID` int(11) NOT NULL
    ,PRIMARY KEY (`trainingSlidesID`)
    ,KEY `trainingID` (`trainingID`)
    ,CONSTRAINT `fk_TrainingSlides_Training_TrainingID` FOREIGN KEY (`trainingID`) REFERENCES `#__Training_Training` (`trainingID`)
);


/*****************************************************************************************************************************************************/
/* Added Constraints */

ALTER TABLE `#__Training_QuestionPool`
    ADD CONSTRAINT `fk_QuestionPool_AnswerPool_AnswerID` FOREIGN KEY (`answerPoolID`) REFERENCES `#__Training_AnswerPool` (`answerPoolID`);

-- ALTER TABLE `#__Training_AnswerPool`
    -- ADD CONSTRAINT `fk_AnswerPool_QuestionPool_QuestionPoolID` FOREIGN KEY (`questionPoolID`) REFERENCES `#__Training_QuestionPool` (`questionPoolID`);

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




INSERT INTO `#__Training_Category` (`description`) VALUES ('Fire Safety');
INSERT INTO `#__Training_Category` (`description`) VALUES ('Fire Extenguishers');

INSERT INTO `#__Training_CategoryHierarchy` (`childCategoryID`, `parentCategoryID`) VALUES (2, 1);

INSERT INTO `#__Training_Training` (`name`, `description`, `trainingTypeID`, `categoryID`, `trainingStyleID`, `frequencyID`, `assignedOnly`) 
VALUES ('Fire Safety Training', 'This is where you will outline and describe the exam including the total number of questions and what you need to pass!',
        2, 1, 2, 1, 1);

INSERT INTO `#__Training_Training` (`name`, `description`, `trainingTypeID`, `categoryID`, `trainingStyleID`, `frequencyID`, `assignedOnly`) 
VALUES ('I wanna be a fireman', 'This is where you will outline and describe the exam including the total number of questions and what you need to pass!',
        2, 1, 2, 1, 0);

INSERT INTO `#__Training_TrainingSlides` (`title`, `description`, `trainingID`)
VALUES
(
    'This is the title of the slide'
    ,'This is the text of the slide that we need to read before answering the question'
    ,1
);

INSERT INTO `#__Training_TrainingSlides` (`title`, `description`, `trainingID`)
VALUES
(
    'Fire Extenguisher Color'
    ,'The normal color for a fire extenguisher is red. There may be other colors
        but you should never see colors that are way out there. You should never
        see a purple or pink or neon. If you continue to read this text, you will
        know that I am just trying to fill space with non-sensical, trivial,
        content. If you find this interesting you really need a life!!'
    ,1
);


INSERT INTO #__Training_FrequencyCycle (description, frequencyID) VALUES ('2013', 1);
INSERT INTO #__Training_UserTraining (frequencyCycleID, numberOfAttempts, userID, trainingID) VALUES (1, 0, 172, 1);

INSERT INTO #__Training_Test (trainingId, totalQuestionCount) VALUES (1, 3);
INSERT INTO #__Training_TestInstance (testID, userTrainingID) VALUES (1, 1);

INSERT INTO #__Training_AnswerPool (answer) VALUES ('Answer 1');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Answer 2');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Answer 3');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Answer 4');

INSERT INTO #__Training_QuestionPool (question, answerPoolID) VALUES ('This is the first question', 3);

UPDATE #__Training_AnswerPool set questionpoolid = 1;

INSERT INTO #__Training_TestInstanceQuestions (testInstanceID, questionPoolID) VALUES (1, 1);



# Add a menu item
/*
INSERT INTO `#__menu` (`menutype`,`title`,`link`,`type`,`published`,`parent_id`,`level`,`component_id`,`params`,`home`,`access`)
VALUES (
    'mainmenu'
    ,'Training'
    ,'index.php?option=com_training&view=course&id=0'
    ,'url'
    ,1
    ,1
    ,1
    ,0
    ,'{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}'
    ,0
    ,1
)
*/