CREATE TABLE `#__Training_AnswerPool`
(
    `answerPoolID` int(11) NOT NULL 
    ,`answer` varchar(255) NOT NULL
    ,`questionPoolID` int(11) NOT NULL
    ,PRIMARY KEY (`answerPoolID`)
    ,KEY `questionPoolID` (`questionPoolID`)
);


ALTER TABLE `#__Training_AnswerPool`
    ADD CONSTRAINT `fk_AnswerPool_QuestionPool_QuestionPoolID` FOREIGN KEY (`questionID`) REFERENCES `#__Training_QuestionPool` (`questionPoolID`);


/* DROP INFORMATION */

ALTER TABLE `#__Training_AnswerPool`
    DROP FOREIGN KEY `fk_AnswerPool_QuestionPool_QuestionPoolID`;

DROP TABLE IF EXISTS `#__Training_AnswerPool`;
