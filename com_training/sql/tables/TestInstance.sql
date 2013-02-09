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


/* DROP INFORMATION */
ALTER TABLE `#__Training_TestInstance`
    DROP FOREIGN KEY `fk_TestInstance_Test_TestID`;

ALTER TABLE `#__Training_TestInstance`
    DROP FOREIGN KEY `fk_TestInstance_User_UserID`;

DROP TABLE IF EXSITS `#__Training_TestInstance`;
