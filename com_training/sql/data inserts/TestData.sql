INSERT INTO `#__Training_Category` (`description`) VALUES ('Super Heroes');
INSERT INTO `#__Training_Category` (`description`) VALUES ('SideKicks');
INSERT INTO `#__Training_Category` (`description`) VALUES ('Special Powers');
INSERT INTO `#__Training_Category` (`description`) VALUES ('Transportation');

INSERT INTO `#__Training_CategoryHierarchy` (`childCategoryID`, `parentCategoryID`) VALUES (2,1);
INSERT INTO `#__Training_CategoryHierarchy` (`childCategoryID`, `parentCategoryID`) VALUES (3,1);
INSERT INTO `#__Training_CategoryHierarchy` (`childCategoryID`, `parentCategoryID`) VALUES (4,1);

INSERT INTO `#__Training_Training` (`name`, `description`, `trainingTypeID`, `categoryID`, `trainingStyleID`, `frequencyID`, `assignedOnly`) 
VALUES ('Super Hero Trivia', 'This is a sample trivia training course. There will be 5 random questions for several sub cateogries. You are required to answer 4 correct in order to pass.'
            ,2,1,2,1,1);

-- I need to provide a second training that is not assigned


INSERT INTO `#__Training_TrainingSlides` (`title`, `description`, `trainingID`)
VALUES
(
    'Super Hero Sidekicks'
    ,'Some super heros worked alone while others had sidekicks that joined them in the fight for truth justice and the american way.
        For instance Batman had Robin and Batgirl, Superman had Jimmy Oleson, Aquaman had Aquagirl or Aquawoman and the Green Hornet had Kato.
        Some however worked alone such as Spiderman, Ironman and the Hulk.'
    ,1
);

INSERT INTO `#__Training_TrainingSlides` (`title`, `description`, `trainingID`)
VALUES
(
    'Super Hero Special Powers'
    ,'Almost all superheroes had an extreme super power of some kind. Some were extreme enhancements to normal powers such as strength, speed
        super senses, while others possessed powers far and above the ability of normal humans, such as breathing under water, impenetribility,
        laser and xray vision. Still there were others that had not extreme super powers, but used technology to accomplish there tasks to combat
        evil. The following is a list of super heroes that had and did not have super powers.
        Batman, Robin, Batgirl - used technology and advanced toys (tools).
        Superman - Strength, Laser Vision, XRay Vision. Speed.
        Aquaman and Aquagirl - Breathing under water
        Green Hornet and Kato - No Super powers but single purpose and technology.
        Spiderman - Super Senses, Swinging by spider web, super strength.
        Ironman - No super powers, technology only.
        Hulk - Super strength.'
    ,1
);

INSERT INTO `#__Training_TrainingSlides` (`title`, `description`, `trainingID`)
VALUES
(
    'Super Hero Transportation'
    ,'There are difference in the way superheroes get around to thwart the bad guys and menace the villians. The follow is a partial list of
        those modes of transportation or the ability to move from place to place.
        Batman, Robing and Batgirl - BatMobile, BatCycle, BatBoat, BatCopter, BatSubmarine
        SuperMan - Faster than a speeding bullet, able to leap tall buildings in a single bound ... flying, fast running
        Aquaman and AquaGirl - Anything with water .. swimming
        Green Hornet - A suped up car
        Spideman - Web Swinging
        Ironman - flying
        Hulk - Not Known'
    ,1
);

INSERT INTO #__Training_FrequencyCycle (description, frequencyID) VALUES ('2013', 1);
INSERT INTO #__Training_UserTraining (frequencyCycleID, numberOfAttempts, userID, trainingID) VALUES (1, 0, 45, 1);

INSERT INTO #__Training_Test (trainingId, totalQuestionCount) VALUES (1, 5);

INSERT INTO #__Training_AnswerPool (answer) VALUES ('Batman');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Superman');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Green Hornet');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Spiderman');
INSERT INTO #__Training_QuestionPool (question, answerPoolID) VALUES ('Which superhero did not have a sidekick?', 4);
UPDATE #__Training_AnswerPool SET questionpoolid = 1 WHERE answerPoolID IN (1,2,3,4);
INSERT INTO `#__Training_QuestionCategory` (`categoryID`, `questionPoolID`) VALUES (2,1);
INSERT INTO `#__Training_QuestionPoolTrainingSlides` (`questionPoolID`, `trainingSlidesID`) VALUES (1,1);

INSERT INTO #__Training_AnswerPool (answer) VALUES ('The Hulk');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Ironman');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Aquaman');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Spiderman');
INSERT INTO #__Training_QuestionPool (question, answerPoolID) VALUES ('Which superhero did have a sidekick?', 7);
UPDATE #__Training_AnswerPool SET questionpoolid = 2 WHERE answerPoolID IN (5,6,7,8);
INSERT INTO `#__Training_QuestionCategory` (`categoryID`, `questionPoolID`) VALUES (2,2);
INSERT INTO `#__Training_QuestionPoolTrainingSlides` (`questionPoolID`, `trainingSlidesID`) VALUES (2,1);

