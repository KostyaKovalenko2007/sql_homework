CREATE TABLE IF NOT EXISTS public.music_categories (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	"name" varchar NOT NULL,
	CONSTRAINT pkey_tbl PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.musicians (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	"name" varchar NOT NULL,
	CONSTRAINT musicians_pk PRIMARY KEY (id)
);

CREATE TABLE public.albums (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	"name" varchar NOT NULL,
	"year" int4 NULL,
	CONSTRAINT albums_pk PRIMARY KEY (id)
);
CREATE TABLE public.tracks (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	album_id uuid NOT null references albums(id),
	"name" varchar NOT NULL,
	duraion time NOT NULL,
	CONSTRAINT tracks_pk PRIMARY KEY (id)
);

CREATE TABLE public.collections (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	"name" varchar NOT NULL,
	"year" int4 NOT NULL,
	CONSTRAINT collections_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.r_musicians_catigories (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	category uuid NOT NULL REFERENCES music_categories(id),
	musician uuid NOT NULL REFERENCES musicians(id),
	CONSTRAINT musicianscatigories_pk PRIMARY KEY (id)
);
CREATE TABLE public.r_musicians_albums (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	musician uuid NOT null references musicians(id),
	album uuid NOT null references albums(id) ,
	CONSTRAINT r_musicians_albums_pk PRIMARY KEY (id)
);

CREATE TABLE public.r_collections_tracks (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	collection uuid NOT null references collections(id),
	track uuid NOT null references tracks(id),
	CONSTRAINT r_collections_tracks_pk PRIMARY KEY (id)
);

