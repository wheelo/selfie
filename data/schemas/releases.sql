DROP TABLE IF EXISTS releases;
DROP SEQUENCE IF EXISTS release_id_seq;

CREATE SEQUENCE release_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE releases (
    id bigint DEFAULT nextval('release_id_seq'::regclass) NOT NULL,
    app_id bigint NOT NULL,
    platform int NOT NULL,
    note text DEFAULT '',
    version bigint NOT NULL,
    created_at timestamp DEFAULT now() NOT NULL,
    private boolean DEFAULT TRUE NOT NULL
);

ALTER TABLE ONLY releases ADD CONSTRAINT releases_pkey PRIMARY KEY (id);
ALTER TABLE releases ADD FOREIGN KEY (app_id) REFERENCES apps(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- # each platform can have their own versions.
ALTER TABLE releases ADD UNIQUE (app_id, platform, version);
