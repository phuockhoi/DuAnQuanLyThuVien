create database QuanLyThuVien
use QuanLyThuVien
set dateformat dmy
create table NhaXuatBan
(
	MaNXB int identity primary key not null,
	TenNXB nvarchar(50),
	DiaChi nvarchar(255),
	NgayThanhLap datetime,
)
create table ThuThu
(
    MaTT nvarchar(30) primary key not null,
	Hoten nvarchar(255),
	GioiTinh nvarchar(10),
	DiaChi nvarchar(255),
	NgaySinh datetime,
	SoDienThoai nvarchar(20),
)
create table TaiKhoan
(
	MaTK int identity primary key not null,
	TK nvarchar(50),
	MK varchar(50),
	MaTT nvarchar(30),
	Quyen nvarchar(10),
	foreign key (MaTT) references ThuThu(MaTT) on delete cascade
)
create table DocGia
(
	MaDocGia int identity primary key not null,
	Hoten nvarchar(255),
	GioiTinh nvarchar(10),
	DiaChi nvarchar(255),
	NgaySinh datetime,
	SoDienThoai nvarchar(20),
)
create table The
(
	MaThe nvarchar(50) primary key not null,
	MaDocGia int,
	NgayCapThe date,
	NgayHetHan date,
	MaTT nvarchar(30),
	foreign key (MaTT) references ThuThu(MaTT) on delete cascade,
	foreign key (MaDocGia) references DocGia(MaDocGia) on delete cascade
)
create table TheLoai
(
	MaTheLoai nvarchar(20) primary key not null,
	TenLoai nvarchar(50),
)
create table Sach
(
	MaSach int primary key identity not null,
	TenSach nvarchar(255),
	TacGia nvarchar(50),
	MaTheLoai nvarchar(20),
	MaNXB int,
	DonGia int,
	SoLuongTon int,
	SoLanMuon int,
	TinhTrang nvarchar(20),
	foreign key (MaTheLoai) references TheLoai(MaTheLoai) on delete cascade,
	foreign key (MaNXB) references NhaXuatBan(MaNXB) on delete cascade,
)

create table PhieuMuon
(
	MaPhieuMuon int identity primary key not null,
	MaSach int,
	TenSach nvarchar(50),
	MaThe nvarchar(50),
	MaTheLoai nvarchar(20),
	NgayMuon date,
	NgayTra date,
	SoLuongMuon int,
	MaTT nvarchar(30),
	foreign key (MaTT) references ThuThu(MaTT) on delete cascade,
	foreign key (MaSach) references Sach(MaSach) on delete cascade,
	foreign key (MaTheLoai) references TheLoai(MaTheLoai),
	foreign key (MaThe) references The(MaThe) 
)
create table PhieuTra
(
	MaPhieuTra int primary key identity not null,
	MaDocGia int,
	MaThe nvarchar(50),
	MaSach int,
	SoLuongMuon int,
	SoLuongTra int,
	NgayTra date,
	TinhTrangSach nvarchar(10),
	MaTT nvarchar(30),
	foreign key (MaTT) references ThuThu(MaTT) on delete cascade,
	foreign key (MaDocGia) references DocGia(MaDocGia) on delete cascade,
	foreign key (MaThe) references The(MaThe),
	foreign key (MaSach) references Sach(MaSach) on delete cascade,
)
create table QuyDinh
(
	MaQD int primary key identity not null,
	TenQD nvarchar (50),
	SoLuongQD int
)
insert into QuyDinh values(N'Số sách cho mượn tối đa',3)
insert into QuyDinh values(N'Số sách mượn nhiều nhất để thống kê',10)
insert into QuyDinh values(N'Độ tuổi cấp thẻ thư viện',18)

insert into ThuThu values('TT001',N'Nguyễn Anh Khoa',N'Nam',N'Quận 12','22/08/2000','0987656789')
insert into ThuThu values('TT002',N'Lê Anh Tuấn',N'Nam',N'Quận Gò Vấp','22/08/1993','0987656666')
insert into TaiKhoan values('khoa','123','TT001','User')
insert into TaiKhoan values('tuan','123','TT002','User')
insert into TaiKhoan values('admin','123',null,'Admin')

