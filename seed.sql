-- Insérer les données dans les tables:

--Insérer les données pour Themes :
INSERT INTO themes (name, description) VALUES 
  ('Frontend', 'Intéractions avec l''utilisateur'),
  ('Backend', 'Gestion données, architecture'),
  ('Base de données', 'Gestion des données'),
  ('DevOps', 'architecture et sécurité');

--Insérer les données pour Resources :
INSERT INTO resources (title, url, description, type, is_ada, theme_id) VALUES
  ('Introduction à React',	'https://react.dev',	'Guide officiel React', 'guide',	false,	1),
  ('SQL pour débutants',	'https://example.com/sql',	'Cours SQL complet', 'video',	false,	3),
  ('Exercices JavaScript',	'https://example.com/js',	'Pratique JS', 'exercice',	false,	1),
  ('Créer une API en node',	'https://example.com/node',	'Projet node	projet', 'projet',	false,	2);

--Insérer les données pour Skills :
INSERT INTO skills (name) VALUES
  ('JavaScript'),
  ('React'),
  ('SQL'),
  ('PostgreSQL'),
  ('Node.js');

--Insérer les données pour Ressources_skills table de liaison :

INSERT INTO resources_skills (resource_id, skill_id) VALUES
  (1,	1),
  (1,	2),
  (2,	3),
  (2,	4),
  (3,	1),
  (4,	1),
  (4,	5);
