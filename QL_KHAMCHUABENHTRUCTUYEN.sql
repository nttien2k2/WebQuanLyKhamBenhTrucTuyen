USE [QL_KHAMCHUABENHTRUCTUYEN]
GO
/****** Object:  Table [dbo].[BacSi]    Script Date: 16/12/23 12:34:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BacSi](
	[idBacSi] [int] IDENTITY(1,1) NOT NULL,
	[MaBS] [nvarchar](10) NULL,
	[TenBS] [nvarchar](255) NULL,
	[TrangThai] [int] NULL,
	[KinhNghiem] [nvarchar](255) NULL,
	[KyNangChuyenMon] [nvarchar](255) NULL,
	[SDT] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[GioiThieu] [nvarchar](max) NULL,
	[NgaySinh] [datetime] NULL,
	[QuocTich] [nvarchar](255) NULL,
	[GioiTinh] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idBacSi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BacSiTemp]    Script Date: 16/12/23 12:34:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BacSiTemp](
	[idBacSiTemp] [int] IDENTITY(1,1) NOT NULL,
	[MaBS] [nvarchar](10) NULL,
	[TenBS] [nvarchar](255) NULL,
	[TrangThai] [int] NULL,
	[KinhNghiem] [nvarchar](max) NULL,
	[KyNangChuyenMon] [nvarchar](max) NULL,
	[SDT] [nvarchar](11) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](100) NULL,
	[GioiThieu] [nvarchar](100) NULL,
	[NgaySinh] [datetime] NULL,
	[QuocTich] [nvarchar](100) NULL,
	[GioiTinh] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idBacSiTemp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BangCap]    Script Date: 16/12/23 12:34:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangCap](
	[idBangCap] [int] IDENTITY(1,1) NOT NULL,
	[TenBangCap] [nvarchar](255) NULL,
	[HinhAnh] [nvarchar](255) NULL,
	[idBacSi] [int] NULL,
	[idBacSiTemp] [int] NULL,
	[idProfileBoSung] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idBangCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BenhNhan]    Script Date: 16/12/23 12:34:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenhNhan](
	[idBenhNhan] [int] IDENTITY(1,1) NOT NULL,
	[MaBN] [nvarchar](10) NULL,
	[TenBN] [nvarchar](255) NULL,
	[SDT] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[MaBHYT] [nvarchar](255) NULL,
	[QuocTich] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idBenhNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChungChi]    Script Date: 16/12/23 12:34:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChungChi](
	[idChungChi] [int] IDENTITY(1,1) NOT NULL,
	[TenChungChi] [nvarchar](255) NULL,
	[HinhAnh] [nvarchar](255) NULL,
	[idBacSi] [int] NULL,
	[idBacSiTemp] [int] NULL,
	[idProfileBoSung] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idChungChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KetQuaDuyet]    Script Date: 16/12/23 12:34:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQuaDuyet](
	[idKetQuaDuyet] [int] IDENTITY(1,1) NOT NULL,
	[ThongBao] [nvarchar](255) NULL,
	[NgayDuyet] [datetime] NULL,
	[idBacSiTemp] [int] NULL,
	[BangBoSung] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idKetQuaDuyet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichKham]    Script Date: 16/12/23 12:34:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichKham](
	[idLichKham] [int] IDENTITY(1,1) NOT NULL,
	[TrangThai] [int] NULL,
	[MaLK] [nvarchar](255) NULL,
	[KetQua] [nvarchar](max) NULL,
	[idBacSi] [int] NULL,
	[idBenhNhan] [int] NULL,
	[idPhongKham] [int] NULL,
	[ThoiGianBatDau] [datetime] NULL,
	[ThoiGianKetThuc] [datetime] NULL,
	[GhiChu] [nvarchar](1000) NULL,
	[ThanhTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idLichKham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongKham]    Script Date: 16/12/23 12:34:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongKham](
	[idPhongKham] [int] IDENTITY(1,1) NOT NULL,
	[MaPhongKham] [nvarchar](10) NULL,
	[TenPhongKham] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPhongKham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfileBoSung]    Script Date: 16/12/23 12:34:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileBoSung](
	[idProfileBoSung] [int] IDENTITY(1,1) NOT NULL,
	[idBacSiTemp] [int] NOT NULL,
	[MaBS] [nvarchar](10) NULL,
	[TenBS] [nvarchar](255) NULL,
	[TrangThai] [int] NULL,
	[KinhNghiem] [nvarchar](max) NOT NULL,
	[KyNangChuyenMon] [nvarchar](max) NOT NULL,
	[SDT] [nvarchar](11) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](100) NULL,
	[GioiThieu] [nvarchar](100) NULL,
	[NgaySinh] [datetime] NULL,
	[QuocTich] [nvarchar](100) NULL,
	[GioiTinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProfileBoSung] PRIMARY KEY CLUSTERED 
(
	[idProfileBoSung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 16/12/23 12:34:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[idTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](255) NULL,
	[MatKhau] [nvarchar](255) NULL,
	[Quyen] [int] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BacSi] ON 

INSERT [dbo].[BacSi] ([idBacSi], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (1022, N'BS019', N'Trần Nhật Thái', 1, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'0325478961', N'Khánh Hòa', N'thai@gmail.com', N'Không', CAST(N'1995-02-15T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[BacSi] ([idBacSi], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (1023, N'BS018', N'Trần Nhật Thái', 1, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'0325478961', N'Khánh Hòa', N'thai@gmail.com', N'Không', CAST(N'1995-02-15T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
SET IDENTITY_INSERT [dbo].[BacSi] OFF
GO
SET IDENTITY_INSERT [dbo].[BacSiTemp] ON 

INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (1, N'BS010', N'Nguyễn My', 3, N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'04654684', N'Tp.HCM', N'nm@gmail.com', N'Y tá ở bệnh viện Lâm Đồng', CAST(N'1999-05-07T00:00:00.000' AS DateTime), N'Việt Nam', N'Nữ')
INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (3, N'BS012', N'Ngô Văn Ninh', 3, N'["Bác sĩ, Trưởng khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'03879654', N'Hà Nội', N'nvn@gmail.com', N'Bác sĩ ở nha khoa', CAST(N'1991-12-08T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (4, N'BS011', N'Nguyễn Văn Nam', 3, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'03156654', N'Tây Ninh', N'nvn@gmail.com', N'Bác sĩ ở nha khoa', CAST(N'1995-09-08T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (5, N'BS01', N'Nguyễn Văn Ngọc', 3, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'0963254178', N'Cà Mau', N'ngoc@gmail.com', N'Không', CAST(N'1982-05-12T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (6, N'BS02', N'La Văn Tấn', 3, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'0369874529', N'Bình Phước', N'tan@gmail.com', N'Không', CAST(N'1979-10-10T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (7, N'BS03', N'Nguyễn Tấn Phát', 3, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'0365214789', N'Tây Ninh', N'phat@gmail.com', N'Không', CAST(N'1969-03-12T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (8, N'BS04', N'Trần Nhật Thái', 3, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'0325478961', N'Khánh Hòa', N'thai@gmail.com', N'Không', CAST(N'1995-02-15T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (10, N'BS013', N'Trần Nhật Thái', 3, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'0325478961', N'Khánh Hòa', N'thai@gmail.com', N'Không', CAST(N'1995-02-15T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (11, N'BS014', N'Trần Nhật Thái', 3, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'0325478961', N'Khánh Hòa', N'thai@gmail.com', N'Không', CAST(N'1995-02-15T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (12, N'BS015', N'Trần Nhật Thái', 3, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'0325478961', N'Khánh Hòa', N'thai@gmail.com', N'Không', CAST(N'1995-02-15T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (13, N'BS016', N'Trần Nhật Thái', 3, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'0325478961', N'Khánh Hòa', N'thai@gmail.com', N'Không', CAST(N'1995-02-15T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (14, N'BS017', N'Trần Nhật Thái', 2, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'0325478961', N'Khánh Hòa', N'thai@gmail.com', N'Không', CAST(N'1995-02-15T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (15, N'BS018', N'Trần Nhật Thái', 1, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'0325478961', N'Khánh Hòa', N'thai@gmail.com', N'Không', CAST(N'1995-02-15T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[BacSiTemp] ([idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (16, N'BS019', N'Trần Nhật Thái', 1, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022","Bác sĩ điều trị : Bệnh viện quốc tế Mỹ, thành phố Nha Trang 09/2010 - 04/2022"]', N'0325478961', N'Khánh Hòa', N'thai@gmail.com', N'Không', CAST(N'1995-02-15T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
SET IDENTITY_INSERT [dbo].[BacSiTemp] OFF
GO
SET IDENTITY_INSERT [dbo].[BangCap] ON 

INSERT [dbo].[BangCap] ([idBangCap], [TenBangCap], [HinhAnh], [idBacSi], [idBacSiTemp], [idProfileBoSung]) VALUES (11, N'THPT', N'thpt.jpg', 1023, 15, 2)
INSERT [dbo].[BangCap] ([idBangCap], [TenBangCap], [HinhAnh], [idBacSi], [idBacSiTemp], [idProfileBoSung]) VALUES (12, N'Đại học', N'dh.jpg', 1023, 15, 2)
INSERT [dbo].[BangCap] ([idBangCap], [TenBangCap], [HinhAnh], [idBacSi], [idBacSiTemp], [idProfileBoSung]) VALUES (13, N'Đại học', N'dh.jpg', NULL, 14, NULL)
SET IDENTITY_INSERT [dbo].[BangCap] OFF
GO
SET IDENTITY_INSERT [dbo].[BenhNhan] ON 

INSERT [dbo].[BenhNhan] ([idBenhNhan], [MaBN], [TenBN], [SDT], [DiaChi], [MaBHYT], [QuocTich]) VALUES (1, N'BN01', N'Nguyễn Công Phượng', N'0352147896', N'Nghệ An', N'7458963214', N'Việt Nam')
INSERT [dbo].[BenhNhan] ([idBenhNhan], [MaBN], [TenBN], [SDT], [DiaChi], [MaBHYT], [QuocTich]) VALUES (2, N'BN02', N'Nguyễn Tiến Linh', N'0578963214', N'Bình Dương', N'9654782314', N'Việt Nam')
INSERT [dbo].[BenhNhan] ([idBenhNhan], [MaBN], [TenBN], [SDT], [DiaChi], [MaBHYT], [QuocTich]) VALUES (3, N'BN03', N'Nguyễn Quang Hải', N'0632145879', N'Hà Nội', N'9625147853', N'Việt Nam')
INSERT [dbo].[BenhNhan] ([idBenhNhan], [MaBN], [TenBN], [SDT], [DiaChi], [MaBHYT], [QuocTich]) VALUES (4, N'BN04', N'Nguyễn Văn Toàn', N'0652147896', N'Hải Dương', N'9651247896', N'Việt Nam')
INSERT [dbo].[BenhNhan] ([idBenhNhan], [MaBN], [TenBN], [SDT], [DiaChi], [MaBHYT], [QuocTich]) VALUES (5, N'BN05', N'Lê Vi', N'0632145879', N'Cẩm Giang', N'9651247853', N'Việt Nam')
SET IDENTITY_INSERT [dbo].[BenhNhan] OFF
GO
SET IDENTITY_INSERT [dbo].[ChungChi] ON 

INSERT [dbo].[ChungChi] ([idChungChi], [TenChungChi], [HinhAnh], [idBacSi], [idBacSiTemp], [idProfileBoSung]) VALUES (11, N'Toeic', N'toeic.jpg', NULL, 14, NULL)
INSERT [dbo].[ChungChi] ([idChungChi], [TenChungChi], [HinhAnh], [idBacSi], [idBacSiTemp], [idProfileBoSung]) VALUES (12, N'ielts', N'ielts.jpg', NULL, 15, 2)
SET IDENTITY_INSERT [dbo].[ChungChi] OFF
GO
SET IDENTITY_INSERT [dbo].[KetQuaDuyet] ON 

INSERT [dbo].[KetQuaDuyet] ([idKetQuaDuyet], [ThongBao], [NgayDuyet], [idBacSiTemp], [BangBoSung]) VALUES (1035, N'Mờ', CAST(N'2023-12-15T23:23:41.967' AS DateTime), 14, N'["Tên bác sĩ","Giới thiệu","SĐT","Quốc tịch"]')
SET IDENTITY_INSERT [dbo].[KetQuaDuyet] OFF
GO
SET IDENTITY_INSERT [dbo].[PhongKham] ON 

INSERT [dbo].[PhongKham] ([idPhongKham], [MaPhongKham], [TenPhongKham]) VALUES (1, N'A301', N'Nội soi')
INSERT [dbo].[PhongKham] ([idPhongKham], [MaPhongKham], [TenPhongKham]) VALUES (2, N'B102', N'Siêu âm')
INSERT [dbo].[PhongKham] ([idPhongKham], [MaPhongKham], [TenPhongKham]) VALUES (3, N'C115', N'Chụp X-Quang')
SET IDENTITY_INSERT [dbo].[PhongKham] OFF
GO
SET IDENTITY_INSERT [dbo].[ProfileBoSung] ON 

INSERT [dbo].[ProfileBoSung] ([idProfileBoSung], [idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (2, 15, N'BS018', N'Trần Nhật Thái Nam', 2, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ, Phụ khoa"]', N'0325478961', N'Khánh Hòa', N'thai@gmail.com', N'Bác sĩ ở nha khoa', CAST(N'1995-02-15T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
INSERT [dbo].[ProfileBoSung] ([idProfileBoSung], [idBacSiTemp], [MaBS], [TenBS], [TrangThai], [KinhNghiem], [KyNangChuyenMon], [SDT], [DiaChi], [Email], [GioiThieu], [NgaySinh], [QuocTich], [GioiTinh]) VALUES (6, 14, N'BS017', N'Nguyễn Văn Ninh', 2, N'["Bác sĩ, Phụ khoa"]', N'["Bác sĩ, Phụ khoa"]', N'0325478961', N'Tây Ninh', N'ninh@gmail.com', N'Bác sĩ ở nha khoa', CAST(N'1995-02-15T00:00:00.000' AS DateTime), N'Việt Nam', N'Nam')
SET IDENTITY_INSERT [dbo].[ProfileBoSung] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([idTaiKhoan], [TenDangNhap], [MatKhau], [Quyen], [TrangThai]) VALUES (6, N'admin', N'202cb962ac59075b964b07152d234b70', 1, 1)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__BacSi__2724759782F82B8B]    Script Date: 16/12/23 12:34:46 SA ******/
ALTER TABLE [dbo].[BacSi] ADD UNIQUE NONCLUSTERED 
(
	[MaBS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__BenhNhan__272475AC85897A6A]    Script Date: 16/12/23 12:34:46 SA ******/
ALTER TABLE [dbo].[BenhNhan] ADD UNIQUE NONCLUSTERED 
(
	[MaBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PhongKha__D31EFFBB0E0C4A60]    Script Date: 16/12/23 12:34:46 SA ******/
ALTER TABLE [dbo].[PhongKham] ADD UNIQUE NONCLUSTERED 
(
	[MaPhongKham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__55F68FC08A612B12]    Script Date: 16/12/23 12:34:46 SA ******/
ALTER TABLE [dbo].[TaiKhoan] ADD UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BangCap]  WITH CHECK ADD FOREIGN KEY([idBacSi])
REFERENCES [dbo].[BacSi] ([idBacSi])
GO
ALTER TABLE [dbo].[BangCap]  WITH CHECK ADD  CONSTRAINT [FK_BangCap_BacSiTemp] FOREIGN KEY([idBacSiTemp])
REFERENCES [dbo].[BacSiTemp] ([idBacSiTemp])
GO
ALTER TABLE [dbo].[BangCap] CHECK CONSTRAINT [FK_BangCap_BacSiTemp]
GO
ALTER TABLE [dbo].[BangCap]  WITH CHECK ADD  CONSTRAINT [FK_BangCap_ProfileBoSung] FOREIGN KEY([idProfileBoSung])
REFERENCES [dbo].[ProfileBoSung] ([idProfileBoSung])
GO
ALTER TABLE [dbo].[BangCap] CHECK CONSTRAINT [FK_BangCap_ProfileBoSung]
GO
ALTER TABLE [dbo].[ChungChi]  WITH CHECK ADD FOREIGN KEY([idBacSi])
REFERENCES [dbo].[BacSi] ([idBacSi])
GO
ALTER TABLE [dbo].[ChungChi]  WITH CHECK ADD  CONSTRAINT [FK_ChungChi_BacSiTemp] FOREIGN KEY([idBacSiTemp])
REFERENCES [dbo].[BacSiTemp] ([idBacSiTemp])
GO
ALTER TABLE [dbo].[ChungChi] CHECK CONSTRAINT [FK_ChungChi_BacSiTemp]
GO
ALTER TABLE [dbo].[ChungChi]  WITH CHECK ADD  CONSTRAINT [FK_ChungChi_ProfileBoSung] FOREIGN KEY([idProfileBoSung])
REFERENCES [dbo].[ProfileBoSung] ([idProfileBoSung])
GO
ALTER TABLE [dbo].[ChungChi] CHECK CONSTRAINT [FK_ChungChi_ProfileBoSung]
GO
ALTER TABLE [dbo].[KetQuaDuyet]  WITH CHECK ADD  CONSTRAINT [fk_KQD_BSTemp] FOREIGN KEY([idBacSiTemp])
REFERENCES [dbo].[BacSiTemp] ([idBacSiTemp])
GO
ALTER TABLE [dbo].[KetQuaDuyet] CHECK CONSTRAINT [fk_KQD_BSTemp]
GO
ALTER TABLE [dbo].[LichKham]  WITH CHECK ADD FOREIGN KEY([idBacSi])
REFERENCES [dbo].[BacSi] ([idBacSi])
GO
ALTER TABLE [dbo].[LichKham]  WITH CHECK ADD FOREIGN KEY([idBenhNhan])
REFERENCES [dbo].[BenhNhan] ([idBenhNhan])
GO
ALTER TABLE [dbo].[LichKham]  WITH CHECK ADD FOREIGN KEY([idPhongKham])
REFERENCES [dbo].[PhongKham] ([idPhongKham])
GO
ALTER TABLE [dbo].[ProfileBoSung]  WITH CHECK ADD  CONSTRAINT [FK_ProfileBoSung_BacSiTemp] FOREIGN KEY([idBacSiTemp])
REFERENCES [dbo].[BacSiTemp] ([idBacSiTemp])
GO
ALTER TABLE [dbo].[ProfileBoSung] CHECK CONSTRAINT [FK_ProfileBoSung_BacSiTemp]
GO
