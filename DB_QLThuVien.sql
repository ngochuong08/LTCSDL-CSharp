CREATE DATABASE DBQuanLyThuVien
go

USE DBQuanLyThuVien
GO
/**** KHỞI TẠO CÁC BẢNG ****/
/* TẠO BẢNG 1 SÁCH */
CREATE TABLE SACH(
MaSach		INT IDENTITY(1,1) PRIMARY KEY,
TenSach		NVARCHAR(50),
TacGia		NVARCHAR(50),
NamXuatBan	DATE,
NhaXuatBan	NVARCHAR(50),
TriGia		VARCHAR(20),
NgayNhap	DATE,
);

/* TẠO BẢNG 2 BẰNG CẤP */
CREATE TABLE BANGCAP(
MaBangCap	INT IDENTITY(1,1) PRIMARY KEY,
TenBangCap	NVARCHAR(50),
);

/* TẠO BẢNG 3 NHÂN VIÊN */
CREATE TABLE NHANVIEN(
MaNhanVien		INT IDENTITY(1,1) PRIMARY KEY,
HoTenNhanVien	NVARCHAR(50),
NgaySinh		DATE,
DiaChi			NVARCHAR(50),
DienThoai		VARCHAR(11),
MaBangCap		INT,

CONSTRAINT	FK_NHANVIEN
FOREIGN KEY	(MaBangCap)
REFERENCES	BANGCAP(MaBangCap)
);

/* TẠO BẢNG 4 ĐỌC GIẢ */
CREATE TABLE DOCGIA(
MaDocGia	INT IDENTITY(1,1) PRIMARY KEY,
HoTenDocGia NVARCHAR(50),
NgaySinh	DATE,
DiaChi		NVARCHAR(50),
Email		CHAR(50),
NgayLapThe	DATE,
NgayHetHan	DATE,
TienNo		INT
)


/* TẠO BẢNG 5 PHIẾU THU TIỀN */
CREATE TABLE PHIEUTHUTIEN(
MaPhieuThuTien	INT IDENTITY(1,1) PRIMARY KEY,
SoTienNo		INT,
SoTienThu		INT,
MaDocGia		INT,
MaNhanVien		INT,

FOREIGN KEY(MaNhanVien)
REFERENCES NHANVIEN(MaNhanVien),

FOREIGN KEY(MaDocGia)
REFERENCES DOCGIA(MaDocGia)
)

/* TẠO BẢNG 6 PHIẾU MƯỢN SÁCH */
CREATE TABLE PHIEUMUONSACH(
MaPhieuMuon INT IDENTITY(1,1) PRIMARY KEY,
NgayMuon DATE,
MaDocGia INT,

FOREIGN KEY(MaDocGia)
REFERENCES DOCGIA(MaDocGia)
)

/* TẠO BẢNG 7 CHI TIẾT PHIẾU MƯỢN */
CREATE TABLE CHITIETPHIEUMUON(
MaSach INT,
MaPhieuMuon INT,
NgayTra date,

PRIMARY KEY(MaSach, MaPhieuMuon),

FOREIGN KEY(MaSach)
REFERENCES SACH(MaSach),
FOREIGN KEY(MaPhieuMuon)
REFERENCES PHIEUMUONSACH(MaPhieuMuon)
)

USE DBQuanLyThuVien
GO

INSERT INTO SACH(TenSach, TacGia, NamXuatBan, NhaXuatBan, TriGia, NgayNhap)
VALUES
(N'OnePiece Tập 91', N'Aoyama Gosho', '2018-05-07', N'Kim Đồng', 21700, '2020-05-12'),
(N'Mắt Biếc (Bản Đặc Biệt)', N'Nguyễn Nhật Ánh', '2019-01-23', N'NXB Trẻ', 220000, '2019-01-24'),
(N'Lũ Trẻ Đường Tàu', N'E.Nesbit', '2020-01-19', N'NXB Trẻ', 39000, '2020-01-20'),
(N'Sống Mòn', N'Nam Cao', '2016-08-06', N'NXB Văn Học', 39530, '2016-08-07'),
(N'ĐI TÌM BẢN SẮC TIẾNG VIỆT', N'Trịnh Sâm', '2018-07-30', N'NXB Trẻ', 65000, '2018-07-31')

INSERT INTO BANGCAP(TenBangCap)
VALUES (N'Cao Đẳng'),
(N'Đại Học'),
(N'Thạc Sĩ'),
(N'Tiến Sĩ')

INSERT INTO NHANVIEN(HoTenNhanVien, NgaySinh, DiaChi, DienThoai, MaBangCap)
VALUES
(N'Nguyễn Văn Bình', '1990-05-07', N'24 Sương Nguyệt Ánh, Q.Gò Vấp, TP.HCM', '0545785358', 1),
(N'Trần Ánh Tuyết', '1982-10-17', N'317 Nguyễn Văn Công, Q.Gò Vấp, TP.HCM', '0324567545', 3),
(N'Võ Minh Tuấn', '1980-03-20', N'897 CMT8, Q.Tân Bình, TP.HCM', '0834642121', 2),
(N'Nguyễn Lê Anh Hải', '1978-06-24', N' 112 Võ Văn Tần, Q.3, TP.HCM', '0246746857', 4),
(N'Lương Xuân Hiệp', '1996-06-13', N'788/43 Nguyễn Kiệm, Q.Qò Vấp, TP.HCM', '0436746059', 2)


INSERT INTO DOCGIA(HoTenDocGia, NgaySinh, DiaChi, Email, NgayLapThe, NgayHetHan, TienNo)
VALUES
(N'Nguyễn Trường Toàn', '2003-05-07', N'24 Lê Hồng Phong, Q.10, TP.HCM', 'toan.nt@gmail.com', '2020-01-20','2020-05-20', 0),
(N'Trần Vũ Hiếu', '2001-10-17', N'117 Nguyễn Trãi, Q.5, TP.HCM','hieu.tv@gmail.com', '2019-12-24','2020-04-24', 20000),
(N'Võ Minh Vương', '2000-03-20', N'97 3 Tháng 2, Q.11, TP.HCM', 'vuong.vm@gmail.com', '2020-02-12','2020-06-12', 32000),
(N'Lê Anh Bảo', '1999-06-24', N' 112 Võ Văn Ngân, Q.2, TP.HCM', 'bao.la@gmail.com', '2020-03-20','2020-07-20', 40000),
(N'Vũ Thị Mai', '2005-06-13', N'88/3 Thành Thái, Q.10, TP.HCM', 'mai.vt@gmail.com', '2020-02-05','2020-06-05', 15000)

INSERT INTO PHIEUTHUTIEN(SoTienNo, SoTienThu, MaDocGia, MaNhanVien)
VALUES
(0, 20000, 1, 2),
(20000, 25000, 2, 1),
(40000, 30000, 4, 3),
(15000, 12000, 5, 5),
(32000, 10000, 3, 4)

INSERT INTO PHIEUMUONSACH(NgayMuon, MaDocGia)
VALUES
('2020-04-05', 1),
('2020-03-20', 2),
('2020-04-01', 4),
('2020-03-29', 5),
('2020-03-17', 3)

INSERT INTO CHITIETPHIEUMUON(MaSach, MaPhieuMuon, NgayTra)
VALUES
(2, 1,null),
(3, 2,'2020-04-11'),
(5, 4,null),
(4, 5,null),
(1, 3,null)