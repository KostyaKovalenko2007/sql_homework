CREATE TABLE org_structure (
	id uuid NOT NULL DEFAULT uuid_generate_v1(),
	emp_name varchar NOT NULL,
	dep_name varchar NOT NULL,
	reports_to uuid NOT NULL,
	CONSTRAINT org_structure_check CHECK (reports_to = id),
	CONSTRAINT org_structure_pk PRIMARY KEY (id)
);
