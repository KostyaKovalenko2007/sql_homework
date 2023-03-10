-- Создаем основные объеты
-- Музыкальные жанры
CREATE TABLE IF NOT EXISTS music_categories (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	"name" varchar NOT NULL,
	CONSTRAINT pkey_tbl PRIMARY KEY (id)
);
-- Музыканты
CREATE TABLE IF NOT EXISTS musicians (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	"name" varchar NOT NULL,
	CONSTRAINT musicians_pk PRIMARY KEY (id)
);
--Альбомы
CREATE TABLE IF NOT EXISTS albums (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	"name" varchar NOT NULL,
	"year" int4 NULL,
	CONSTRAINT albums_pk PRIMARY KEY (id)
);
-- Треки
CREATE TABLE IF NOT EXISTS tracks (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	album_id uuid NOT null references albums(id),
	"name" varchar NOT NULL,
	duraion time NOT NULL,
	CONSTRAINT tracks_pk PRIMARY KEY (id)
);
--Сборники
CREATE TABLE IF NOT EXISTS collections (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	"name" varchar NOT NULL,
	"year" int4 NOT NULL,
	CONSTRAINT collections_pk PRIMARY KEY (id)
);
--  Создаем таблицы для хранения отношений  многие ко многим
-- Отношение Музыкант-Жанр
CREATE TABLE IF NOT EXISTS r_musicians_catigories (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	category uuid NOT NULL REFERENCES music_categories(id),
	musician uuid NOT NULL REFERENCES musicians(id),
	CONSTRAINT musicianscatigories_pk PRIMARY KEY (id)
);
-- Отношения Музыкант-Альбом
CREATE TABLE IF NOT EXISTS r_musicians_albums (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	musician uuid NOT null references musicians(id),
	album uuid NOT null references albums(id) ,
	CONSTRAINT r_musicians_albums_pk PRIMARY KEY (id)
);
-- Отношения Сборник-Трек
CREATE TABLE IF NOT EXISTS r_collections_tracks (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	collection uuid NOT null references collections(id),
	track uuid NOT null references tracks(id),
	CONSTRAINT r_collections_tracks_pk PRIMARY KEY (id)
);

