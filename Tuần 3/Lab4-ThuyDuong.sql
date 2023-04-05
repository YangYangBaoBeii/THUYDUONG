USE [QUANLYBANHANG]
go

--------------------------------------------- tạo view Lab 2 ----------------------------
--CREATE VIEW View1 AS
--Select * FROM Sanpham;
--go
--Select * from View1;
--go

--CREATE VIEW View2 AS
--SELECT * FROM Hangsx;
--go
--Select * from View2;
--go

--CREATE VIEW View3 AS
--SELECT * FROM Nhanvien;
--go
--Select * from View3;
--go


--CREATE VIEW View4 AS
--SELECT * FROM Nhap;
--go
--Select * from View4;
--go

--CREATE VIEW View5 AS
--SELECT * FROM Xuat;
--go
--Select * from View5;
--go


--CREATE VIEW View6 AS
--SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
--FROM Sanpham
--INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
--go
--Select * from View6 ORDER BY View6.giaban DESC;
--go

--CREATE VIEW View7 AS
--SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, 
--Sanpham.donvitinh, Sanpham.mota
--FROM Sanpham
--INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
--WHERE Hangsx.tenhang = 'Samsung'
--go
--Select * from View7 ;
--go

--CREATE VIEW View8 AS
--SELECT * FROM nhanvien
--WHERE gioitinh = 'Nữ' AND phong = 'Kế toán'
--go
--Select * from View8;
--go

CREATE VIEW mẫu AS
SELECT Nhap.sohdn, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Nhap.soluongN, Nhap.dongiaN, 
Nhap.soluongN*Nhap.dongiaN AS tiennhap, Sanpham.mausac, Sanpham.donvitinh, Nhap.ngaynhap,
Nhanvien.tennv, Nhanvien.phong
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv;
go
Select * from mẫu ORDER BY mẫu.sohdn ASC;
go

--CREATE VIEW View10 AS
--SELECT Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, 
--       Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, 
--       Nhanvien.tennv, Nhanvien.phong
--FROM Xuat
--INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
--INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
--INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
--WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
--go
--Select * from View10 ORDER BY View10.sohdx ASC;
--go

--CREATE VIEW View11 AS
--SELECT sohdn, Sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong FROM Nhap 
--JOIN Sanpham ON Nhap.masp = Sanpham.masp 
--JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
--JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
--WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2017;
--go
--Select * from View11;
--go

--CREATE VIEW View12 AS
--SELECT TOP 10 Xuat.sohdx, Sanpham.tensp, Xuat.soluongX FROM Xuat 
--INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
--WHERE YEAR(Xuat.ngayxuat) = '2018' 
--ORDER BY Xuat.soluongX DESC;
--go
--Select * from View12 ORDER BY View12.soluongX DESC;
--go

--CREATE VIEW View13 AS
--SELECT TOP 10 tenSP, giaBan FROM SanPham
--ORDER BY giaBan DESC;
--go
--Select * from View13 ORDER BY View13.giaBan DESC;
--go

--CREATE VIEW View14 AS
--SELECT masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota
--FROM Sanpham
--JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
--WHERE Hangsx.tenhang = 'Samsung' AND Sanpham.giaban >= 100000 AND Sanpham.giaban <= 500000;
--go
--Select * from View14; 
--go

--CREATE VIEW View15 AS
--SELECT SUM(soluongN * dongiaN) AS tongtien
--FROM Nhap
--JOIN Sanpham ON Nhap.masp = Sanpham.masp
--JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
--WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2018;
--go
--Select * from View15; 
--go

--CREATE VIEW View16 AS
--SELECT SUM(Xuat.soluongX * Sanpham.giaban) AS Tongtien
--FROM Xuat
--INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
--WHERE Xuat.ngayxuat = '2018-09-02';
--go
--Select * from View16 
--go

--CREATE VIEW View17 AS
--SELECT TOP 1 sohdn, ngaynhap, dongiaN FROM Nhap
--ORDER BY dongiaN DESC;
--go
--Select * from View17; 
--go

--CREATE VIEW View18 AS
--SELECT TOP 10 Sanpham.tensp, SUM(Nhap.soluongN) AS TongSoLuongN 
--FROM Sanpham 
--INNER JOIN Nhap ON Sanpham.masp = Nhap.masp 
--WHERE YEAR(Nhap.ngaynhap) = 2019 
--GROUP BY Sanpham.tensp 
--ORDER BY TongSoLuongN DESC;
--go
--Select * from View18; 
--go

