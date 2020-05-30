--1) Liệt kê các NGK và loại NGK tương ứng.
SELECT * 
FROM NGK N INNER JOIN LOAINGK L
ON N.MALOAINGK = L.MALOAINGK;

--2) Cho biết thông tin về nhà cung cấp ở Thành phố HCM.
SELECT *
FROM NHACC N
WHERE N.DIACHINCC LIKE N'%HCM%';

--3) Liệt kê các hóa đơn mua hàng trong tháng 5/2010.
SELECT *
FROM HOADON H
WHERE YEAR(H.NGAYLAPHD)=2010 AND MONTH(H.NGAYLAPHD)=05

--4) Cho biết tên các nhà cung cấp có cung cấp NGK ‘Coca Cola’.
SELECT DISTINCT N.TENNCC
FROM NGK K INNER JOIN LOAINGK L ON L.MALOAINGK = K.MALOAINGK
INNER JOIN NHACC N ON N.MANCC = L.MANCC
WHERE K.TENNGK LIKE N'%Coca Cola%'

--5) Cho biết tên các nhà cung cấp có thể cung cấp nhiều loại NGK nhất.
SELECT TOP 1 N.TENNCC, SUM(CT.SLDAT) AS TONGSOLUONG
FROM NHACC N INNER JOIN DDH D ON N.MANCC = D.MANCC
INNER JOIN CT_DDH CT ON CT.SODDH = D.SODDH
GROUP BY N.TENNCC

--6) Cho biết tên nhà cung cấp không có khả năng cung cấp NGK có tên ‘Pepsi’.
--(Hướng dẫn: Cách 1: Sử dụng NOT EXISTS. Cách 2: Sử dụng NOT IN)
SELECT DISTINCT N.TENNCC
FROM NHACC N INNER JOIN LOAINGK L ON L.MANCC = N.MANCC
WHERE L.MALOAINGK NOT IN (
	SELECT DISTINCT L.MALOAINGK
	FROM LOAINGK L INNER JOIN NGK N ON L.MALOAINGK = N.MALOAINGK
	WHERE N.TENNGK LIKE N'%Pepsi%'
)

--7) Hiển thị thông tin của NGK chưa bán được.
SELECT *
FROM NGK N 
WHERE N.MANGK NOT IN (
	SELECT DISTINCT CT.MANGK
	FROM CT_HOADON CT
)

--8) Hiển thị tên và tổng số lượng bán của từng NGK.
SELECT N.TENNGK, SUM(CT.SLKHMUA) AS TONGSOLUONGBAN
FROM NGK N INNER JOIN CT_HOADON CT ON N.MANGK = CT.MANGK
GROUP BY N.TENNGK

--9) Hiển thị tên và tổng số lượng của NGK nhập về.
SELECT N.TENNGK, SUM(CT.SLGIAO) AS TONGSOLUONGNHAP
FROM NGK N INNER JOIN CT_PGH CT ON N.MANGK = CT.MANGK
GROUP BY N.TENNGK

--10) Hiển thị ĐĐH đã đặt NGK với số lượng nhiều nhất so với các ĐĐH khác có đặt NGK đó.
--Thông tin hiển thị: SoDDH, MaNGK, [SL đặt nhiều nhất].
SELECT CT.MANGK, CT.SODDH , A.SOLUONGMAX
FROM CT_DDH CT INNER JOIN (
  SELECT MANGK, MAX(SLDAT) AS SOLUONGMAX
  FROM CT_DDH 
  GROUP BY MANGK
  HAVING COUNT(MANGK) > 1
) A 
ON A.MANGK = CT.MANGK
WHERE CT.SLDAT = A.SOLUONGMAX


--11) Hiển thị các NGK không được nhập trong tháng 1/2010.
SELECT DISTINCT N.*
FROM NGK N
WHERE N.MANGK NOT IN(	
	SELECT CT.MANGK
	FROM CT_PGH CT INNER JOIN PHIEUGH P ON P.SOPGH = CT.SOPGH
	WHERE MONTH(P.NGAYGH)=01 AND YEAR(P.NGAYGH)=2010
)

