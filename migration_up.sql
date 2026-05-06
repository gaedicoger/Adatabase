-- CREATION DES TABLES DANS L'ORDRE LOGIQUE:

-- Créer la table themes :
CREATE TABLE IF NOT EXISTS  public.themes
(
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY, --ne peut pas être null et autogénéré
    name TEXT,
    description TEXT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, --date courante par defaut
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id) --indique clé primaire
);

ALTER TABLE IF EXISTS public.themes
    OWNER to admin;

-- Créer la table skills:
CREATE TABLE IF NOT EXISTS public.skills
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name text,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.skills
    OWNER to admin;

-- Créer les données énumérées resource_type:
CREATE TYPE resource_type AS ENUM ('guide', 'video', 'exercice', 'projet');

-- Créer la table principale pour les ressources pédagogiques:
CREATE TABLE IF NOT EXISTS public.resources
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    type resource_type,
    title text,
    description text,
    url text,
    is_ada boolean,
    theme_id integer,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT "theme id key" FOREIGN KEY (theme_id) --contrainte pour la clé étrangère
        REFERENCES public.themes (id) MATCH SIMPLE -- références à la table correspondante
);

ALTER TABLE IF EXISTS public.resources
    OWNER to admin;

-- Créer la table de liaisons resources_skills :
CREATE TABLE IF NOT EXISTS public.resources_skills
(
    resource_id integer ,
    skill_id integer,
    CONSTRAINT "resource id key" FOREIGN KEY (resource_id)
        REFERENCES public.resources (id) MATCH SIMPLE
        ON UPDATE NO ACTION,
    CONSTRAINT "skill id key" FOREIGN KEY (skill_id)
        REFERENCES public.skills (id) MATCH SIMPLE
);

ALTER TABLE IF EXISTS public.resources_skills
    OWNER to admin;
