CREATE TABLE `#__Training_Category` 
(
    `categoryID` int(11) NOT NULL AUTO_INCREMENT
    ,`description` varchar(50) NOT NULL
    ,`active` bit NOT NULL DEFAULT 1
    ,PRIMARY KEY (`categoryID`)
);

/* DROP INFORMATION */

DROP TABLE IF EXISTS `#__Training_Category`;
