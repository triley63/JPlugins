INSERT INTO `#__Training_Category` (`description`) VALUES ('Fire Safety');
INSERT INTO `#__Training_Category` (`description`) VALUES ('Fire Extenguishers');

INSERT INTO `#__Training_CategoryHierarchy` (`childCategoryID`, `parentCategoryID`) VALUES (2, 1);

INSERT INTO `#__Training_Training` (`name`, `description`, `trainingTypeID`, `categoryID`, `trainingStyleID`, `frequencyID`, `assignedOnly`) 
VALUES ('Fire Safety Training', 'This is where you will outline and describe the exam including the total number of questions and what you need to pass!',
        2, 1, 2, 1, 1);

INSERT INTO `#__Training_Training` (`name`, `description`, `trainingTypeID`, `categoryID`, `trainingStyleID`, `frequencyID`, `assignedOnly`) 
VALUES ('I wanna be a fireman', 'This is where you will outline and describe the exam including the total number of questions and what you need to pass!',
        2, 1, 2, 1, 0);

INSERT INTO `#__Training_TrainingSlides` (`title`, `description`, `trainingID`)
VALUES
(
    'This is the title of the slide'
    ,'This is the text of the slide that we need to read before answering the question'
    ,1
);

INSERT INTO `#__Training_TrainingSlides` (`title`, `description`, `trainingID`)
VALUES
(
    'Fire Extenguisher Color'
    ,'The normal color for a fire extenguisher is red. There may be other colors
        but you should never see colors that are way out there. You should never
        see a purple or pink or neon. If you continue to read this text, you will
        know that I am just trying to fill space with non-sensical, trivial,
        content. If you find this interesting you really need a life!!'
    ,1
);


INSERT INTO #__Training_FrequencyCycle (description, frequencyID) VALUES ('2013', 1);
INSERT INTO #__Training_UserTraining (frequencyCycleID, numberOfAttempts, userID, trainingID) VALUES (1, 0, 172, 1);

INSERT INTO #__Training_Test (trainingId, totalQuestionCount) VALUES (1, 3);
INSERT INTO #__Training_TestInstance (testID, userTrainingID) VALUES (1, 1);

INSERT INTO #__Training_AnswerPool (answer) VALUES ('Answer 1');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Answer 2');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Answer 3');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Answer 4');

INSERT INTO #__Training_QuestionPool (question, answerPoolID) VALUES ('This is the first question', 3);

UPDATE #__Training_AnswerPool set questionpoolid = 1;

INSERT INTO #__Training_TestInstanceQuestions (testInstanceID, questionPoolID) VALUES (1, 1);
