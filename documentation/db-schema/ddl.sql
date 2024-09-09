-- public.companies definition

-- Drop table

-- DROP TABLE public.companies;

CREATE TABLE public.companies (
	company_id varchar NOT NULL,
	company_name varchar NOT NULL,
	company_location varchar NOT NULL,
	CONSTRAINT companies_pk PRIMARY KEY (company_id)
);


-- public.courses_advice definition

-- Drop table

-- DROP TABLE public.courses_advice;

CREATE TABLE public.courses_advice (
	advice_id varchar NOT NULL,
	course_id varchar NOT NULL,
	advice_text varchar NULL,
	last_used_date varchar NULL,
	created_date varchar NOT NULL,
	CONSTRAINT courses_advice_pk PRIMARY KEY (advice_id)
);


-- public.courses_mentors definition

-- Drop table

-- DROP TABLE public.courses_mentors;

CREATE TABLE public.courses_mentors (
	course_id varchar NOT NULL,
	mentor_id varchar NOT NULL
);
COMMENT ON TABLE public.courses_mentors IS 'Default mentors for paths, may be changed once a class is created from path';


-- public.lessons definition

-- Drop table

-- DROP TABLE public.lessons;

CREATE TABLE public.lessons (
	lesson_id varchar NOT NULL,
	lesson_name varchar NOT NULL,
	video_url varchar NULL,
	CONSTRAINT lessons_pk PRIMARY KEY (lesson_id)
);


-- public.meeting_kinds definition

-- Drop table

-- DROP TABLE public.meeting_kinds;

CREATE TABLE public.meeting_kinds (
	meeting_kind_id varchar NOT NULL,
	meeting_kind_name varchar NOT NULL,
	CONSTRAINT meeting_kinds_pk PRIMARY KEY (meeting_kind_id)
);


-- public.memo_study_options definition

-- Drop table

-- DROP TABLE public.memo_study_options;

CREATE TABLE public.memo_study_options (
	user_id varchar NULL,
	option_id varchar NULL,
	deck_id varchar NULL
);
COMMENT ON TABLE public.memo_study_options IS 'TBD';


-- public.mentors definition

-- Drop table

-- DROP TABLE public.mentors;

CREATE TABLE public.mentors (
	mentor_id varchar NOT NULL,
	user_id varchar NOT NULL,
	mentor_full_name_ru varchar NOT NULL,
	mentor_full_name_en varchar NOT NULL,
	mentor_description_ru varchar NULL,
	mentor_description_en varchar NULL,
	CONSTRAINT mentors_pk PRIMARY KEY (mentor_id)
);


-- public.modules definition

-- Drop table

-- DROP TABLE public.modules;

CREATE TABLE public.modules (
	module_id varchar NOT NULL,
	module_name varchar NOT NULL,
	module_description varchar NULL,
	CONSTRAINT modules_pk PRIMARY KEY (module_id)
);


-- public.positions definition

-- Drop table

-- DROP TABLE public.positions;

CREATE TABLE public.positions (
	position_id varchar NOT NULL,
	position_name varchar NOT NULL,
	CONSTRAINT positions_pk PRIMARY KEY (position_id)
);


-- public.prizes definition

-- Drop table

-- DROP TABLE public.prizes;

CREATE TABLE public.prizes (
	prize_id varchar NOT NULL,
	prize_name varchar NULL,
	CONSTRAINT prizes_pk PRIMARY KEY (prize_id)
);


-- public.roles definition

-- Drop table

-- DROP TABLE public.roles;

CREATE TABLE public.roles (
	role_id varchar NOT NULL,
	role_name varchar NULL,
	CONSTRAINT roles_pk PRIMARY KEY (role_id)
);


-- public.sections definition

-- Drop table

-- DROP TABLE public.sections;

