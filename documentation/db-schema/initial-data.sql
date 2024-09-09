-- Courses levels
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name)
VALUES('1', 'Beginner');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name)
VALUES('2', 'Pre-intermediate');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name)
VALUES('3', 'Intermediate');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name)
VALUES('4', 'Upper-intermediate');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name)
VALUES('5', 'Advanced');

-- Roles
INSERT INTO public.roles
(role_id, role_name)
VALUES('01HY8M06AJY1J6VCZEX9EYZ490', 'Admin');
INSERT INTO public.roles
(role_id, role_name)
VALUES('01HY8M15TWEWB4WAKJF7Z2V34B', 'Manager');
INSERT INTO public.roles
(role_id, role_name)
VALUES('01HY8M1E76BRQRQ6EK22DT1D7G', 'Teacher');
INSERT INTO public.roles
(role_id, role_name)
VALUES('01HY8M21YZZFP49SSMRWSB41XJ', 'Student');
INSERT INTO public.roles
(role_id, role_name)
VALUES('SALESROLE01HY8M23NV5G59B2B', 'Sales');
INSERT INTO public.roles
(role_id, role_name)
VALUES('01HY8M2QZFP49SSMRWSB41XJ', 'Spectator');

-- Tuition languages
INSERT INTO public.tuition_languages
(tuition_lang_id, tuition_lang_name, tuition_lang_code)
VALUES('01HY9EVCTXEV9W1Z67YEPS3A2C', 'Русский', 'ru');
INSERT INTO public.tuition_languages
(tuition_lang_id, tuition_lang_name, tuition_lang_code)
VALUES('01HY9EY23SRBH5F0X06TG98WYH', 'English', 'en');
INSERT INTO public.tuition_languages
(tuition_lang_id, tuition_lang_name, tuition_lang_code)
VALUES('01HY9EYDRTKWHP5XD8WCQFYGBK', 'Polska', 'pl');
INSERT INTO public.tuition_languages
(tuition_lang_id, tuition_lang_name, tuition_lang_code)
VALUES('01HY9EZGZ7H141RANT1D8AN6MD', 'Українська', 'ukr');

-- Meeting kinds
INSERT INTO public.meeting_kinds
(meeting_kind_id, meeting_kind_name)
VALUES('01HYH4ZDT0598MM2361GPNCWQ6', 'Q&A session');
INSERT INTO public.meeting_kinds
(meeting_kind_id, meeting_kind_name)
VALUES('01HYH51XP2Y7NE98EN2D2517CE', 'Intro meeting');
INSERT INTO public.meeting_kinds
(meeting_kind_id, meeting_kind_name)
VALUES('01HYH521MX5DNSM5GS6R9APV8Q', 'Graduation meeting');
INSERT INTO public.meeting_kinds
(meeting_kind_id, meeting_kind_name)
VALUES('01HYH524VRN7D0CKJJ0P5ZW091', 'Lab intro meeting');
INSERT INTO public.meeting_kinds
(meeting_kind_id, meeting_kind_name)
VALUES('01HYH5280AYRZMB5V93VWMS0TD', 'Feedback meeting');
INSERT INTO public.meeting_kinds
(meeting_kind_id, meeting_kind_name)
VALUES('01HYH5467E3R6314WVZR1YKS6T', 'Classes');
INSERT INTO public.meeting_kinds
(meeting_kind_id, meeting_kind_name)
VALUES('03IEGB67E3R6314WVZR1YKS3G', 'Special event');

-- Task types
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('1', 'Multiple choice');
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('2', 'Multi-select');
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('3', 'Gap filling');
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('4', 'Open question');
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('5', 'Spaced repetition');
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('6', 'Word or phrase translation');
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('7', 'Correct mistake');
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('8', 'Debate or discussion');
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('9', 'Discuss video or audio');
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('10', 'Answer questions based on video or audio');
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('11', 'Questions based on text');
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('12', 'Matching');
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('13', 'True or false');
INSERT INTO public.task_types
(task_type_id, task_type_name)
VALUES('14', 'Rephrase like native speaker');

-- Super broad subjects, top level categories
INSERT INTO public.subjects
(subject_id, subject_code, subject_name)
VALUES('1', 'english', 'English Language');
INSERT INTO public.subjects
(subject_id, subject_code, subject_name)
VALUES('2', 'programming', 'Programming');

-- Subject levels for courses
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name, subject_id)
VALUES('1', 'A1', '1');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name, subject_id)
VALUES('2', 'A1+', '1');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name, subject_id)
VALUES('3', 'A2', '1');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name, subject_id)
VALUES('4', 'A2+', '1');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name, subject_id)
VALUES('5', 'B1', '1');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name, subject_id)
VALUES('6', 'B1+', '1');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name, subject_id)
VALUES('7', 'B2', '1');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name, subject_id)
VALUES('8', 'B2+', '1');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name, subject_id)
VALUES('9', 'C1', '1');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name, subject_id)
VALUES('10', 'C1+', '1');
INSERT INTO public.courses_levels
(courses_level_id, courses_level_name, subject_id)
VALUES('11', 'C2', '1');

