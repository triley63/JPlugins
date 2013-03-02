CREATE TABLE `#__Training_Training`
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


/* DROP INFORMATION */
ALTER TABLE `#__Training_Training`
    DROP FOREIGN KEY `fk_Training_TrainingType_TrainingTypeID`;

ALTER TABLE `#__Training_Training`
    DROP FOREIGN KEY `fk_Training_Category_CategoryID`;

ALTER TABLE `#__Training_Training`
    DROP FOREIGN KEY `fk_Training_TrainingStyle_TrainingStyleID`;

ALTER TABLE `#__Training_Training`
    DROP FOREIGN KEY `fk_Training_Frequency_FrequencyID`;

DROP TABLE IF EXISTS `#__Training_Training`;
