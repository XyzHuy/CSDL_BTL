DELIMITER $$

CREATE PROCEDURE BookAppointment (
    IN patientID INT, -- Tham số đầu vào :ID của bệnh nhân
    IN doctorID INT, --  ID của bác sĩ
    IN appointmentDate DATE, -- Ngày hẹn
    IN appointmentTime TIME, --  Giờ hẹn
    OUT resultMessage VARCHAR(255) -- Tham số đầu ra :Thông điệp kết quả
)
BEGIN
    DECLARE doctorExists INT; -- Biến lưu trạng thái kiểm tra sự tồn tại của bác sĩ
    DECLARE patientExists INT; -- _______________________________________của bệnh nhân
    DECLARE appointmentConflict INT; -- Biến kiểm tra xung đột lịch hẹn

    -- Bắt đầu khối có nhãn
    proc: BEGIN
        -- Kiểm tra xem bác sĩ có tồn tại không
        SELECT COUNT(*) INTO doctorExists
        FROM doctors
        WHERE doctor_id = doctorID; -- Kiểm tra ID bác sĩ trong bảng doctors

        IF doctorExists = 0 THEN -- Nếu bác sĩ không tồn tại
            SET resultMessage = 'Ko tồn tại bác sĩ'; -- Gán thông báo lỗi
            LEAVE proc; -- Thoát khối
        END IF;

        -- Kiểm tra xem bệnh nhân có tồn tại không
        SELECT COUNT(*) INTO patientExists
        FROM patients
        WHERE patient_id = patientID; -- Kiểm tra ID bệnh nhân trong bảng patients

        IF patientExists = 0 THEN -- Nếu bệnh nhân không tồn tại
            SET resultMessage = 'Bệnh nhân ko tồn tại'; -- Gán thông báo lỗi
            LEAVE proc; -- Thoát khỏi khối
        END IF;

        -- Kiểm tra xung đột lịch hẹn với bác sĩ
        SELECT COUNT(*) INTO appointmentConflict
        FROM appointments
        WHERE doctor_id = doctorID -- Kiểm tra ID bác sĩ
          AND appointment_date = appointmentDate -- Cùng ngày hẹn
          AND appointment_time = appointmentTime; -- Cùng giờ hẹn

        IF appointmentConflict > 0 THEN -- Nếu có xung đột lịch hẹn
            SET resultMessage = 'Lịch bị trùng, bác sĩ được chỉ định đang tạm vắng'; -- Gán thông báo lỗi
        ELSE
            -- Thêm lịch hẹn mới vào bảng appointments
            INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, status)
            VALUES (patientID, doctorID, appointmentDate, appointmentTime, 'Scheduled'); -- Trạng thái mặc định là Scheduled

            SET resultMessage = 'Đặt hẹn thành công'; -- Gán thông báo thành công
        END IF;
    END proc; -- Kết thúc khối có nhãn
END$$

DELIMITER ;
