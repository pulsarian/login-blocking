CREATE  TABLE IF NOT EXISTS employee (
	emp_id INT  NOT NULL,
	emp_name VARCHAR(50) NOT NULL,
	emp_bu VARCHAR(50) NOT NULL,
	emp_mail VARCHAR(150) NOT NULL,
	emp_contact INT,
	emp_username VARCHAR(50) NOT NULL,
	emp_password VARCHAR(50) NOT NULL,
	emp_enabled BOOLEAN NOT NULL,
	emp_roles VARCHAR(50) NOT NULL,
	PRIMARY KEY(emp_id)
);


CREATE  TABLE IF NOT EXISTS event (
	event_id VARCHAR(50)  NOT NULL,
	event_name VARCHAR(50),
	event_month VARCHAR(50),
	event_desc VARCHAR(150),
	event_loc VARCHAR(150),
	event_beneficiary VARCHAR(150),
	event_council VARCHAR(150),
	event_project VARCHAR(150),
	event_category VARCHAR(150),
	event_address VARCHAR(50),
	event_date VARCHAR(50), 
	event_status VARCHAR(150),
	event_city VARCHAR(50),
	event_country VARCHAR(50),
	event_activity_type VARCHAR(150),
	event_iiep_category VARCHAR(150),
	event_volunteers INT,
	event_volunteer_hours DECIMAL(6,2),
	event_travel_hours DECIMAL(6,2),
	event_overall_volunteer_hours DECIMAL(6,2),
	event_lives_impacted INT NOT NULL,
	PRIMARY KEY(event_id)
);


CREATE  TABLE IF NOT EXISTS event_emp_xref (
	event_id VARCHAR(50) NOT NULL,
	emp_id INT NOT NULL,
	emp_participation_status VARCHAR(50),
	emp_volunteer_hours DECIMAL(6,2),
	emp_travel_hours DECIMAL(6,2),
	PRIMARY KEY (event_id, emp_id)
);

create table questions(
	question_id INT NOT NULL,
	question_desc VARCHAR(500),
	question_type CHARACTER(1),
	question_category VARCHAR(20),
	PRIMARY KEY(question_id)
);
DROP TABLE IF EXISTS `answers`;
create table answers(
	answer_id INT NOT NULL,
	answer_text VARCHAR(500),
	PRIMARY KEY(answer_id)
);

DROP TABLE IF EXISTS `question_answer_xref`;
create table question_answer_xref(
	qax_question_id INT NOT NULL,
	qax_answer_id INT NOT NULL,
	
	PRIMARY KEY(qax_question_id, qax_answer_id)
);


DROP TABLE IF EXISTS `participant_feedback_response`;
create table participant_feedback_response(
		pfr_response_id int not null,	
		pfr_event_id VARCHAR(50) NOT NULL,
		pfr_emp_id INT,
		pfr_question_id INT,
		pfr_answer_id INT,
		pfr_freetext_answer VARCHAR(500),
		PRIMARY KEY(pfr_response_id)
);


create table mail_comm_tracker(
		mct_comm_id int not null,	
		mct_event_id VARCHAR(50) NOT NULL,
		mct_participant_id INT NOT NULL,
		mct_mail_sent_on VARCHAR(50),
		mct_response_received_on VARCHAR(50),
		PRIMARY KEY(mct_comm_id)
);