--12) Hiển thị tên các NGK không bán được trong tháng 6/2010.
SELECT DISTINCT N.*
FROM NGK N
WHERE N.MANGK NOT IN(	
	SELECT CT.MANGK
	FROM CT_HOADON CT INNER JOIN HOADON H ON H.SOHD = CT.SOHD
	WHERE MONTH(H.NGAYLAPHD)=6 AND YEAR(H.NGAYLAPHD)=2010
)

--13) Cho biết cửa hàng bán bao nhiêu thứ NGK.
SELECT KH.MAKH, KH.TENKH, COUNT(B.MANGK) AS SOLUONG
FROM KH INNER JOIN (
	SELECT DISTINCT KH.MAKH, A.MANGK
	FROM KH INNER JOIN (
		SELECT H.SOHD, H.MAKH, CT.MANGK
		FROM HOADON H INNER JOIN CT_HOADON CT ON H.SOHD = CT.SOHD
	) A ON A.MAKH = KH.MAKH
) B ON B.MAKH = KH.MAKH
GROUP BY KH.MAKH, KH.TENKH

--14) Cho biết cửa hàng bán bao nhiêu loại NGK.
SELECT KH.MAKH, COUNT(B.MALOAINGK) AS SOLUONG
FROM KH INNER JOIN(
	SELECT DISTINCT KH.MAKH, A.MALOAINGK
	FROM KH INNER JOIN HOADON H ON H.MAKH = KH.MAKH
	INNER JOIN (
		SELECT DISTINCT CT.SOHD, N.MALOAINGK
		FROM CT_HOADON CT INNER JOIN NGK N ON N.MANGK = CT.MANGK
	) A ON A.SOHD = H.SOHD
) B ON B.MAKH = KH.MAKH
GROUP BY KH.MAKH

--15) Hiển thị thông tin của khách hàng có giao dịch với cửa hàng nhiều nhất (căn cứ vào số lần mua hàng).
SELECT KH.*
FROM KH INNER JOIN (
	SELECT TOP 1 KH.MAKH, COUNT(H.MAKH) AS SOLANMUA
	FROM HOADON H INNER JOIN KH ON H.MAKH = KH.MAKH
	GROUP BY KH.MAKH
	ORDER BY SOLANMUA DESC
) A ON A.MAKH = KH.MAKH


--16) Tính tổng doanh thu năm 2010 của cửa hàng.
SELECT SUM(DGBAN*SLKHMUA) AS TONGDT
FROM KH INNER JOIN HOADON H ON H.MAKH = KH.MAKH
INNER JOIN CT_HOADON CT ON CT.SOHD = H.SOHD
WHERE YEAR(H.NGAYLAPHD) = 2010


--17) Liệt kê 5 loại NGK bán chạy nhất (doanh thu) trong tháng 5/2010.
SELECT TOP 5 NGK.MANGK, SUM(DGBAN*SLKHMUA) AS TONGDT
FROM HOADON H INNER JOIN CT_HOADON CT ON CT.SOHD = H.SOHD
INNER JOIN NGK ON NGK.MANGK = CT.MANGK
WHERE YEAR(H.NGAYLAPHD) = 2010 AND MONTH(H.NGAYLAPHD) = 5
GROUP BY NGK.MANGK 
ORDER BY TONGDT DESC



--18) Liệt kê thông tin bán NGK của tháng 5/2010. Thông tin hiển thị: Mã NGK, Tên
--NGK, SL bán.
SELECT N.MANGK, N.TENNGK, SUM(CT.SLKHMUA) AS SOLUONGBAN
FROM NGK N INNER JOIN CT_HOADON CT ON CT.MANGK = N.MANGK
INNER JOIN HOADON H ON H.SOHD = CT.SOHD
WHERE MONTH(H.NGAYLAPHD) =5 AND YEAR(H.NGAYLAPHD) = 2010
GROUP BY N.MANGK, N.TENNGK

