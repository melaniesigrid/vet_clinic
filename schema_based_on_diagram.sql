CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(30) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT NOT NULL REFERENCES patients(id),
  status VARCHAR(50),
  PRIMARY KEY(id)
);
CREATE INDEX medical_histories_asc ON medical_histories (id ASC);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  PRIMARY KEY(id),
  medical_history_id INT NOT NULL REFERENCES medical_histories(id)
);
CREATE INDEX invoices_id_asc ON invoices (id ASC);


CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(50),
  name VARCHAR(50),
  PRIMARY KEY(id)
);
CREATE INDEX treatment_id_asc ON treatments (id ASC);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  FOREIGN KEY (invoice_id) REFERENCES invoices (id),
  FOREIGN KEY (treatment_id) REFERENCES treatments (id),
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories_treatments (
  medical_history_id INT,
  treatment_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
  PRIMARY KEY(medical_history_id, treatment_id)
);

