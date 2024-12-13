
INSERT INTO Patients (first_name, last_name, date_of_birth, phone, address, gender, emergency_contact) VALUES
('John', 'Doe', '1980-05-15', '1234567890', '123 Main St, Cityville', 'Male', '9876543210'),
('Jane', 'Smith', '1992-07-22', '9876543210', '456 Elm St, Townsville', 'Female', '8765432109'),
('Alice', 'Johnson', '1985-03-18', '5647382910', '789 Oak St, Villagetown', 'Female', '7654321098'),
('Bob', 'Brown', '1978-12-25', '8765432109', '321 Pine St, Hamletcity', 'Male', '6543210987'),
('Eve', 'Davis', '1990-09-30', '6543210987', '654 Cedar St, Capitaltown', 'Female', '5432109876');


INSERT INTO Doctors (first_name, last_name, specialization, phone, email) VALUES
('Dr. Anna', 'Taylor', 'Cardiologist', '3216549870', 'anna.taylor@hospital.com'),
('Dr. Brian', 'White', 'Neurologist', '7896541230', 'brian.white@hospital.com'),
('Dr. Cathy', 'Lee', 'Pediatrician', '4567893210', 'cathy.lee@hospital.com'),
('Dr. Daniel', 'Harris', 'Orthopedist', '1237894560', 'daniel.harris@hospital.com'),
('Dr. Emma', 'Clark', 'Dermatologist', '9873216540', 'emma.clark@hospital.com');


INSERT INTO Departments (department_name, head_of_department) VALUES
('Cardiology', 1),
('Neurology', 2),
('Pediatrics', 3),
('Orthopedics', 4),
('Dermatology', 5);



INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, status) VALUES
(1, 1, '2024-11-28', '09:00:00', 'Scheduled'),
(2, 2, '2024-11-29', '10:30:00', 'Scheduled'),
(3, 3, '2024-11-30', '11:00:00', 'Completed'),
(4, 4, '2024-12-01', '14:00:00', 'Cancelled'),
(5, 5, '2024-12-02', '15:30:00', 'Scheduled');

-- Insert data into MedicalRecords
INSERT INTO MedicalRecords (patient_id, doctor_id, diagnosis, prescription, record_date) VALUES
(1, 1, 'Hypertension', 'Medication A', '2024-11-25'),
(2, 2, 'Migraine', 'Medication B', '2024-11-25'),
(3, 3, 'Flu', 'Medication C', '2024-11-26'),
(4, 4, 'Fracture', 'Medication D', '2024-11-26'),
(5, 5, 'Eczema', 'Medication E', '2024-11-27');



INSERT INTO Billing (patient_id, appointment_id, amount, payment_status) VALUES
(1, 1, 150.00, 'Paid'),
(2, 2, 200.00, 'Pending'),
(3, 3, 100.00, 'Paid'),
(4, 4, 250.00, 'Cancelled'),
(5, 5, 175.00, 'Pending');

INSERT INTO Staff (first_name, last_name, role, phone, email, department_id) VALUES
('Alice', 'Brown', 'Nurse', '1234567890', 'alice.brown@example.com', 1), -- Cardiology
('John', 'Smith', 'Receptionist', '0987654321', 'john.smith@example.com', 2), -- Neurology
('Emily', 'White', 'Pharmacist', '9876543211', 'emily.white@example.com', 3), -- Pediatrics
('Michael', 'Johnson', 'Inventory Manager', '9876543212', 'michael.johnson@example.com', 4), -- Orthopedics
('Laura', 'Davis', 'Lab Technician', '9876543213', 'laura.davis@example.com', 5); -- Dermatology




INSERT INTO Rooms (room_number, room_type, availability, department_id) VALUES
('101A', 'Single', TRUE, 1),
('102B', 'Double', TRUE, 2),
('103C', 'Single', FALSE, 3),
('104D', 'ICU', TRUE, 4),
('105E', 'Deluxe', FALSE, 5);

INSERT INTO Inventory (item_name, quantity, unit_price, last_updated, department_id, staff_id) VALUES
('Syringes', 200, 1.5, '2024-01-01', 1, 1), -- Alice Brown (Nurse, Department 1)
('Bandages', 500, 0.5, '2024-01-02', 2, 2), -- John Smith (Receptionist, Department 2)
('Paracetamol', 300, 0.2, '2024-01-03', 3, NULL), 
('Antibiotics', 100, 1.8, '2024-01-04', 4, NULL), 
('Gloves', 400, 0.3, '2024-01-05', 5, NULL); 
