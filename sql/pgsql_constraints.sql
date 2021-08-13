ALTER TABLE insurance.customer ADD CONSTRAINT fk_customer_region FOREIGN KEY (region_id) REFERENCES insurance.region(region_id);
ALTER TABLE insurance.coverage ADD CONSTRAINT fk_coverage_car FOREIGN KEY (car_id) REFERENCES insurance.car(car_id);
ALTER TABLE insurance.coverage ADD CONSTRAINT fk_coverage_customer FOREIGN KEY (customer_id) REFERENCES insurance.customer(customer_id);
ALTER TABLE insurance.coverage ADD CONSTRAINT fk_coverage_product FOREIGN KEY (product_id) REFERENCES insurance.product(product_id);
ALTER TABLE insurance.claim ADD CONSTRAINT fk_claim_car FOREIGN KEY (car_id) REFERENCES insurance.car(car_id);
ALTER TABLE insurance.claim ADD CONSTRAINT fk_claim_customer FOREIGN KEY (customer_id) REFERENCES insurance.customer(customer_id);
ALTER TABLE insurance.claim ADD CONSTRAINT fk_claim_product FOREIGN KEY (product_id) REFERENCES insurance.product(product_id);