


CREATE DATABASE QuanLySinhVien

use QuanLySinhVien

go
CREATE TABLE tb_Khoa
(
MaKhoa char(15) NOT NULL PRIMARY KEY,
TenKhoa nvarchar(50) NOT NULL,
)
go
CREATE TABLE tb_Lop
(
MaLop char(15) NOT NULL  PRIMARY KEY,
TenLop nvarchar(50) NOT NULL,
MaKhoa char(15) NOT NULL,
CONSTRAINT fk_Lop_1 FOREIGN KEY (MaKhoa) REFERENCES tb_Khoa(MaKhoa)
)
go
CREATE TABLE tb_GiangVien
(
MaGv char(15) NOT NULL PRIMARY KEY,
TenGv nvarchar(50) NOT NULL,
ChuyenNganh nvarchar(30) NOT NULL,
MaKhoa char(15) NOT NULL,
CONSTRAINT fk_GiangVien_1 FOREIGN KEY (MaKhoa) REFERENCES tb_Khoa(MaKhoa)
)

go
CREATE TABLE tb_MonHoc
(
MaMh char(15) NOT NULL PRIMARY KEY ,
TenMh nvarchar(50) NOT NULL, 
SoTiet numeric(18,0),
)

go 
CREATE TABLE tb_SinhVien
(
MaSv char(15) NOT NULL PRIMARY KEY,
HoTen nvarchar(50) NOT NULL,
NgaySinh date NOT NULL,
GioiTinh nvarchar(5) NOT NULL,
MaLop char(15) NOT NULL  ,
DTB float NOT NULL,
CONSTRAINT fk_tbSinhVien_1 FOREIGN KEY (MaLop) REFERENCES tb_Lop(MaLop)
)

go

create table tb_KetQua
(
MaSv char(15) NOT NULL,
MaMh char(15) NOT NULL,
LanThi int ,
Diem Float,
constraint KETQUA_pk primary key(MaSv,MaMh),
constraint fk_01_KETQUA FOREIGN KEY (MaMh) REFERENCES tb_MonHoc(MaMh),
constraint fk_02_KETQUA FOREIGN KEY (MaSv) REFERENCES tb_SinhVien(MaSv)
)

select* from tb_Lop

go
INSERT INTO tb_Lop
VALUES ('TH01','CN01','CNTT')
INSERT INTO tb_Lop
VALUES ('TH02','CN02','CNTT')
INSERT INTO tb_Lop
VALUES ('TH03','CN03','CNTT')
INSERT INTO tb_Lop
VALUES ('TH04','CN04','CNTT')
INSERT INTO tb_Lop
VALUES ('TH05','CN05','CNTT')
INSERT INTO tb_Lop
VALUES ('QL05','QUANLY05','QLNH')

select * from tb_Khoa
GO
INSERT INTO tb_Khoa
VALUES ('QLNH','Quan Ly Nha Hang')
INSERT INTO tb_Khoa
VALUES ('TA','Tieng Anh')
INSERT INTO tb_Khoa
VALUES ('TR','Tieng Trung')
INSERT INTO tb_Khoa
VALUES ('XD','Xay Dung')
INSERT INTO tb_Khoa
VALUES ('YK','Y Da Khoa')
INSERT INTO tb_Khoa
VALUES ('YH',N'Y Học')





SELECT *FROM tb_SinhVien
go
INSERT INTO tb_SinhVien 
VALUES ('SV01','Le Quang Tuan','12/06/2006','Nam','TH01',8.3)
INSERT INTO tb_SinhVien 
VALUES ('SV02','Bui Pham Hong Ngoc','03/18/2003','Nu','TH01',9.0)
INSERT INTO tb_SinhVien 
VALUES ('SV03','Nguyen Thu Ha','07/03/2004','Nu','TH01',5.5)
INSERT INTO tb_SinhVien 
VALUES ('SV05','Tran Hai Son','10/10/2002','Nam','TH01',6.0)
INSERT INTO tb_SinhVien 
VALUES ('SV06','Nguyen Quoc Viet','12/06/2001','Nam','TH01',7.3)


DELETE FROM tb_Lop WHERE MaLop='TH05'
DELETE FROM tb_SinhVien WHERE MaSv='SV06'
DELETE FROM tb_SinhVien WHERE MaSv='Ql32'
DELETE FROM tb_Khoa WHERE MaKhoa='XD'

UPDATE tb_SinhVien SET DTB=8.0 WHERE MaSv='SV06'
UPDATE tb_SinhVien SET MaLop='TH02' WHERE MaSv='SV03'
UPDATE tb_SinhVien SET DTB=5.0, MaLop='TH03' WHERE MaSv='SV06'


select MaLop,MaKhoa FROM tb_Lop