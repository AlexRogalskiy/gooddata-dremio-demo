\copy insurance.car FROM './data/car.csv' DELIMITER ',' CSV HEADER;
\copy insurance.claim FROM './data/claim.csv' DELIMITER ',' CSV HEADER;
\copy insurance.customer FROM './data/customer.csv' DELIMITER ',' CSV HEADER;
\copy insurance.coverage FROM './data/coverage.csv' DELIMITER ',' CSV HEADER;
\copy insurance.product FROM './data/product.csv' DELIMITER ',' CSV HEADER;
\copy insurance.region FROM './data/region.csv' DELIMITER ',' CSV HEADER;