INSERT INTO subjects_aspects (aspect_id, aspect_name, subject_id, aspect_description)
VALUES
  ('1e4e34f6-1245-4e8a-a24c-cb5d3b6ec1a0', 'Parts of Speech', '1', 'Introduces building blocks of sentences (nouns, verbs, etc.)'),
  ('23c0c5a7-7481-4c5e-a9db-abe8f0984d7e', 'Sentence Structure', '1', 'Focuses on how sentences are formed (subject-verb agreement, types)'),
  ('9e6b86b8-f1a1-4d6d-b7bc-2b6e2a3e8a6d', 'Tenses', '1', 'Covers verb tenses used to express time (present, past, future)'),
  ('6a2d39ec-4c3b-4d1e-99a8-4b5b6c2b1d9f', 'Articles', '1', 'Explains definite and indefinite articles ("the", "a", "an")'),
  ('3a8f39d6-5b4c-4f9b-99d9-5b2b4c3a1e0a', 'Nouns', '1', 'Deeper dive into nouns (countable/uncountable, singular/plural, possessives)'),
  ('8d5f3b4a-7a2e-4c6f-b9a8-5b4d7b3a1c2b', 'Verb Conjugations', '1', 'Explains how verbs change form based on person, number, and tense'),
  ('4b3e2a1f-8c5d-4a7b-9e8b-6a5c4d3e2b1f', 'Modal Verbs', '1', 'Covers modal verbs (can, could, should, etc.) and their uses'),
  ('2f1a3d5b-9c6e-4b8a-9d7c-7b4a6e3f2d1c', 'Phrasal Verbs', '1', 'Explores two- or three-word verbs with special meaning'),
  ('1d3e4c6f-9a7b-4c5d-9e8a-8b5c6d4e3f2a', 'Gerunds & Infinitives', '1', 'Explains verb forms used as nouns or modifiers'),
  ('5a7c3b9e-4d6a-8b1c-9e7d-9c5a7b3d2e1f', 'Pronouns', '1', 'Covers different pronoun types (subject, object, possessive)'),
  ('7b6d3c5e-9a8f-4d1c-9e5b-1a6d7b5c3f2e', 'Adjectives', '1', 'Explains how adjectives modify nouns and pronouns'),
  ('6c5e4a7b-8d9f-4e1c-9b3a-2d7b6c5a3e1f', 'Adverbs', '1', 'Explains how adverbs modify verbs, adjectives, and other adverbs'),
  ('3e1c5d9b-7a8f-4b6a-9c4e-3d1b2c5a7e9f', 'Punctuation', '1', 'Proper use of punctuation marks for clarity and structure'),
  ('2a3d4b9e-5f7c-4a8b-9d1e-4c3b5a7e6d1f', 'Capitalization', '1', 'Rules of using capital letters for proper nouns, beginnings of sentences, etc.'),
  ('9b1d3e5a-7c4f-4a8b-9e6d-5c4b3a1f2e7d', 'Subject-Verb Agreement', '1', 'Ensuring subject and verb forms match in number (singular/plural)'),
  ('8a2c5d9e-3b4f-4a7b-9c1e-6d5b3a4e7c1f', 'Parallelism', '1', 'Using similar grammatical structures for balanced sentences'),
  ('5d1c3b7e-8a9f-4a6b-9c4d-7e5b2a3f6d1b', 'Clauses', '1', 'Explains independent and dependent clauses for forming complex sentences'),
  ('7a9d4b3e-2c5f-4a8b-9e6c-8d3b4a1f5c7e', 'Phrases', '1', 'Covers different types of phrases (prepositional, verb, noun, etc.)'),
  ('4e1d3b5a-9a8f-4c7b-9d6e-9c5a3d2f7b1e', 'Conditionals', '1', 'Expressing different hypothetical situations (if, then)'),
  ('3f2c1d5a-7b4e-4a8b-9d6c-1e5a7b3c9d4f', 'Reported Speech', '1', 'How to report what someone else said'),
  ('6b4a9d3e-2c7f-4a8b-9e5d-2d5b3c1e4a7f', 'Subject-Verb Inversion', '1', 'Reversing subject and verb order in certain situations'),
  ('2d5b3c7e-9a8f-4a1b-9e6c-3d4b5a1f7e2c', 'Voice', '1', 'Using active and passive voice appropriately'),
  ('1e4b7a3c-9f5d-4a8b-9c6e-4d3a5b2f7c1d', 'Collocations', '1', 'Common word pairings and phrases used by native speakers'),
  ('9c2a5b3e-1d7f-4a8b-9e6d-5d4b3a1f2c7e', 'Conjunctions', '1', 'Connecting words and clauses (and, but, or, etc.)'),
  ('5a9d7c3e-2b4f-4a8b-9e6c-6d5b3a1f4e7f', 'Prepositions', '1', 'Words that indicate relationships in time, place, etc. (in, on, at, etc.)'),
  ('7f6a5b9d-3e1c-4a8b-9e2d-7c5b3a1f6e4f', 'Comparatives & Superlatives', '1', 'Forming and using comparative and superlative adjectives'),
  ('4d2c7b5a-9a8f-4e1b-9c6e-8d5b3a7f1c3e', 'Direct & Indirect Questions', '1', 'Forming and using different types of questions'),
  ('3e4a9b5d-2c7f-4a8b-9e6c-9d5b3a1f2e7f', 'Relative Clauses', '1', 'Clauses that provide additional information about a noun')
;


