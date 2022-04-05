CREATE TABLE patients (
  id INT SERIAL NOT NULL,
  name VARCHAR(30) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
  id INT SERIAL NOT NULL,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT NOT NULL REFERENCES patients(id),
  status VARCHAR(50),
  PRIMARY KEY(id)
);

CREATE TABLE invoices (
  id INT SERIAL NOT NULL,
  total_amount DECIMAL NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  PRIMARY KEY(id),
  medical_history_id INT NOT NULL REFERENCES medical_histories(id)
);