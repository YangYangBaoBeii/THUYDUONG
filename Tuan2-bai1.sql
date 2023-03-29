﻿--CREATE DATABASE [QUANLYBANHANG]
--GO

--CREATE TABLE Hangsx (
--    mahangsx Nchar(10) PRIMARY KEY,
--    tenhang Nvarchar(20),
--    diachi Nvarchar(30),
--    sodt Nvarchar(20),
--    email Nvarchar(30)
--);
--CREATE TABLE Sanpham (
--    masp Nchar(10) PRIMARY KEY,
--    mahangsx Nchar(10),
--    tensp Nvarchar(20),
--    soluong Int,
--    mausac Nvarchar(20),
--    giaban Money,
--    donvitinh Nchar(10),
--    mota Nvarchar(Max),
--    FOREIGN KEY (mahangsx) REFERENCES Hangsx(mahangsx)
--);

--CREATE TABLE Nhanvien (
--    manv Nchar(10) PRIMARY KEY,
--    tennv Nvarchar(20),
--    gioitinh Nchar(10),
--    diachi Nvarchar(30),
--    sodt Nvarchar(20),
--    email Nvarchar(30),
--    phong Nvarchar(30)
--);
--CREATE TABLE Nhap (
--    sohdn Nchar(10),
--    masp Nchar(10),
--    manv Nchar(10),
--    ngaynhap Date,
--    soluongN Int,
--	dongiaN money,
--    PRIMARY KEY (sohdn, masp),
--    FOREIGN KEY (masp) REFERENCES Sanpham(masp),
--    FOREIGN KEY (manv) REFERENCES Nhanvien(manv)
--);
--CREATE TABLE Xuat (
--    sohdx NCHAR(10) PRIMARY KEY,
--    masp NCHAR(10) REFERENCES Sanpham(masp),
--    manv NCHAR(10) REFERENCES Nhanvien(manv),
--    ngayxuat DATE,
--    soluongX INT
--);
--INSERT INTO Hangsx (mahangsx, tenhang, diachi, sodt, email)
--VALUES
--('H01', 'Samsung', 'Korea', '011-08271717', 'ss@gmail.com.kr'),
--('H02', 'OPPO', 'China', '081-08626262', 'oppo@gmail.com.cn'),
--('H03', 'Vinfone', 'Việt nam', '084-098262626', 'vf@gmail.com.vn');

--INSERT INTO Nhanvien (manv, tennv, gioitinh, diachi, sodt, email, phong)
--VALUES
--('NV01', 'Nguyễn Thị Thu', 'Nữ', 'Hà Nội', '0982626521', 'thu@gmail.com', 'Kế toán'),
--('NV02', 'Lê Văn Nam', 'Nam', 'Bắc Ninh', '0972525252', 'nam@gmail.com', 'Vật tư'),
--('NV03', 'Trần Hòa Bình', 'Nữ', 'Hà Nội', '0328388388', 'hb@gmail.com', 'Kế toán');

