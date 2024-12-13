-- Bắt đầu một giao dịch (transaction)
START TRANSACTION;

-- Bước 1:Cập nhật trạng thái phòng (đổi trạng thái phòng từ có sẵn ->không có sẵn)
UPDATE Rooms
SET availability = FALSE
WHERE room_id = 1 and department_id = 1;

-- Bước 2:Cập nhật trạng thái thanh toán hóa đơn (đổi trạng thái từ Pending ->Paid)
UPDATE Billing
SET payment_status = 'Paid'
WHERE bill_id = 2;

-- Nếu cả hai bước trên đều thực hiện thành công, xác nhận giao dịch (commit)
COMMIT;

-- Nếu xảy ra lỗi ở bất kỳ bước nào, hủy bỏ giao dịch (rollback) để đảm bảo tính toàn vẹn dữ liệu
ROLLBACK;