insert into DocGia values(N'Trịnh Hải Nguyên',N'Nam',N'Làng Hoa','22/10/2000','0954586929')
insert into DocGia values(N'Nguyễn Thanh Minh Sơn',N'Nam',N'Làng Lá','21/09/2000','0876543211')
insert into DocGia values(N'Trần Hồ Thiên Phú',N'Nam',N'Làng Cây','01/01/2000','0234567899')

insert into The values(N'T09828929',1,'22/10/2020','22/10/2023','TT001')
insert into The values(N'N01922211',2,'21/09/2020','21/09/2023','TT001')
insert into The values(N'T00332899',3,'01/01/2020','01/09/2023','TT001')

insert into NhaXuatBan values(N'Kim Đồng',N'55 Quang Trung, Nguyễn Du, Hai Bà Trưng, Hà Nội','17/06/1957')

insert into TheLoai values(N'WB',N'WINGS BOOKS')
insert into TheLoai values(N'VHVN',N'Văn học Việt Nam')
insert into TheLoai values(N'VHNC',N'Văn học nước ngoài')
insert into TheLoai values(N'TT',N'Truyện tranh')
insert into TheLoai values(N'KTKH',N'Kiến thức-khoa học')
insert into TheLoai values(N'GMBT',N'Giải mã bản thân')

insert into Sach values(N'Sức mạnh của sự cô đơn',N'Tokio Godo','WB',1,68000,100,120,N'Tốt')
insert into Sach values(N'HOLMES Ở KYOTO',N'Mai Mochizuki','WB',1,75000,100,55,N'Tốt')
insert into Sach values(N'Trường ca ACHILLES',N'Madeline Miller','WB',1,156000,100,33,N'Tốt')
insert into Sach values(N'Thị trấn mèo',N'Nekomaki','WB',1,68000,100,11,N'Tốt')
insert into Sach values(N'Chuyện ma ám ở trang viên BLY',N'Henry James','WB',1,60000,100,10,N'Tốt')

insert into Sach values(N'Dế mèn phiêu lưu ký',N'Tô Hoài-Tạ Huy Long','VHVN',1,150000,100,30,N'Tốt')
insert into Sach values(N'Chiếc gối biết nói',N'Phạm Thị Ngọc Liên','VHVN',1,75000,100,40,N'Tốt')
insert into Sach values(N'Kính vạn hoa',N'Nguyễn Nhật Ánh','VHVN',1,99000,100,21,N'Tốt')


insert into Sach values(N'Học viện viễn thám - Hang hùm',N'Trudi Trueit','VHNC',1,125000,100,9,N'Tốt')
insert into Sach values(N'Peter Pan - Đứa bé không bao giờ lớn',N'J. M. Barrie','VHNC',1,60000,100,22,N'Tốt')


insert into Sach values(N'Tý quậy',N'Đào Hải','TT',1,99000,100,24,N'Tốt')
insert into Sach values(N'Doanh nhân thế giới - FABRÊ',N'Han Kiên','TT',1,30000,100,44,N'Tốt')
insert into Sach values(N'SHIN - Cậu bé bút chì',N'Yoshito Usui','TT',1,20000,100,25,N'Tốt')
insert into Sach values(N'Thế giới xe công trình - Xe nâng cừ khôi',N'Mijika Liuzi','TT',1,26000,100,10,N'Tốt')

insert into Sach values(N'Mười vạn câu hỏi vì sao - Thưởng thức cuộc sống',N'Dư Diệu Đông','KTKH',1,40000,100,51,N'Tốt')
insert into Sach values(N'Tôi tin tôi có thể làm được - Học cách học tập',N'Chu Nam Chiếu - Tôn Vân Hiểu','KTKH',1,45000,100,80,N'Tốt')

insert into Sach values(N'Hồ sơ tính cách 12 con giáp',N'Nhóm Lovedia','GMBT',1,48000,100,12,N'Tốt')
insert into Sach values(N'Định hướng sự nghiệp theo chiêm tinh học',N'Nhóm Lovedia','GMBT',1,30000,100,12,N'Tốt')




