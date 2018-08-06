CREATE TABLE IF NOT EXISTS `backendUserAccess` (
	`id` int NOT NULL AUTO_INCREMENT,
	`isEdit` boolean,
	`isInvited` boolean,
	`appointmentRequestId` int, 
	`backendUserId` int,
	FOREIGN KEY (appointmentRequestId) REFERENCES appointmentRequest(id),
	FOREIGN KEY (backendUserId) REFERENCES backendUser(id),
	PRIMARY KEY (id)
);