-- Requêtes de recherches :
--============================================================================--

-- Lister les thèmes:
SELECT * FROM themes;

-- Ressources triées par date de mise à jour:
SELECT * FROM resources ORDER BY update_at;

-- Le nom et l'url des ressources de type exercice :
SELECT title, url FROM resources WHERE type='exercice';

-- Le titre et la description des ressources d'Ada uniquement :
SELECT title, description FROM resources WHERE is_ada=true;

-- Les ressources qui ont la compétence JavaScript associée :
SELECT resources.title, resources.url FROM resources
  JOIN resources_skills ON resources.id = resources_skills.resource_id
  JOIN skills ON skills.id = resources_skills.skill_id
  WHERE skills.name ILIKE '%javascript%';

-- Les ressources dont le titre contient le mot "react" (avec ou sans majuscules) :
SELECT * FROM resources WHERE title ILIKE '%react%';

--BONUS:
--============================================================================--

-- La liste des thèmes avec le nombre de ressources par thème
SELECT themes.name, COUNT(resources.id) AS nombre_ressources
  FROM themes
  LEFT JOIN resources ON resources.theme_id = themes.id
  GROUP BY themes.id, themes.name;

-- Le nom et l'url de toutes les ressources avec un tableau/liste contenant l'ensemble de leurs skills associés
SELECT resources.title, resources.url, array_agg(skills.name) AS skills
  FROM resources
  JOIN resources_skills ON resources_skills.resource_id = resources.id
  JOIN skills ON skills.id = resources_skills.skill_id
  GROUP BY resources.id, resources.title;

-- Les 5 ressources les plus récentes avec leur thème:
SELECT * FROM resources
  ORDER BY create_at
  LIMIT 5;

-- Toutes les compétences qui ne sont associées à aucune ressource:
SELECT skills.name FROM skills
  WHERE skills.id NOT IN (SELECT skill_id FROM resources_skills);