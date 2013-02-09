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


/* DROP INFORMATION */
ALTER TABLE `#__Training_CategoryHierarchy`
    DROP FOREIGN KEY `fk_child_categoryID`;

ALTER TABLE `#__Training_CategoryHierarchy`
    DROP FOREIGN KEY `fk_parent_categoryID`;

DROP TABLE IF EXISTS `#__Training_CategoryHierarchy`;
