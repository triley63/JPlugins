CREATE TABLE `#__Training_FrequencyCycle`
(
    `frequencyCycleID` int(11) NOT NULL AUTO_INCREMENT
    ,`description` varchar(255) NOT NULL
    ,`frequencyID` int(11) NOT NULL
    ,PRIMARY KEY (`frequencyCycleID`)
    ,KEY `frequencyID` (`frequencyID`)
    ,CONSTRAINT `fk_FrequencyCycle_Frequency_FrequencyID` FOREIGN KEY (`frequencyID`) REFERENCES `#__Training_Frequency` (`frequencyID`)
);


/* DROP INFORMATION */
ALTER TABLE `#__Training_FrequencyCycle`
    DROP FOREIGN KEY `fk_FrequencyCycle_Frequency_FrequencyID`;

DROP TABLE IF EXISTS `#__Training_FrequencyCycle`;