--19) Liệt kê thông tin của NGK có nhiều người mua nhất.
SELECT * FROM NGK
WHERE MANGK = (
	SELECT TOP 1 N.MANGK
	FROM NGK N INNER JOIN CT_HOADON CT ON CT.MANGK = N.MANGK
	INNER JOIN HOADON H ON H.SOHD = CT.SOHD
	GROUP BY N.MANGK, N.TENNGK
	ORDER BY SUM(CT.SLKHMUA) DESC
)
--20) Hiển thị ngày nhập hàng gần nhất của cửa hàng.
SELECT TOP 1 P.NGAYGH
FROM CT_PGH C INNER JOIN PHIEUGH P ON C.SOPGH = P.SOPGH
ORDER BY P.NGAYGH DESC

--21) Cho biết số lần mua hàng của khách có mã là ‘KH001’.
SELECT COUNT(*) AS SOLANMUAHANG
FROM HOADON
WHERE MAKH = 'KH01'

--22) Cho biết tổng tiền của từng hóa đơn.
SELECT H.SOHD, SUM(CT.SLKHMUA*CT.DGBAN) AS TONGTIEN
FROM HOADON H INNER JOIN CT_HOADON CT ON CT.SOHD = H.SOHD
GROUP BY H.SOHD

--23) Cho biết danh sách các hóa đơn gồm SoHD, NgaylapHD, MaKH, TenKH và
--tổng trị giá của từng HoaDon. Danh sách sắp xếp tăng dần theo ngày và giảm
--dần theo tổng trị giá của hóa đơn.
SELECT H.SOHD, H.NGAYLAPHD, KH.MAKH, KH.TENKH, SUM(CT.DGBAN*CT.SLKHMUA) AS TONGHD
FROM HOADON H INNER JOIN KH ON KH.MAKH = H.MAKH
INNER JOIN CT_HOADON CT ON CT.SOHD = H.SOHD
GROUP BY H.SOHD, H.NGAYLAPHD, KH.MAKH, KH.TENKH
ORDER BY H.NGAYLAPHD ASC, TONGHD DESC


--24) Cho biết các hóa đơn có tổng trị giá lớn hơn tổng trị giá trung bình của 
-- các hóa đơn trong ngày 18/06/2010.
SELECT H.SOHD, SUM(CT.DGBAN*CT.SLKHMUA) AS TONGBILL
FROM HOADON H INNER JOIN CT_HOADON CT ON CT.SOHD = H.SOHD
GROUP BY H.SOHD
HAVING  SUM(CT.DGBAN*CT.SLKHMUA) >(
	SELECT SUM(CT.SLKHMUA*CT.DGBAN)/COUNT(CT.SOHD) AS TRUNGBINH
	FROM CT_HOADON CT INNER JOIN HOADON H ON H.SOHD = CT.SOHD
	WHERE H.NGAYLAPHD = '2010-06-16'
)

--25) Cho biết số lượng từng NGK tiêu thụ theo từng tháng của năm 2010.
SELECT MONTH(H.NGAYLAPHD) AS THANG, SUM(CT.SLKHMUA) AS TONGSL
FROM NGK INNER JOIN CT_HOADON CT ON NGK.MANGK = CT.MANGK
INNER JOIN HOADON H ON H.SOHD = CT.SOHD
WHERE YEAR(H.NGAYLAPHD) = 2010
GROUP BY MONTH(H.NGAYLAPHD)

--26) Đưa ra danh sách NGK chưa được bán trong tháng 9 năm 2010.
SELECT NGK.*
FROM NGK 
WHERE NGK.MANGK NOT IN(
	SELECT DISTINCT NGK.MANGK
	FROM NGK INNER JOIN CT_HOADON CT ON NGK.MANGK = CT.MANGK
	INNER JOIN HOADON H ON H.SOHD = CT.SOHD
	WHERE MONTH(H.NGAYLAPHD)=5 AND  YEAR(H.NGAYLAPHD) = 2010
)	

