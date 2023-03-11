CREATE DATABASE PBL5_NhanDien
GO
USE PBL5_NhanDien
GO
CREATE TABLE KHU_VUC
(
    Ma_Khu_Vuc INT PRIMARY KEY  NOT NULL,
	Ten_Khu_Vuc NVARCHAR(50) NOT NULL,
)
GO
SELECT *FROM dbo.KHU_VUC;
GO
CREATE TABLE PHONG_BAN
(
    Ma_Phong_Ban INT identity(1,1) PRIMARY KEY  NOT NULL,
	Ten_Phong_Ban NVARCHAR(100) NOT NULL,
	Ma_Khu_Vuc INT  NOT NULL,
	Diem_Tich_Luy decimal(12,3), -- ĐIỂM TÍCH LŨY KHI MUA HÀNG
	CONSTRAINT fk_htk_Ma_Loai_Khach_Hang FOREIGN KEY (Ma_Khu_Vuc) REFERENCES KHU_VUC (Ma_Khu_Vuc)
)
GO
CREATE TABLE NHAN_VIEN
(
    Ma_Nhan_Vien varchar(50) PRIMARY KEY NOT NULL,
	Ten_Nhan_Vien NVARCHAR(100) NOT NULL,
	Hinh_Anh image not null,
	Gioi_Tinh NVARCHAR(50) ,
	Chuc_Vu NVARCHAR(100) NOT NULL,
	Phan_Quyen BIT NOT NULL,
	Dia_Chi NVARCHAR(150) NOT NULL,
	SDT VARCHAR(20) NOT NULL,
	Mat_Khau VARCHAR(50) NOT NULL,
	Tinh_Trang INT NOT NULL,
	Ma_Phong_Ban INT  NOT NULL,
    CONSTRAINT fk_htk_Ma_Phong_Ban FOREIGN KEY (Ma_Phong_Ban) REFERENCES PHONG_BAN (Ma_Phong_Ban)
)
GO
CREATE TABLE CHAM_CONG
(
    Ma_Cham_Cong INT identity(1,1) PRIMARY KEY NOT NULL,
	Ma_Nhan_Vien varchar(50),-- KHÓA NGOẠI
	Ma_Phong_Ban INT,-- KHÓA NGOẠI
	Ma_Khu_Vuc INT,-- ALLOW NULL VÀ LÀ KHÓA NGOẠI
	Gio_den DATETIME,
	Gio_di DATETIME,
	Tong_Tien decimal(12,3),
	CONSTRAINT fk_hdbh_Ma_Nhan_Vien FOREIGN KEY (Ma_Nhan_Vien) REFERENCES NHAN_VIEN (Ma_Nhan_Vien),
	CONSTRAINT fk_hdbh_Ma_Phong_Ban FOREIGN KEY (Ma_Phong_Ban) REFERENCES PHONG_BAN (Ma_Phong_Ban),
    CONSTRAINT fk_hdbh_Ma_Khu_Vuc FOREIGN KEY (Ma_Khu_Vuc) REFERENCES KHU_VUC (Ma_Khu_Vuc)
)
GO