CREATE TABLE public.sections (
	section_id varchar NOT NULL,
	section_name varchar NOT NULL,
	CONSTRAINT sections_pk PRIMARY KEY (section_id)
);
COMMENT ON TABLE public.sections IS 'Section is a partition of learning material. The full hierarchy is: course → module -> section -> lesson -> task
Section is optional and may not be present if there are just a few lessons in the module.';


-- public.student_class_ranking definition

-- Drop table

-- DROP TABLE public.student_class_ranking;

CREATE TABLE public.student_class_ranking (
	student_id varchar NOT NULL,
	class_id varchar NOT NULL,
	points int4 NULL DEFAULT 0
);


-- public.students definition

-- Drop table

-- DROP TABLE public.students;

CREATE TABLE public.students (
	student_id varchar NOT NULL,
	class_id varchar NOT NULL,
	user_id varchar NOT NULL,
	date_joined varchar NOT NULL,
	is_active bool NULL,
	CONSTRAINT students_pk PRIMARY KEY (student_id)
);


-- public.subjects definition

-- Drop table

-- DROP TABLE public.subjects;

CREATE TABLE public.subjects (
	subject_id varchar NOT NULL,
	subject_code varchar NOT NULL,
	subject_name varchar NOT NULL,
	CONSTRAINT subjects_pk PRIMARY KEY (subject_id)
);


-- public.subjects_task_types definition

-- Drop table

-- DROP TABLE public.subjects_task_types;

CREATE TABLE public.subjects_task_types (
	subject_id varchar NOT NULL,
	task_type_id varchar NOT NULL
);
COMMENT ON TABLE public.subjects_task_types IS 'Mapping of what subjects can have what task types';


-- public.task_types definition

-- Drop table

-- DROP TABLE public.task_types;

CREATE TABLE public.task_types (
	task_type_id varchar NOT NULL,
	task_type_name varchar NOT NULL,
	task_type_description varchar NULL, -- Typical description of a task
	CONSTRAINT task_types_pk PRIMARY KEY (task_type_id)
);

-- Column comments

COMMENT ON COLUMN public.task_types.task_type_description IS 'Typical description of a task';


-- public.tasks_statuses definition

-- Drop table

-- DROP TABLE public.tasks_statuses;

CREATE TABLE public.tasks_statuses (
	task_status_id varchar NOT NULL,
	task_status_name varchar NOT NULL,
	CONSTRAINT tasks_statuses_pk PRIMARY KEY (task_status_id)
);


-- public.time_of_day definition

-- Drop table

-- DROP TABLE public.time_of_day;

CREATE TABLE public.time_of_day (
	time_of_day_id varchar NOT NULL,
	time_of_day_label varchar NOT NULL,
	CONSTRAINT time_of_day_pk PRIMARY KEY (time_of_day_id)
);


-- public.tuition_languages definition

-- Drop table

-- DROP TABLE public.tuition_languages;

CREATE TABLE public.tuition_languages (
	tuition_lang_id varchar NOT NULL,
	tuition_lang_name varchar NOT NULL,
	tuition_lang_code varchar NOT NULL,
	CONSTRAINT tuition_languages_pk PRIMARY KEY (tuition_lang_id)
);


-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	user_id varchar NOT NULL,
	created_at varchar NOT NULL,
	updated_at varchar NULL,
	CONSTRAINT users_pk PRIMARY KEY (user_id)
);


-- public.clients definition

-- Drop table

-- DROP TABLE public.clients;

CREATE TABLE public.clients (
	client_id varchar NOT NULL, -- Company that bought our services
	client_name varchar NOT NULL,
	company_id varchar NOT NULL,
	CONSTRAINT clients_pk PRIMARY KEY (client_id),
	CONSTRAINT clients_companies_fk FOREIGN KEY (company_id) REFERENCES public.companies(company_id)
);

-- Column comments

COMMENT ON COLUMN public.clients.client_id IS 'Company that bought our services';


-- public.companies_users definition

-- Drop table

-- DROP TABLE public.companies_users;

