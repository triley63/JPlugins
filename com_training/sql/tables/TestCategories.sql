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


/* DROP INFORMATION */
ALTER TABLE `#__Training_TestCategories`
    DROP FOREIGN KEY `fk_TestCategories_Test_TestID`;

ALTER TABLE `#__Training_TestCategories`
    DROP FOREIGN KEY `fk_TestCategories_Category_CategoryID`;

DROP TABLE IF EXISTS `#__Training_TestCategories`;