INSERT INTO #__Training_AnswerPool (answer) VALUES ('Batman');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Superman');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Green Hornet');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Ironman');
INSERT INTO #__Training_QuestionPool (question, answerPoolID) VALUES ('Which superhero had more than one sidekick?', 9);
UPDATE #__Training_AnswerPool SET questionpoolid = 3 WHERE answerPoolID IN (9,10,11,12);
INSERT INTO `#__Training_QuestionCategory` (`categoryID`, `questionPoolID`) VALUES (2,3);
INSERT INTO `#__Training_QuestionPoolTrainingSlides` (`questionPoolID`, `trainingSlidesID`) VALUES (3,1);

INSERT INTO #__Training_AnswerPool (answer) VALUES ('True');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('False');
INSERT INTO #__Training_QuestionPool (question, answerPoolID) VALUES ('The Green Hornet had super human powers?', 14);
UPDATE #__Training_AnswerPool SET questionpoolid = 4 WHERE answerPoolID IN (13,14);
INSERT INTO `#__Training_QuestionCategory` (`categoryID`, `questionPoolID`) VALUES (3,4);
INSERT INTO `#__Training_QuestionPoolTrainingSlides` (`questionPoolID`, `trainingSlidesID`) VALUES (4,2);

INSERT INTO #__Training_AnswerPool (answer) VALUES ('Super Speed');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Laser Vision');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Super Strength');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('ESP');
INSERT INTO #__Training_QuestionPool (question, answerPoolID) VALUES ('What power did Superman not have?', 18);
UPDATE #__Training_AnswerPool SET questionpoolid = 5 WHERE answerPoolID IN (15,16,17,18);
INSERT INTO `#__Training_QuestionCategory` (`categoryID`, `questionPoolID`) VALUES (3,5);
INSERT INTO `#__Training_QuestionPoolTrainingSlides` (`questionPoolID`, `trainingSlidesID`) VALUES (5,2);

INSERT INTO #__Training_AnswerPool (answer) VALUES ('Advanced Technology');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Super Sensitivity');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Super Speed');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Breathing Underwater');
INSERT INTO #__Training_QuestionPool (question, answerPoolID) VALUES ('What super power did Spiderman have?', 20);
UPDATE #__Training_AnswerPool SET questionpoolid = 6 WHERE answerPoolID IN (19,20,21,22);
INSERT INTO `#__Training_QuestionCategory` (`categoryID`, `questionPoolID`) VALUES (3,6);
INSERT INTO `#__Training_QuestionPoolTrainingSlides` (`questionPoolID`, `trainingSlidesID`) VALUES (6,2);

INSERT INTO #__Training_AnswerPool (answer) VALUES ('False');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('True');
INSERT INTO #__Training_QuestionPool (question, answerPoolID) VALUES ('Ironman could fly and see the future?', 23);
UPDATE #__Training_AnswerPool SET questionpoolid = 7 WHERE answerPoolID IN (23,24);
INSERT INTO `#__Training_QuestionCategory` (`categoryID`, `questionPoolID`) VALUES (3,7);
INSERT INTO `#__Training_QuestionPoolTrainingSlides` (`questionPoolID`, `trainingSlidesID`) VALUES (7,2);

INSERT INTO #__Training_AnswerPool (answer) VALUES ('Superman');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Aquaman');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Flash');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Batman');
INSERT INTO #__Training_QuestionPool (question, answerPoolID) VALUES ('Which of the following needed outside assistance for transportation?', 28);
UPDATE #__Training_AnswerPool SET questionpoolid = 8 WHERE answerPoolID IN (25,26,27,28);
INSERT INTO `#__Training_QuestionCategory` (`categoryID`, `questionPoolID`) VALUES (4,8);
INSERT INTO `#__Training_QuestionPoolTrainingSlides` (`questionPoolID`, `trainingSlidesID`) VALUES (8,3);

INSERT INTO #__Training_AnswerPool (answer) VALUES ('IronMan');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Green Hornet');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Superman');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('Spiderman');
INSERT INTO #__Training_QuestionPool (question, answerPoolID) VALUES ('Which superhero used a car to get around?', 30);
UPDATE #__Training_AnswerPool SET questionpoolid = 9 WHERE answerPoolID IN (29,30,31,32);
INSERT INTO `#__Training_QuestionCategory` (`categoryID`, `questionPoolID`) VALUES (4,9);
INSERT INTO `#__Training_QuestionPoolTrainingSlides` (`questionPoolID`, `trainingSlidesID`) VALUES (9,3);

INSERT INTO #__Training_AnswerPool (answer) VALUES ('True');
INSERT INTO #__Training_AnswerPool (answer) VALUES ('False');
INSERT INTO #__Training_QuestionPool (question, answerPoolID) VALUES ('The Hulk had the ability to teleport himself from place to place?', 34);
UPDATE #__Training_AnswerPool SET questionpoolid = 10 WHERE answerPoolID IN (33,34);
INSERT INTO `#__Training_QuestionCategory` (`categoryID`, `questionPoolID`) VALUES (4,10);
INSERT INTO `#__Training_QuestionPoolTrainingSlides` (`questionPoolID`, `trainingSlidesID`) VALUES (10,3);


INSERT INTO `#__Training_TestCategories` (`testID`, `numberOfQuestions`, `categoryID`) VALUES (1, 1, 2);
INSERT INTO `#__Training_TestCategories` (`testID`, `numberOfQuestions`, `categoryID`) VALUES (1, 2, 3);
INSERT INTO `#__Training_TestCategories` (`testID`, `numberOfQuestions`, `categoryID`) VALUES (1, 2, 4);