CREATE TABLE public.companies_users (
	user_id varchar NULL,
	company_id varchar NULL,
	position_id varchar NULL,
	CONSTRAINT companies_users_companies_fk FOREIGN KEY (company_id) REFERENCES public.companies(company_id),
	CONSTRAINT companies_users_positions_fk FOREIGN KEY (position_id) REFERENCES public.positions(position_id),
	CONSTRAINT companies_users_users_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id)
);


-- public.courses_levels definition

-- Drop table

-- DROP TABLE public.courses_levels;

CREATE TABLE public.courses_levels (
	courses_level_id varchar NOT NULL,
	courses_level_name varchar NOT NULL, -- E.g. for English studies this can be "B1", "C1" etc.
	subject_id varchar NULL,
	CONSTRAINT paths_levels_pk PRIMARY KEY (courses_level_id),
	CONSTRAINT courses_levels_subjects_fk FOREIGN KEY (subject_id) REFERENCES public.subjects(subject_id)
);

-- Column comments

COMMENT ON COLUMN public.courses_levels.courses_level_name IS 'E.g. for English studies this can be "B1", "C1" etc.';


-- public.data_removal_requests definition

-- Drop table

-- DROP TABLE public.data_removal_requests;

CREATE TABLE public.data_removal_requests (
	user_id varchar NOT NULL,
	created_date varchar NOT NULL,
	fulfilled bool NULL,
	request_id varchar NOT NULL,
	CONSTRAINT data_removal_requests_pk PRIMARY KEY (request_id),
	CONSTRAINT data_removal_requests_users_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id)
);


-- public.memo_decks definition

-- Drop table

-- DROP TABLE public.memo_decks;

CREATE TABLE public.memo_decks (
	deck_id varchar NOT NULL,
	user_id varchar NOT NULL,
	deck_name varchar NOT NULL,
	deck_description varchar NULL,
	parent_id varchar NULL,
	CONSTRAINT memo_decks_pk PRIMARY KEY (deck_id),
	CONSTRAINT memo_decks_memo_decks_fk FOREIGN KEY (parent_id) REFERENCES public.memo_decks(deck_id),
	CONSTRAINT memo_decks_users_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id)
);


-- public.projects definition

-- Drop table

-- DROP TABLE public.projects;

CREATE TABLE public.projects (
	project_id varchar NOT NULL,
	project_code varchar NULL,
	project_name varchar NOT NULL,
	client_id varchar NULL,
	CONSTRAINT projects_pk PRIMARY KEY (project_id),
	CONSTRAINT projects_clients_fk FOREIGN KEY (client_id) REFERENCES public.clients(client_id)
);


-- public.raffles definition

-- Drop table

-- DROP TABLE public.raffles;

CREATE TABLE public.raffles (
	raffle_id varchar NOT NULL,
	prize_id varchar NULL,
	CONSTRAINT raffles_pk PRIMARY KEY (raffle_id),
	CONSTRAINT raffles_prizes_fk FOREIGN KEY (prize_id) REFERENCES public.prizes(prize_id)
);
COMMENT ON TABLE public.raffles IS 'It''s prize winning contests for our online school students.';


-- public.subjects_aspects definition

-- Drop table

-- DROP TABLE public.subjects_aspects;

CREATE TABLE public.subjects_aspects (
	aspect_id varchar NOT NULL,
	aspect_name varchar NOT NULL,
	subject_id varchar NOT NULL,
	aspect_description varchar NULL,
	CONSTRAINT subjects_aspects_pk PRIMARY KEY (aspect_id),
	CONSTRAINT subjects_aspects_subjects_fk FOREIGN KEY (subject_id) REFERENCES public.subjects(subject_id)
);
COMMENT ON TABLE public.subjects_aspects IS 'This table describes subject aspects, like e.g. in English grammar you would have to learn pronouns, tenses, articles, verbs etc. Each of these is an aspect';


-- public.tasks definition

