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


/* DROP INFORMATION */
ALTER TABLE `#__Training_Test`
    DROP FOREIGN KEY `fk_Test_Training_TrainingID`;

DROP PROCEDURE IF EXISTS `#__Training_Test`;
