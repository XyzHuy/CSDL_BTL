-- a. Truy vấn sử dụng INNER JOIN: Lấy tất cả các lịch hẹn cùng thông tin chi tiết của bệnh nhân và bác sĩ
SELECT 
    a.appointment_id,
    p.first_name AS patient_name,
    d.first_name AS doctor_name,
    a.appointment_date,
    a.appointment_time,
    a.status
FROM 
    Appointments a
INNER JOIN 
    Patients p ON a.patient_id = p.patient_id
INNER JOIN 
    Doctors d ON a.doctor_id = d.doctor_id;

--  b. Truy vấn sử dụng OUTER JOIN: Lấy tất cả các phòng kèm thông tin chi tiết của khoa, bao gồm các khoa không có phòng
SELECT 
    r.room_id,
    r.room_number,
    r.room_type,
    r.availability,
    d.department_name
FROM 
    Rooms r
RIGHT OUTER JOIN 
    Departments d ON r.department_id = d.department_id;

-- c. Truy vấn sử dụng subquery trong WHERE: Lấy tất cả các bác sĩ đã từng điều trị ít nhất một bệnh nhân với lịch hẹn đã hoàn thành
SELECT 
    d.doctor_id,
    d.first_name,
    d.last_name
FROM 
    Doctors d
WHERE 
    d.doctor_id IN (
        SELECT 
            a.doctor_id
        FROM 
            Appointments a
        WHERE 
            a.status = 'Completed'
    );

-- d. Truy vấn sử dụng subquery trong FROM: Lấy tổng số bệnh nhân mà mỗi bác sĩ đã điều trị
SELECT 
    doc.first_name AS doctor_name,
    COUNT(*) AS total_patients
FROM 
    (SELECT 
         a.doctor_id, p.patient_id
     FROM 
         Appointments a
     INNER JOIN 
         Patients p ON a.patient_id = p.patient_id
     GROUP BY 
         a.doctor_id, p.patient_id) AS patient_summary
INNER JOIN 
    Doctors doc ON patient_summary.doctor_id = doc.doctor_id
GROUP BY 
    doc.first_name;

-- e. Truy vấn sử dụng GROUP BY và các hàm tổng hợp: Lấy tổng doanh thu và số lượng lịch hẹn của từng bác sĩ
SELECT 
    d.first_name AS doctor_name,
    COUNT(a.appointment_id) AS total_appointments,
    SUM(b.amount) AS total_revenue
FROM 
    Doctors d
INNER JOIN 
    Appointments a ON d.doctor_id = a.doctor_id
INNER JOIN 
    Billing b ON a.appointment_id = b.appointment_id
WHERE 
    b.payment_status = 'Paid'
GROUP BY 
    d.first_name;