--27) Đưa ra danh sách khách hàng có địa chỉ ở TP.HCM và từng mua NGK trong
--tháng 9 năm 2010.
SELECT DISTINCT KH.*
FROM NGK INNER JOIN CT_HOADON CT ON NGK.MANGK = CT.MANGK
INNER JOIN HOADON H ON H.SOHD = CT.SOHD
INNER JOIN KH ON KH.MAKH = H.MAKH
WHERE KH.DCKH LIKE N'%HCM%' 
	AND MONTH(H.NGAYLAPHD)=5 
	AND  YEAR(H.NGAYLAPHD) = 2010

--28) Đưa ra số lượng đã bán tương ứng của từng NGK trong tháng 10 năm 2010.
SELECT DISTINCT NGK.MANGK, SUM(CT.SLKHMUA) AS TONGSLBAN
FROM NGK INNER JOIN CT_HOADON CT ON NGK.MANGK = CT.MANGK
INNER JOIN HOADON H ON H.SOHD = CT.SOHD
WHERE MONTH(H.NGAYLAPHD)=5 
	AND  YEAR(H.NGAYLAPHD) = 2010
GROUP BY NGK.MANGK

--29) Hiển thị thông tin khách hàng đã từng mua và tổng số lượng của từng NGK tại
--cửa hàng.
SELECT DISTINCT KH.MAKH, NGK.MANGK, SUM(CT.SLKHMUA) AS TONGSL
FROM NGK INNER JOIN CT_HOADON CT ON NGK.MANGK = CT.MANGK
INNER JOIN HOADON H ON H.SOHD = CT.SOHD
INNER JOIN KH ON KH.MAKH = H.MAKH
GROUP BY NGK.MANGK, KH.MAKH

--30) Cho biết trong năm 2010, khách hàng nào đã mua nợ nhiều nhất.
SELECT TOP 1 KH.MAKH, KH.TENKH, SUM(N.SOTIENTRA) AS TONGTIENNO
FROM KH INNER JOIN HOADON H ON H.MAKH = KH.MAKH
INNER JOIN PHIEUTRANO N ON N.SOHD = H.SOHD
WHERE YEAR(N.NGAYTRA) = 2010
GROUP BY KH.MAKH, KH.TENKH
ORDER BY TONGTIENNO DESC

--31) Có bao nhiêu hóa đơn chưa thanh toán hết số tiền?
--SELECT H.SOHD, SUM(CT.SLKHMUA*CT.DGBAN) AS TONGTIEN
--FROM HOADON H INNER JOIN PHIEUTRANO N ON N.SOHD = H.SOHD
--INNER JOIN CT_HOADON CT ON CT.SOHD = H.SOHD
--GROUP BY H.SOHD
--WHERE > (
--	SELECT P.SOHD ,SUM(P.SOTIENTRA) AS TONGTIENDATRA
--	FROM PHIEUTRANO P
--	GROUP BY  P.SOHD
--)

--32) Liệt kê các hóa đơn cùng tên của khách hàng tương ứng đã mua NGK và thanh
--toán tiền đầy đủ 1 lần. (Không có phiếu trả nợ)


--33) Thông kê cho biết thông tin đặt hàng của cửa hàng trong năm 2010:
--Mã NGK, Tên NGK, Tổng SL đặt.

--34) Để thuận tiện trong việc tặng quà Tết cho khách hàng, hãy liệt kê danh sách
--khách hàng đã mua NGK với tổng số tiền tương ứng trong năm 2010 (hiển thị
--giảm dần theo số tiền đã mua).

SELECT KH.MAKH, SUM(CT.SLKHMUA * CT.DGBAN) AS TONGTIEN
FROM KH INNER JOIN HOADON H ON H.MAKH = KH.MAKH
INNER JOIN CT_HOADON CT ON CT.SOHD = H.SOHD
GROUP BY KH.MAKH

--35) * Tạo View để tổng hợp dữ liệu về từng NGK đã được bán (Cấu trúc View gồm
--các thuộc tính: MaNGK, TenNGK, DVT, SoLuongBan)
CREATE VIEW V_DanhSachNGKDaBan
AS
	SELECT N.MANGK, N.TENNGK, N.QUYCACH, SUM(CT.SLKHMUA) AS TONGSOLUONGBAN
	FROM NGK N INNER JOIN CT_HOADON CT ON N.MANGK = CT.MANGK
	GROUP BY N.MANGK, N.TENNGK, N.QUYCACH


