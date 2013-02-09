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


/* DROP INFORMATION */
ALTER TABLE `#__Training_QuestionCategory`
    DROP FOREIGN KEY `fk_QuestionCategory_Category_CategoryID`;

ALTER TABLE `#__Training_QuestionCategory`
    DROP FOREIGN KEY `fk_QuestionCategory_QuestionPool_QuestionPoolID`;

DROP TABLE IF EXISTS `#__Training_QuestionCategory`;
