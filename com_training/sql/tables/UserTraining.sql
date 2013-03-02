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


/* DROP INFORMATION */
ALTER TABLE `#__Training_UserTraining`
    DROP FOREIGN KEY `fk_UserTraining_Users_UserID`;

ALTER TABLE `#__Training_UserTraining`
    DROP FOREIGN KEY `fk_UserTraining_Training_TrainingID`;

ALTER TABLE `#__Training_UserTraining`
    DROP FOREIGN KEY `fk_UserTraining_FrequencyCycle_FrequencyCycleID`;

DROP TABLE IF EXISTS `#__Training_UserTraining`;
