START TRANSACTION;


--
-- contraindications
--
INSERT INTO medicine (id, name) VALUES (5, 'Вентолин');
INSERT INTO medicine (id, name) VALUES (6, 'Солу-Кортеф');
INSERT INTO medicine (id, name) VALUES (7, 'Сальгим');
INSERT INTO medicine (id, name) VALUES (8, 'Преднизолон');
INSERT INTO medicine (id, name) VALUES (9, 'Оксис турбухалер');
INSERT INTO medicine (id, name) VALUES (10, 'Ипрадол');
INSERT INTO medicine (id, name) VALUES (11, 'Фостер');
INSERT INTO medicine (id, name) VALUES (12, 'Эуфиллин');
INSERT INTO medicine (id, name) VALUES (13, 'Дексаметазон Никомед');
INSERT INTO medicine (id, name) VALUES (14, 'Беротек');
INSERT INTO medicine (id, name) VALUES (15, 'Беродуал');
INSERT INTO medicine (id, name) VALUES (16, 'Беклометазон');
INSERT INTO medicine (id, name) VALUES (17, 'Беклазон');
INSERT INTO medicine (id, name) VALUES (18, 'Атровент');
INSERT INTO medicine (id, name) VALUES (19, 'Асманекс твистхейлер');
INSERT INTO medicine (id, name) VALUES (20, 'Аминофиллин');

INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (5, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (6, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (7, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (8, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (9, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (10, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (11, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (12, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (13, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (14, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (15, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (16, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (17, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (18, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (19, 1);
INSERT INTO medicine_for_diseases (medicine_id, disease_id) VALUES (20, 1);

INSERT INTO active_substance (id, name) VALUES (10, 'Сальбутамол');
INSERT INTO active_substance (id, name) VALUES (11, 'Пропанол');
INSERT INTO active_substance (id, name) VALUES (12, 'Теофиллин');
INSERT INTO active_substance (id, name) VALUES (13, 'Гидрокортизон');
INSERT INTO active_substance (id, name) VALUES (14, 'Преднизолон');
INSERT INTO active_substance (id, name) VALUES (15, 'Амфотерицин');
INSERT INTO active_substance (id, name) VALUES (16, 'Формотерол');
INSERT INTO active_substance (id, name) VALUES (17, 'Гексопреналин');
INSERT INTO active_substance (id, name) VALUES (18, 'Беклометазон');
INSERT INTO active_substance (id, name) VALUES (19, 'Аминофиллин');
INSERT INTO active_substance (id, name) VALUES (20, 'Дексаметазон');
INSERT INTO active_substance (id, name) VALUES (21, 'Фенотерол');
INSERT INTO active_substance (id, name) VALUES (22, 'Ипратропия бромид');
INSERT INTO active_substance (id, name) VALUES (23, 'Атропиноподобные вещества');
INSERT INTO active_substance (id, name) VALUES (24, 'Бекламетазон');
INSERT INTO active_substance (id, name) VALUES (25, 'Мометазон');

INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (10, 5);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (13, 6);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (10, 7);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (14, 8);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (16, 9);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (17, 10);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (18, 11);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (16, 11);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (19, 12);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (20, 13);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (21, 14);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (21, 15);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (18, 16);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (24, 17);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (22, 18);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (25, 19);
INSERT INTO active_substance_in_medicine (active_substance_id, medicine_id) VALUES (19, 20);

INSERT INTO contradictions (id, medicine_id, created_date, predicate, source) VALUES (70, 5, '2019-05-25 15:06:46.358371', 'has({medicine.activeSubstanceId}, 11)', 'no_source');
INSERT INTO contradictions (id, medicine_id, created_date, predicate, source) VALUES (71, 5, '2019-05-25 15:06:46.430445', 'has({medicine.activeSubstanceId}, 12)', 'no_source');
INSERT INTO contradictions (id, medicine_id, created_date, predicate, source) VALUES (72, 5, '2019-05-25 15:06:46.510239', 'lt({patient.age}, 2)', 'no_source');
INSERT INTO contradictions (id, medicine_id, created_date, predicate, source) VALUES (73, 8, '2019-05-25 15:09:23.798328', 'has({medicine.activeSubstanceId}, 15)', 'no_source');
INSERT INTO contradictions (id, medicine_id, created_date, predicate, source) VALUES (74, 9, '2019-05-25 15:10:15.758084', 'lt({patient.age}, 12)', 'no_source');
INSERT INTO contradictions (id, medicine_id, created_date, predicate, source) VALUES (75, 11, '2019-05-25 15:10:54.976731', 'lt({patient.age}, 18)', 'no_source');
INSERT INTO contradictions (id, medicine_id, created_date, predicate, source) VALUES (76, 14, '2019-05-25 15:11:49.575526', 'has({medicine.activeSubstanceId}, 12)', 'no_source');
INSERT INTO contradictions (id, medicine_id, created_date, predicate, source) VALUES (77, 15, '2019-05-25 15:12:07.958149', 'has({medicine.activeSubstanceId}, 22)', 'no_source');
INSERT INTO contradictions (id, medicine_id, created_date, predicate, source) VALUES (78, 15, '2019-05-25 15:12:08.030256', 'has({medicine.activeSubstanceId}, 21)', 'no_source');
INSERT INTO contradictions (id, medicine_id, created_date, predicate, source) VALUES (79, 15, '2019-05-25 15:12:08.114619', 'has({medicine.activeSubstanceId}, 23)', 'no_source');
INSERT INTO contradictions (id, medicine_id, created_date, predicate, source) VALUES (80, 16, '2019-05-25 15:12:25.838387', 'lt({patient.age}, 6)', 'no_source');
INSERT INTO contradictions (id, medicine_id, created_date, predicate, source) VALUES (81, 18, '2019-05-25 15:13:07.558578', 'lt({patient.age}, 6)', 'no_source');
INSERT INTO contradictions (id, medicine_id, created_date, predicate, source) VALUES (82, 19, '2019-05-25 15:13:24.229625', 'lt({patient.age}, 12)', 'no_source');

commit;