--CREATE VIEW View19 AS
--SELECT Sanpham.masp, Sanpham.tensp
--FROM Sanpham
--INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
--INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
--INNER JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
--WHERE Hangsx.tenhang = 'Samsung' AND Nhanvien.manv = 'NV01';
--go
--Select * from View19;
--go

--CREATE VIEW View20 AS
--SELECT sohdn, masp, soluongN, ngaynhap
--FROM Nhap
--WHERE masp = 'SP02' AND manv = 'NV02';
--go
--Select * from View20;
--go

--CREATE VIEW View21 AS
--SELECT Nhanvien.manv, Nhanvien.tennv
--FROM Nhanvien
--INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv
--WHERE Xuat.masp = 'SP02' AND Xuat.ngayxuat = '2020-03-02';
--go
--Select * from View21;
--go

----------------------------------------------- tạo view Lab 3 ------------------------------
--CREATE VIEW L3_C2 AS
--SELECT Sanpham.tensp, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
--FROM Sanpham
--JOIN Nhap ON Sanpham.masp = Nhap.masp
--WHERE YEAR(Nhap.ngaynhap) = 2018
--GROUP BY Sanpham.tensp;
--go
--Select * from L3_C2;
--go


--CREATE VIEW L3_C3 AS
--SELECT Sanpham.tensp, SUM(Xuat.soluongX) AS TongSoLuongXuat
--FROM Sanpham
--JOIN Xuat ON Sanpham.masp = Xuat.masp
--JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
--WHERE Hangsx.tenhang = 'samsung' AND YEAR(Xuat.ngayxuat) = 2018
--GROUP BY Sanpham.tensp
--HAVING SUM(Xuat.soluongX) > 10000;
--go
--Select * from L3_C3;
--go


--CREATE VIEW L3_C4 AS
--SELECT Nhanvien.phong, COUNT(Nhanvien.manv) AS SoLuongNam
--FROM Nhanvien
--WHERE Nhanvien.gioitinh = 'Nam'
--GROUP BY Nhanvien.phong;
--go
--Select * from L3_C4;
--go


--CREATE VIEW L3_C5 AS
--SELECT Hangsx.tenhang, SUM(Nhap.soluongN) AS TongSoLuongNhap
--FROM Hangsx
--JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
--JOIN Nhap ON Sanpham.masp = Nhap.masp
--WHERE YEAR(Nhap.ngaynhap) = 2018
--GROUP BY Hangsx.tenhang;
--go
--Select * from L3_C5;
--go


--CREATE VIEW L3_C6 AS
--SELECT Nhanvien.tennv, SUM(Sanpham.giaban * Xuat.soluongX) AS TongTienXuat
--FROM Nhanvien
--JOIN Xuat ON Nhanvien.manv = Xuat.manv
--JOIN Sanpham ON Xuat.masp = Sanpham.masp
--WHERE YEAR(Xuat.ngayxuat) = 2018
--GROUP BY Nhanvien.tennv;
--go
--Select * from L3_C6;
--go


--CREATE VIEW L3_C7 AS
--SELECT Nhanvien.tennv, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
--FROM Nhanvien
--JOIN Nhap ON Nhanvien.manv = Nhap.manv
--WHERE MONTH(Nhap.ngaynhap) = 8 AND YEAR(Nhap.ngaynhap) = 2018
--GROUP BY Nhanvien.tennv
--HAVING SUM(Nhap.soluongN * Nhap.dongiaN) > 100000;
--go
--Select * from L3_C7;
--go


--CREATE VIEW L3_C8 AS
--SELECT * FROM Sanpham
--WHERE NOT EXISTS (SELECT * FROM Xuat WHERE Sanpham.masp = Xuat.masp);
--go
--Select * from L3_C8;
--go


--CREATE VIEW L3_C9 AS
--SELECT DISTINCT Sanpham.* FROM Sanpham
--INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
--INNER JOIN Xuat ON Sanpham.masp = Xuat.masp
--WHERE YEAR(Nhap.ngaynhap) = 2018 AND YEAR(Xuat.ngayxuat) = 2018;
--go
--Select * from L3_C9;
--go


--CREATE VIEW L3_C10 AS
--SELECT DISTINCT Nhanvien.*
--FROM Nhanvien
--INNER JOIN Nhap ON Nhanvien.manv = Nhap.manv
--INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv;
--go
--Select * from L3_C10;
--go

--CREATE VIEW L3_C11 AS
--SELECT * FROM Nhanvien
--WHERE Nhanvien.manv NOT IN (SELECT DISTINCT manv FROM Nhap)
--  AND Nhanvien.manv NOT IN (SELECT DISTINCT manv FROM Xuat);
--go
--Select * from L3_C11;
--go