--36) * Tạo View để tổng hợp dữ liệu về các mặt hàng đã được bán.
CREATE VIEW V_DanhSachMathangDaBan
AS
	SELECT DISTINCT L.*
	FROM LOAINGK L INNER JOIN NGK N ON N.MALOAINGK = L.MALOAINGK
	JOIN CT_HOADON CT ON N.MANGK = CT.MANGK



--37) * Tạo View để tổng hợp dữ liệu về các khách hàng đã mua hàng trong ngày
--20/05/2010.
CREATE VIEW V_DanhSachKHDaMua37
AS
	SELECT KH.*, H.NGAYLAPHD
	FROM KH INNER JOIN HOADON H ON H.MAKH = KH.MAKH
	WHERE H.NGAYLAPHD = '2010-05-20'




--38) * Tạo thủ tục có tham số vào là @SoHD để đưa ra danh mục các NGK có trong
--hóa đơn trên.

CREATE PROC P_FindNGKByBill(@SoHD nchar(10))
AS 
BEGIN
	SELECT N.*
	FROM NGK N INNER JOIN CT_HOADON CT ON CT.MANGK = N.MANGK
	WHERE CT.SOHD = @SoHD
END;

EXEC  P_FindNGKByBill 'HD01';

--39) * Tạo thủ tục có tham số vào là @Ngay để đưa ra danh mục các NGK đã được
--bán vào ngày trên (Danh sách đưa ra gồm các thuộc tính sau: MaNGK,
--TenNGK, DVT, SoLuong).
CREATE PROC P_FindNGKByDate(@Ngay DATETIME)
AS
BEGIN
	SELECT NGK.*
	FROM NGK INNER JOIN CT_HOADON CT ON CT.MANGK = NGK.MANGK
	INNER JOIN HOADON H ON H.SOHD = CT.SOHD
	WHERE H.NGAYLAPHD = @Ngay
END;

DECLARE @date datetime
SET @date = DATEFROMPARTS(2010,05,10)
EXEC P_FindNGKByDate @date


--40) * Tạo TRIGGER để kiểm tra khi nhập dữ liệu vào bảng ChiTietHoaDon nếu
--số lượng hoặc đơn giá nhập vào nhỏ hơn 0 thì in ra màn hình thông báo lỗi “Dữ
--liệu nhập vào không hợp lệ” và bản ghi này không được phép nhập vào bảng.
CREATE TRIGGER T_CheckSoluongDongia ON CT_HOADON
AFTER INSERT,UPDATE
AS
BEGIN
	IF	(SELECT DGBAN FROM inserted) < 0 OR 
		(SELECT SLKHMUA FROM inserted) < 0
	BEGIN
		PRINT N'Dữ liệu nhập vào không hợp lệ';
		ROLLBACK TRANSACTION;
	END;
END;

--41) * Tạo kiểu dữ liệu CURSOR để lưu trữ thông tin về các mặt hàng đã được bán
--trong ngày 20/10/2010, sau đó đưa ra màn hình danh sách dữ liệu trên.
DECLARE NGKDaBan CURSOR FOR (
	SELECT NGK.MANGK, NGK.TENNGK
	FROM NGK INNER JOIN CT_HOADON CT ON CT.MANGK = NGK.MANGK
	INNER JOIN HOADON H ON H.SOHD = CT.SOHD
	WHERE H.NGAYLAPHD = '2010-05-10'
)

DECLARE @ID nchar(10), @title nvarchar(50)
OPEN NGKDaBan
FETCH NEXT FROM NGKDaBan INTO @id, @title
WHILE @@FETCH_STATUS=0
	BEGIN 
		PRINT 'MANGK:' + @id + 'TENNGK:' + @title
		FETCH NEXT FROM NGKDaBan INTO @id, @title
	END;

CLOSE NGKDaBan

DEALLOCATE NGKDaBan 
