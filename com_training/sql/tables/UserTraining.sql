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


/* DROP INFORMATION */
ALTER TABLE `#__Training_UserTraining`
    DROP FOREIGN KEY `fk_UserTraining_User_UserID`;

ALTER TABLE `#__Training_UserTraining`
    DROP FOREIGN KEY `fk_UserTraining_Traning_TrainingID`;

DROP TABLE IF EXISTS `#__Training_UserTraining`;
