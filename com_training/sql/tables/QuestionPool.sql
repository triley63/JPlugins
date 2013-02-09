CREATE TABLE `#__Training_QuestionPool`
(
    `questionPoolID` int(11) NOT NULL AUTO_INCREMENT
    ,`question` varchar(255) NOT NULL
    ,`active` bit NOT NULL DEFAULT 1
    ,`answerPoolID` int(11) NOT NULL
    ,PRIMARY KEY (`questionPoolID`)
    ,KEY `answerPoolID` (`answerPoolID`)
);

ALTER TABLE `#__Training_QuestionPool`
    ADD CONSTRAINT `fk_QuestionPool_AnswerPool_AnswerID` FOREIGN KEY (`answerPoolID`) REFERENCES `#__Training_AnswerPool` (`answerPoolID`);


/* DROP INFORMATION */
ALTER TABLE `#__Training_QuestionPool`
    DROP FOREIGN KEY `fk_QuestionPool_AnswerPool_AnswerID`;


DROP TABLE IF EXISTS `#__Training_QuestionPool`;
