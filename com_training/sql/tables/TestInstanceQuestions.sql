CREATE TABLE `#__Training_TestInstanceQuestions`
(
    `testInstanceQuestionsID` int(11) NOT NULL AUTO_INCREMENT
    ,`testInstanceID` int(11) NOT NULL
    ,`questionPoolID` int(11) NOT NULL
    ,`answerPoolID` int(11) NULL
    ,`correctAnswer` bit NULL
    ,PRIMARY KEY (`testInstanceQuestionsID`)
    ,KEY `testInstanceID` (`testInstanceID`)
    ,KEY `questionPoolID` (`questionPoolID`)
    ,KEY `answerPoolID` (`answerPoolID`)
    ,CONSTRAINT `fk_TestInstanceQuestions_TestInstance_TestInstanceID` FOREIGN KEY (`testInstanceID`) REFERENCES `#__Training_TestInstance` (`testInstanceID`)
    ,CONSTRAINT `fk_TestInstanceQuestions_QuestionPool_QuestionPoolID` FOREIGN KEY (`questionPoolID`) REFERENCES `#__Training_QuestionPool` (`questionPoolID`)
    ,CONSTRAINT `fk_TestInstanceQuestions_AnswerPool_AnswerPoolID` FOREIGN KEY (`answerPoolID`) REFERENCES `#__Training_AnswerPool` (`answerPoolID`)
);


/* DROP INFORMATION */
ALTER TABLE `#__Training_TestInstanceQuestions`
    DROP FOREIGN KEY `fk_TestInstanceQuestions_TestInstance_TestInstanceID`;

ALTER TABLE `#__Training_TestInstanceQuestions`
    DROP FOREIGN KEY `fk_TestInstanceQuestions_QuestionPool_QuestionPoolID`;

DROP TABLE IF EXISTS `#__Training_TestInstanceQuestions`;
