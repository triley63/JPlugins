CREATE TABLE `#__Training_QuestionPoolTrainingSlides`
(
    `questionPoolTrainingSlidesID` int(11) NOT NULL AUTO_INCREMENT
    ,`questionPoolID` int(11) NOT NULL
    ,`trainingSlidesID` int(11) NOT NULL
    ,PRIMARY KEY (`questionPoolTrainingSlidesID`)
    ,KEY `questionPoolID` (`questionPoolID`)
    ,KEY `trainingSlidesID` (`trainingSlidesID`)
    ,CONSTRAINT `fk_QuestionPoolTrainingSlides_QuestionPool_QuestionPoolID` FOREIGN KEY (`questionPoolID`) REFERENCES `#__Training_QuestionPool` (`questionPoolID`)
    ,CONSTRAINT `fk_QuestionPoolTrainingSlides_TrainingSlides_TrainingSlidesID` FOREIGN KEY (`trainingSlidesID`) REFERENCES `#__Training_TrainingSlides` (`trainingSlidesID`)
);



/* DROP INFORMATION */
ALTER TABLE `#__Training_QuestionPoolTrainingSlides`
    DROP FOREIGN KEY `fk_QuestionPoolTrainingSlides_QuestionPool_QuestionPoolID`;

ALTER TABLE `#__Training_QuestionPoolTrainingSlides`
    DROP FOREIGN KEY `fk_QuestionPoolTrainingSlides_TrainingSlides_TrainingSlidesID`;

DROP TABLE IF EXISTS `#__Training_QuestionPoolTrainingSlides`;
