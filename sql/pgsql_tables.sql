DROP TABLE IF EXISTS insurance.car;
CREATE TABLE insurance.car (
	car_id varchar(512) NOT NULL,
	car_make varchar(512) NULL,
	car_model varchar(512) NULL,
	car_gears varchar(512) NULL,
	car_fuel_type varchar(512) NULL,
	car_transmission_type varchar(512) NULL,
	CONSTRAINT car_pkey PRIMARY KEY (car_id)
);


DROP TABLE IF EXISTS insurance.product;
CREATE TABLE insurance.product (
	product_id varchar(512) NOT NULL,
	product_name varchar(512) NULL,
	product_type varchar(512) NULL,
	product_fire_coverage varchar(512) NULL,
	product_legal_defense_coverage varchar(512) NULL,
	product_liability_coverage varchar(512) NULL,
	product_passangers_coverage varchar(512) NULL,
	product_damage_coverage varchar(512) NULL,
	product_theft_coverage varchar(512) NULL,
	product_windshield_coverage varchar(512) NULL,
	CONSTRAINT product_pkey PRIMARY KEY (product_id)
);

DROP TABLE IF EXISTS insurance.customer;
CREATE TABLE insurance.customer (
	customer_id varchar(512) NOT NULL,
	customer_age_group varchar(512) NULL,
	customer_demographic_code varchar(512) NULL,
	customer_gender varchar(512) NULL,
	customer_name varchar(512) NULL,
	region_id char(2) NULL,
	customer_segment varchar(512) NULL,
	wdf__region_id char(2) NOT NULL,
	CONSTRAINT customer_pkey PRIMARY KEY (customer_id)
);
CREATE INDEX customer_region_id_idx ON insurance.customer USING btree (region_id);
CREATE INDEX customer_wdf__region_id ON insurance.customer USING btree (wdf__region_id);

DROP TABLE IF EXISTS insurance.region;
CREATE TABLE insurance.region (
	region_id char(2) NOT NULL,
	region_code char(2) NULL,
	region_name varchar(512) NULL,
	region_crime_rate numeric(5, 2) NULL,
	region_safety_scale numeric(5, 2) NULL,
	wdf__region_id char(2) NOT NULL,
	CONSTRAINT region_pkey PRIMARY KEY (region_id)
);
CREATE UNIQUE INDEX region_wdf__region_id ON insurance.region USING btree (wdf__region_id);

DROP TABLE IF EXISTS insurance.claim;
CREATE TABLE insurance.claim (
	claim_date date NULL,
	claim_amount numeric NULL,
	claim_id varchar(512) NOT NULL,
	product_id varchar(512) NULL,
	car_id varchar(512) NULL,
	customer_id varchar(512) NULL,
	wdf__region_id char(2) NOT NULL,
	CONSTRAINT claim_pkey PRIMARY KEY (claim_id)
);
CREATE INDEX claim_car_id_idx ON insurance.claim USING btree (car_id);
CREATE INDEX claim_customer_id_idx ON insurance.claim USING btree (customer_id);
CREATE INDEX claim_date_idx ON insurance.claim USING btree (claim_date);
CREATE INDEX claim_product_id_idx ON insurance.claim USING btree (product_id);
CREATE INDEX claim_wdf__region_id ON insurance.claim USING btree (wdf__region_id);


DROP TABLE IF EXISTS insurance.coverage;
CREATE TABLE insurance.coverage (
	coverage_id varchar(512) NOT NULL,
	coverage_is_active varchar(512) NULL,
	coverage_payment_is_current varchar(512) NULL,
	coverage_agent varchar(512) NULL,
	coverage_status varchar(512) NULL,
	coverage_created_date date NULL,
	coverage_cancelled_date date NULL,
	coverage_annual_premium numeric(12, 2) NULL,
	coverage_deductible numeric(12, 2) NULL,
	coverage_estimated_car_value numeric(12, 2) NULL,
	coverage_lifetime numeric(12, 2) NULL,
	coverage_accident_probability numeric(12, 2) NULL,
	coverage_risk_score numeric(12, 2) NULL,
	product_id varchar(512) NULL,
	car_id varchar(512) NULL,
	customer_id varchar(512) NULL,
	wdf__region_id char(2) NOT NULL,
	CONSTRAINT coverage_pkey PRIMARY KEY (coverage_id)
);
CREATE INDEX coverage_cancelled_date_idx ON insurance.coverage USING btree (coverage_cancelled_date);
CREATE INDEX coverage_car_id_idx ON insurance.coverage USING btree (car_id);
CREATE INDEX coverage_created_date_idx ON insurance.coverage USING btree (coverage_created_date);
CREATE INDEX coverage_customer_id_idx ON insurance.coverage USING btree (customer_id);
CREATE INDEX coverage_product_id_idx ON insurance.coverage USING btree (product_id);
CREATE INDEX coverage_wdf__region_id ON insurance.coverage USING btree (wdf__region_id);
