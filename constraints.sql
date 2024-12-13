ALTER TABLE Doctors
ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE Departments
ADD CONSTRAINT fk_department_head FOREIGN KEY (head_of_department) REFERENCES Doctors(doctor_id);

ALTER TABLE Appointments
ADD CONSTRAINT unique_appointment UNIQUE (patient_id, doctor_id, appointment_date, appointment_time);

ALTER TABLE Staff
ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE Rooms
ADD CONSTRAINT fk_rooms_departments FOREIGN KEY (department_id) REFERENCES Departments(department_id),
ADD CONSTRAINT fk_rooms_appointments FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id);

ALTER TABLE Inventory
ADD CONSTRAINT fk_inventory_departments FOREIGN KEY (department_id) REFERENCES Departments(department_id),
ADD CONSTRAINT fk_inventory_staff FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
ADD CONSTRAINT check_quantity CHECK (quantity >= 0),
ADD CONSTRAINT check_unit_price CHECK (unit_price >= 0);


ALTER TABLE Insurance
ADD CONSTRAINT check_coverage_amount CHECK (coverage_amount >= 0),
ADD CONSTRAINT check_expiration_date CHECK (expiration_date IS NOT NULL);

