CREATE TABLE patients (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(100), 
    date_of_birth date);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY, 
    admitted_at timestamp, 
    patient_id int, 
    status varchar(50), 
    CONSTRAINT fk_patient 
    FOREIGN KEY(patient_id) REFERENCES patients(id));

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(100),
    name VARCHAR(100)
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price decimal,
    quantity int,
    tottal_price decimal,
    invoice_id int REFERENCES invoices(id),
    treatment_id int REFERENCES treatments(id)
);

CREATE TABLE medical_histories_treatment (
    id SERIAL PRIMARY KEY,
    medical_history_id INT REFERENCES medical_histories(id),
    treatment_id INT REFERENCES treatments(id)
);