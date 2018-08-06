CREATE TABLE IF NOT EXISTS `appointmentRequestConfig` (
  `id` int NOT NULL AUTO_INCREMENT,
  `decisionType` int NOT NULL,
  `isStartDate` boolean,
  `isEndDate` boolean,
  `isStartTime` boolean,
  `isEndTime` boolean,
  `isUrl` boolean,
  `isDescription` boolean,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS `appointmentRequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar (100) NOT NULL,
  `description` varchar(500),
  `organizerMail` varchar(100),
  `deadline` DATE NOT NULL,
  `appointmentRequestConfigId` int NOT NULL,
    FOREIGN KEY (appointmentRequestConfigId)
    REFERENCES appointmentRequestConfig(id),
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointmentRequestId` int NOT NULL,
  `startDate` timestamp,
  `endDate` timestamp,
  `url` varchar(30),
  `description` varchar(200) NOT NULL,
    FOREIGN KEY (appointmentRequestId)
    REFERENCES appointmentRequest(id),
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS `appointmentMember` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointmentRequestId` int  NOT NULL,
  `name` varchar(100),
    FOREIGN KEY (appointmentRequestId)
    REFERENCES appointmentRequest(id),
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS `appointmentDecision` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointmentId` int,
  `appointmentMemberId` int NOT NULL,
  `decision` int,
  `participants` int,
  PRIMARY KEY (id),
  UNIQUE (appointmentId, appointmentMemberId),
    FOREIGN KEY (appointmentId)
    REFERENCES appointment(id),
    FOREIGN KEY (appointmentMemberId)
    REFERENCES appointmentMember(id)
);