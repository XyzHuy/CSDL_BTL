-- Tạo trigger để thêm hồ sơ y tế sau khi cuộc hẹn được hoàn thành
DELIMITER $$

CREATE TRIGGER after_appointment_completed
AFTER UPDATE ON Appointments
FOR EACH ROW
BEGIN
    -- Kiểm tra nếu trạng thái cuộc hẹn được cập nhật thành 'Completed'
    IF NEW.status = 'Completed' THEN
        -- Thêm bản ghi mới vào bảng MedicalRecords
        INSERT INTO MedicalRecords (patient_id, doctor_id, diagnosis, prescription, record_date)
        VALUES (NEW.patient_id, NEW.doctor_id, 'Chưa cập nhật', 'Chưa cập nhật', NOW());
    END IF;
END$$

DELIMITER ;