-- Drop table

-- DROP TABLE public.tasks;

CREATE TABLE public.tasks (
	task_id varchar NOT NULL,
	task_description varchar NOT NULL,
	task_name varchar NOT NULL,
	task_type_id varchar NOT NULL,
	task_image_url varchar NULL,
	subject_id varchar NULL,
	subject_aspect_id varchar NULL,
	CONSTRAINT tasks_pk PRIMARY KEY (task_id),
	CONSTRAINT tasks_subjects_aspects_fk FOREIGN KEY (subject_aspect_id) REFERENCES public.subjects_aspects(aspect_id),
	CONSTRAINT tasks_subjects_fk FOREIGN KEY (subject_id) REFERENCES public.subjects(subject_id),
	CONSTRAINT tasks_task_types_fk FOREIGN KEY (task_type_id) REFERENCES public.task_types(task_type_id)
);
COMMENT ON TABLE public.tasks IS 'Template tasks (not actual class tasks)';


-- public.tasks_options definition

-- Drop table

-- DROP TABLE public.tasks_options;

CREATE TABLE public.tasks_options (
	task_id varchar NULL,
	option_id varchar NOT NULL,
	option_text varchar NOT NULL,
	option_index int2 NOT NULL,
	is_correct bool NULL,
	CONSTRAINT tasks_options_pk PRIMARY KEY (option_id),
	CONSTRAINT tasks_options_tasks_fk FOREIGN KEY (task_id) REFERENCES public.tasks(task_id)
);


-- public.user_roles definition

-- Drop table

-- DROP TABLE public.user_roles;

CREATE TABLE public.user_roles (
	user_id varchar NOT NULL,
	role_id varchar NOT NULL,
	CONSTRAINT user_roles_roles_fk FOREIGN KEY (role_id) REFERENCES public.roles(role_id),
	CONSTRAINT user_roles_users_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id)
);


-- public.users_projects definition

-- Drop table

-- DROP TABLE public.users_projects;

CREATE TABLE public.users_projects (
	user_id varchar NOT NULL,
	project_id varchar NOT NULL,
	CONSTRAINT users_projects_projects_fk FOREIGN KEY (project_id) REFERENCES public.projects(project_id),
	CONSTRAINT users_projects_users_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id)
);
CREATE UNIQUE INDEX users_projects_user_id_idx ON public.users_projects USING btree (user_id, project_id);


-- public.courses definition

-- Drop table

-- DROP TABLE public.courses;

CREATE TABLE public.courses (
	subject_id varchar NULL,
	course_id varchar NOT NULL,
	course_name varchar NULL,
	path_level_id varchar NOT NULL,
	path_code varchar NOT NULL, -- Code of the path used internally for automation. E.g. fe-angular-b, meaning frontend angular beginners
	active_since varchar NULL,
	CONSTRAINT path_pk PRIMARY KEY (course_id),
	CONSTRAINT path_paths_levels_fk FOREIGN KEY (path_level_id) REFERENCES public.courses_levels(courses_level_id)
);

-- Column comments

COMMENT ON COLUMN public.courses.path_code IS 'Code of the path used internally for automation. E.g. fe-angular-b, meaning frontend angular beginners';


-- public.courses_structures definition

-- Drop table

-- DROP TABLE public.courses_structures;

CREATE TABLE public.courses_structures (
	course_id varchar NOT NULL,
	module_id varchar NOT NULL,
	lesson_id varchar NULL,
	CONSTRAINT paths_structures_lessons_fk FOREIGN KEY (lesson_id) REFERENCES public.lessons(lesson_id),
	CONSTRAINT paths_structures_modules_fk FOREIGN KEY (module_id) REFERENCES public.modules(module_id),
	CONSTRAINT paths_structures_path_fk FOREIGN KEY (course_id) REFERENCES public.courses(course_id)
);
COMMENT ON TABLE public.courses_structures IS 'This is a template structure. This is NOT the structure of each particular class!';


