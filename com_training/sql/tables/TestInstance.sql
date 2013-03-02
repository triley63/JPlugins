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


/* DROP INFORMATION */
ALTER TABLE `#__Training_TestInstance`
    DROP FOREIGN KEY `fk_TestInstance_Test_TestID`;

ALTER TABLE `#__Training_TestInstance`
    DROP FOREIGN KEY `fk_TestInstance_UserTraining_UserTrainingID`;

DROP TABLE IF EXSITS `#__Training_TestInstance`;