--INSERT INTO Sanpham (masp,mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
--VALUES 
--    ('SP01','H02', 'F1 Plus', 100, 'Xám', 7000000, 'Chiếc', 'Hàng cận cao cấp'),
--    ('SP02','H01', 'Galaxy Note11', 50, 'Đỏ', 1900000, 'Chiếc', 'Hàng cao cấp'),
--    ('SP03','H02', 'F3 lite', 200, 'Nâu', 3000000, 'Chiếc', 'Hàng phổ thông'),
--    ('SP04','H03', 'Vjoy3', 200, 'Xám', 1500000, 'Chiếc', 'Hàng phổ thông'),
--    ('SP05','H01', 'Galaxy V21', 500, 'Nâu', 8000000, 'Chiếc', 'Hàng cận cao cấp');

--INSERT INTO Nhap (sohdn, masp, manv, ngaynhap, soluongN, dongiaN)
--VALUES ('N01', 'SP02', 'NV01', '2019-05-02', 10, 17000000),
--('N02', 'SP01', 'NV02', '2020-07-04', 30, 6000000),
--('N03', 'SP04', 'NV02', '2020-05-17', 20, 1200000),
--('N04', 'SP01', 'NV03', '2020-03-22', 10, 6200000),
--('N05', 'SP05', 'NV01', '2020-07-07', 20, 7000000);

--INSERT INTO Xuat (sohdx, masp, manv, ngayxuat, soluongX)
--VALUES ('X01', 'SP03', 'NV02', '2020-06-14', 5),
--('X02', 'SP01', 'NV03', '2019-03-05', 3),
--('X03', 'SP02', 'NV01', '2020-12-12', 1),
--('X04', 'SP03', 'NV02', '2020-06-02', 2),
--('X05', 'SP05', 'NV01', '2020-05-18', 1);
--------------------------------BAI TAP ------------------------------------------------------------------
----1. Hiển thị thông tin các bảng dữ liệu trên.
Select * From Hangsx
Select * From Nhanvien
Select * From Nhap
Select * From Sanpham
Select * From Xuat

----2. Đưa ra thông tin masp, tensp, tenhang,soluong, mausac, giaban, donvitinh, mota của các sản phẩm sắp xếp theo chiều giảm dần giả bán.
Select masp, tensp, tenhang,soluong, mausac, giaban, donvitinh, mota From Sanpham, Hangsx
order by giaban DESC 

----3. Đưa ra thông tin các sản phẩm có trong cửa hàng do công ty có tên hãng là samsung sản xuất.
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung'
GO

----4. Đưa ra ra thông tin các nhân viên Nữ ở phòng “Kể toán”.
SELECT * FROM nhanvien
WHERE gioitinh = 'Nữ' AND phong = 'Kế toán'
GO

---5. Đưa ra thông tin phiếu nhập gồm: sohdn, masp, tensp, tenhang, soluongN, dongiaN,
----tiennhap=soluongN dongiaN, mausac, donvitinh, ngaynhap, tennv, phong. Sắp xếp theo
----chiều tăng dần của hóa đơn nhập.
SELECT Nhap.sohdn, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Nhap.soluongN, Nhap.dongiaN, Nhap.soluongN*Nhap.dongiaN AS tiennhap, Sanpham.mausac, Sanpham.donvitinh, Nhap.ngaynhap, Nhanvien.tennv, Nhanvien.phong
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
ORDER BY Nhap.sohdn ASC;
----6. Đưa ra thông tin phiếu xuất gồm: sohdx, masp, tensp, tenhang, soluongX, giaban,
----tienxuat-soluongX*giaban, mausac, donvitinh, ngayxuat, tennv, phong trong tháng 10
----năm 2018, sắp xếp theo chiều tăng dần của sohdx.
SELECT Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, 
       Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, 
       Nhanvien.tennv, Nhanvien.phong
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.sohdx ASC;
----7. Đưa ra các thông tin về các hóa đơn mà hãng samsung đã nhập trong năm 2017, gồm:
----sohdn, masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong.
SELECT sohdn, Sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong
FROM Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2017;
----8. Đưa ra Top 10 hỏa đơn xuất có số lượng xuất nhiều nhất trong năm 2018, sắp xếp theo
----chiều giảm dần của soluongX.

----9. Đưa ra thông tin 10 sản phẩm có giá bán cao nhất trong của hàng, theo chiều giảm dẫn
----gia bản.

----10. Đưa ra các thông tin sản phẩm có gia bản từ 100.000 đến 500.000 của hãng samsung.

----11. Tính tổng tiền đã nhập trong năm 2018 của bảng samsung.

----12. Thống kê tổng tiền đã xuất trong ngày 2/9/2018

----13. Đưa ra sohdn, ngaynhap có tiến nhập phải trả cao nhất trong năm 2018

----14. Đưa ra 10 mặt hàng có soluongN nhiều nhất trong năm 2019.

----15. Đưa ra masp.tensp của các sản phẩm do công ty "Samsung' sản xuất do nhân viên có
----mã NV01 nhập.

----16. Dưa ra sohdn masp-soluongN,ngayN của mặt hàng có masp là "SPO?’ được nhận
----viên NV02' xuất.

----17. Đưa ra many tenny đã xuất mặt hàng có mà "SPO2" ngày 03-02-2020