-- public.memo_cards definition

-- Drop table

-- DROP TABLE public.memo_cards;

CREATE TABLE public.memo_cards (
	card_id varchar NOT NULL,
	deck_id varchar NOT NULL,
	question varchar NOT NULL,
	answer varchar NULL,
	created_date varchar NULL,
	updated_date varchar NULL,
	due_date varchar NULL,
	lapses varchar NULL, -- Number of times this card was given a Don't Know answer
	CONSTRAINT memo_cards_pk PRIMARY KEY (card_id),
	CONSTRAINT memo_cards_memo_decks_fk FOREIGN KEY (deck_id) REFERENCES public.memo_decks(deck_id)
);

-- Column comments

COMMENT ON COLUMN public.memo_cards.lapses IS 'Number of times this card was given a Don''t Know answer';


-- public.students_tasks definition

-- Drop table

-- DROP TABLE public.students_tasks;

CREATE TABLE public.students_tasks (
	student_id varchar NOT NULL,
	task_id varchar NOT NULL,
	answer varchar NULL, -- Array of correct answers or a free-form answer
	answer_date varchar NULL,
	task_status_id varchar NOT NULL,
	correct_answer varchar NULL,
	CONSTRAINT students_tasks_pk PRIMARY KEY (student_id, task_id),
	CONSTRAINT students_tasks_students_fk FOREIGN KEY (student_id) REFERENCES public.students(student_id),
	CONSTRAINT students_tasks_tasks_fk FOREIGN KEY (task_id) REFERENCES public.tasks(task_id),
	CONSTRAINT students_tasks_tasks_statuses_fk FOREIGN KEY (task_status_id) REFERENCES public.tasks_statuses(task_status_id)
);

-- Column comments

COMMENT ON COLUMN public.students_tasks.answer IS 'Array of correct answers or a free-form answer';


-- public.booking_requests definition

-- Drop table

-- DROP TABLE public.booking_requests;

CREATE TABLE public.booking_requests (
	email varchar NOT NULL, -- I don't think it's right to call this field "user_id" because technically this person is not yet a user most likely
	course_id varchar NULL,
	"name" varchar NULL,
	phone_number varchar NULL,
	telegram_nickname varchar NULL,
	created_date varchar NOT NULL,
	we_replied bool NULL,
	CONSTRAINT booking_requests_pk PRIMARY KEY (email),
	CONSTRAINT booking_requests_courses_fk FOREIGN KEY (course_id) REFERENCES public.courses(course_id)
);

-- Column comments

COMMENT ON COLUMN public.booking_requests.email IS 'I don''t think it''s right to call this field "user_id" because technically this person is not yet a user most likely';


-- public.classes definition

-- Drop table

-- DROP TABLE public.classes;

CREATE TABLE public.classes (
	class_id varchar NOT NULL,
	class_code varchar NULL, -- Should be generated automatically based on the course (path) code plus date
	path_id varchar NULL,
	start_date varchar NOT NULL,
	end_date varchar NULL,
	tuition_lang_id varchar NOT NULL,
	max_capacity int2 NOT NULL,
	time_of_day_id varchar NOT NULL, -- Should be something like evening, day, morning
	CONSTRAINT classes_pk PRIMARY KEY (class_id),
	CONSTRAINT classes_paths_fk FOREIGN KEY (path_id) REFERENCES public.courses(course_id),
	CONSTRAINT classes_time_of_day_fk FOREIGN KEY (time_of_day_id) REFERENCES public.time_of_day(time_of_day_id),
	CONSTRAINT classes_tuition_languages_fk FOREIGN KEY (tuition_lang_id) REFERENCES public.tuition_languages(tuition_lang_id)
);

-- Column comments

COMMENT ON COLUMN public.classes.class_code IS 'Should be generated automatically based on the course (path) code plus date';
COMMENT ON COLUMN public.classes.time_of_day_id IS 'Should be something like evening, day, morning';


