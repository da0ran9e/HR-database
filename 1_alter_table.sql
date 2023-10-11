ALTER TABLE countries RENAME TO country_new;

ALTER TABLE locations ADD COLUMN region_id INTEGER;

ALTER TABLE locations ADD COLUMN ID SERIAL FIRST;

ALTER TABLE locations ADD COLUMN region_id INTEGER AFTER state_province;

ALTER TABLE locations ALTER COLUMN country_id TYPE INTEGER;

ALTER TABLE locations DROP COLUMN city;

ALTER TABLE locations RENAME COLUMN state_province TO state;

ALTER TABLE locations ADD PRIMARY KEY (location_id);

ALTER TABLE locations ADD PRIMARY KEY (location_id, country_id);

ALTER TABLE locations DROP CONSTRAINT locations_pkey;

ALTER TABLE job_history ADD CONSTRAINT fk_job_id FOREIGN KEY (job_id) REFERENCES jobs(job_id);

ALTER TABLE job_history ADD CONSTRAINT fk_job_id FOREIGN KEY (job_id) REFERENCES jobs(job_id);

ALTER TABLE job_history DROP CONSTRAINT fk_job_id;

CREATE INDEX indx_job_id ON job_history(job_id);

DROP INDEX indx_job_id;