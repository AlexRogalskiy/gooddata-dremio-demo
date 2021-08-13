
-- DROP EXTENSION foreign_table_exposer;
CREATE EXTENSION foreign_table_exposer;

-- DROP EXTENSION multicorn;
CREATE EXTENSION multicorn;

-- DROP SERVER multicorn_gooddata;
CREATE SERVER multicorn_gooddata FOREIGN DATA WRAPPER multicorn
OPTIONS (
    wrapper 'gooddata_fdw.GoodDataForeignDataWrapper',
    host 'http://host.docker.internal:3000',
    token 'YWRtaW46Ym9vdHN0cmFwOmFkbWluMTIz'
);

-- DROP SCHEMA insurance_insights CASCADE;
CREATE SCHEMA insurance_insights;


IMPORT FOREIGN SCHEMA gooddata_insights FROM SERVER multicorn_gooddata INTO insurance_insights OPTIONS (
    workspace 'insurance-demo'
);

-- DROP SCHEMA insurance_ldm;
CREATE SCHEMA insurance_ldm;

IMPORT FOREIGN SCHEMA gooddata_compute FROM SERVER multicorn_gooddata INTO insurance_ldm OPTIONS (
    workspace 'insurance-demo'
);

-- DROP FOREIGN TABLE claim_amount_by_region;
CREATE FOREIGN TABLE insurance_insights.claim_amount_by_region (
    region VARCHAR OPTIONS (id 'label/region.region_name'),
    claim_amount NUMERIC(13,2) OPTIONS (id 'metric/claim-amount')
)
SERVER multicorn_gooddata
OPTIONS ( workspace 'insurance-demo');

-- SELECT customer_age_group, premium_revenue FROM insurance_ldm.compute c;

-- SELECT * FROM information_schema.foreign_tables WHERE foreign_table_schema = 'insurance_insights';

-- SELECT customer_customer_name, region_region_name, region_region_code, product_product_type, product_product_name, product_product_damage_coverage, product_product_fire_coverage, product_product_legal_defense_coverage, product_product_liability_coverage, product_product_passangers_coverage, product_product_theft_coverage, product_product_windshield_coverage, customer_customer_gender, customer_customer_age_group, car_car_make, claim_amount, coverage_lifetime, net_revenue, premium_revenue FROM insurance_insights.customers;

-- SELECT * FROM insurance_insights.claim_amount_by_region; 

-- SELECT car_make, (premium_revenue - claim_amount) / premium_revenue AS MARGIN FROM insurance_ldm.compute c;

-- select * from insurance_insights.customers; 