-- public.classes_calls definition

-- Drop table

-- DROP TABLE public.classes_calls;

CREATE TABLE public.classes_calls (
	class_call_id varchar NOT NULL,
	class_id varchar NOT NULL,
	class_call_date varchar NOT NULL,
	class_call_time varchar NOT NULL,
	mentor_id varchar NOT NULL,
	recording_url varchar NULL,
	meeting_kind_id varchar NOT NULL,
	CONSTRAINT class_calls_pk PRIMARY KEY (class_call_id),
	CONSTRAINT class_calls_classes_fk FOREIGN KEY (class_id) REFERENCES public.classes(class_id),
	CONSTRAINT class_calls_meeting_kinds_fk FOREIGN KEY (meeting_kind_id) REFERENCES public.meeting_kinds(meeting_kind_id),
	CONSTRAINT class_calls_mentors_fk FOREIGN KEY (mentor_id) REFERENCES public.mentors(mentor_id)
);


-- public.classes_homeworks definition

-- Drop table

-- DROP TABLE public.classes_homeworks;

CREATE TABLE public.classes_homeworks (
	path_id varchar NOT NULL,
	module_id varchar NOT NULL,
	section_id varchar NULL,
	lesson_id varchar NOT NULL,
	class_id varchar NOT NULL,
	class_lesson_id varchar NOT NULL,
	CONSTRAINT classes_lessons_pk PRIMARY KEY (class_lesson_id),
	CONSTRAINT classes_lessons_courses_fk FOREIGN KEY (path_id) REFERENCES public.courses(course_id),
	CONSTRAINT classes_structures_classes_fk FOREIGN KEY (class_id) REFERENCES public.classes(class_id),
	CONSTRAINT classes_structures_lessons_fk FOREIGN KEY (lesson_id) REFERENCES public.lessons(lesson_id),
	CONSTRAINT classes_structures_modules_fk FOREIGN KEY (module_id) REFERENCES public.modules(module_id),
	CONSTRAINT classes_structures_sections_fk FOREIGN KEY (section_id) REFERENCES public.sections(section_id)
);
COMMENT ON TABLE public.classes_homeworks IS 'This is the final and immutable curriculum for a class. The curriculum is based on the path structure that existing at the time of class creation';


-- public.classes_mentors definition

-- Drop table

-- DROP TABLE public.classes_mentors;

CREATE TABLE public.classes_mentors (
	class_id varchar NOT NULL,
	mentor_id varchar NOT NULL,
	is_primary bool NULL,
	CONSTRAINT classes_mentors_classes_fk FOREIGN KEY (class_id) REFERENCES public.classes(class_id),
	CONSTRAINT classes_mentors_mentors_fk FOREIGN KEY (mentor_id) REFERENCES public.mentors(mentor_id)
);


-- public.classes_students definition

-- Drop table

-- DROP TABLE public.classes_students;

CREATE TABLE public.classes_students (
	class_id varchar NOT NULL,
	student_id varchar NOT NULL,
	date_enrolled varchar NOT NULL,
	date_left varchar NULL,
	CONSTRAINT classes_students_pk PRIMARY KEY (class_id, student_id),
	CONSTRAINT classes_students_classes_fk FOREIGN KEY (class_id) REFERENCES public.classes(class_id),
	CONSTRAINT classes_students_students_fk FOREIGN KEY (student_id) REFERENCES public.students(student_id)
);


-- public.student_questions definition

-- Drop table

-- DROP TABLE public.student_questions;

CREATE TABLE public.student_questions (
	student_id varchar NOT NULL,
	question_text varchar NOT NULL,
	answer_text varchar NULL,
	class_lesson_id varchar NULL,
	CONSTRAINT student_questions_classes_lessons_fk FOREIGN KEY (class_lesson_id) REFERENCES public.classes_homeworks(class_lesson_id)
);