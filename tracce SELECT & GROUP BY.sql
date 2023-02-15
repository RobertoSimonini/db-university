-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT `name`, `surname`, `date_of_birth`
FROM `students`
WHERE `date_of_birth` BETWEEN '1990-01-01' AND '1990-12-31';

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT `name`, `cfu`
FROM `courses`
WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT `name`, `surname`, `date_of_birth`
FROM `students`
WHERE `date_of_birth` <= '1992';

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT `name`, `period`, `year`
FROM `courses`
WHERE `year` = 1
AND `period` = 'I semestre';

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

SELECT `date`, `hour`
FROM `exams`
WHERE `date` = '2020-06-20'
AND `hour` > '14%';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT `name`
FROM `degrees`
WHERE `name` LIKE '%Magistrale%';

-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT `name` FROM `departments`;


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT `name`, `surname`, `phone`
FROM `teachers`
WHERE `phone` IS NULL;

-- ------------------------------------------ QUERY CON GROUP BY

-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(`enrolment_date`) AS `year`, COUNT(*) as `n_students` 
FROM `students`
GROUP BY (`year`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT `office_address`, COUNT(*) as `teachers`
FROM `teachers`
GROUP BY (`office_address`);

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT AVG(`vote`) AS 'Media Voti' 
FROM `exam_student`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `department_id` as `departments` , COUNT(*) as `n_degrees` 
FROM `degrees`
GROUP BY (`departments`);

-- ------------------------------------------ QUERY CON JOIN

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.`name`, `students`.`surname`, `degrees`.`name` AS 'Corso di Laurea'
FROM `students`
JOIN `degrees`
ON `students`.`id`= `degree_id`
WHERE `degrees`. `name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT `degrees`.`name` AS 'Corsi di Laurea' , `departments`.`name` AS 'Dipartimento'
FROM `degrees`
JOIN `departments`
ON `degrees`.`id`= `department_id`
WHERE `departments`.`name`= 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `teachers`.`name`, `teachers`.`surname` AS 'Insegnante', `courses`.`name` AS 'Nome Corso'
FROM `teachers`
JOIN `courses`
JOIN `course_teacher`
ON `teachers`.`id`= `course_id`
WHERE `teachers`.`id` = 44;