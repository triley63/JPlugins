CREATE TABLE `#__Training_TrainingSlides`
(
    `trainingSlidesID` int(11) NOT NULL AUTO_INCREMENT
    ,`title` varchar(100) NULL
    ,`description` text NOT NULL
    ,`trainingID` int(11) NOT NULL
    ,PRIMARY KEY (`trainingSlidesID`)
    ,KEY `trainingID` (`trainingID`)
    ,CONSTRAINT `fk_TrainingSlides_Training_TrainingID` FOREIGN KEY (`trainingID`) REFERENCES `#__Training_Training` (`trainingID`)
);


/* DROP INFORMATION */

ALTER TABLE `#__Training_TrainingSlides`
    DROP FOREIGN KEY `fk_TrainingSlides_Training_TrainingID`;

DROP TABLE `#__Training_TrainingSlides`