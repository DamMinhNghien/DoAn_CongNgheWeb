USE [DoAnWeb]
GO
/****** Object:  Table [dbo].[BaiHat]    Script Date: 11/14/2023 11:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiHat](
	[IDBaiHat] [int] IDENTITY(1,1) NOT NULL,
	[TenBaiHat] [nvarchar](50) NULL,
	[TacGia] [nvarchar](50) NULL,
	[MoTa] [nvarchar](255) NULL,
	[NgayPhatHanh] [date] NULL,
	[AnhBH] [varchar](50) NULL,
	[IDChuDe] [int] NULL,
	[QuocGia] [varchar](50) NULL,
	[DuongDan] [varchar](max) NULL,
	[LuotXem] [int] NULL,
	[BiDanh] [varchar](50) NULL,
 CONSTRAINT [PK_BaiHat] PRIMARY KEY CLUSTERED 
(
	[IDBaiHat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaiHatPlayListCN]    Script Date: 11/14/2023 11:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiHatPlayListCN](
	[IDPlayList] [int] NOT NULL,
	[IDBaiHat] [int] NOT NULL,
 CONSTRAINT [PK_BaiHatPlayListCN] PRIMARY KEY CLUSTERED 
(
	[IDPlayList] ASC,
	[IDBaiHat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 11/14/2023 11:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[IDTK] [int] NOT NULL,
	[IDBaiHat] [int] NOT NULL,
	[BinhLuan] [nvarchar](255) NULL,
	[NgayGio] [datetime] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IDTK] ASC,
	[IDBaiHat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaSi]    Script Date: 11/14/2023 11:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaSi](
	[BiDanh] [varchar](50) NOT NULL,
	[TenCaSi] [nvarchar](50) NULL,
	[AnhCS] [varchar](50) NULL,
 CONSTRAINT [PK_CaSi] PRIMARY KEY CLUSTERED 
(
	[BiDanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 11/14/2023 11:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[IDChuDe] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](50) NULL,
	[AnhPLM] [varchar](50) NULL,
	[MoTaChuDe] [nvarchar](255) NULL,
 CONSTRAINT [PK_PlayListMenu] PRIMARY KEY CLUSTERED 
(
	[IDChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 11/14/2023 11:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[IDTK] [int] NOT NULL,
	[IDBaiHat] [int] NOT NULL,
	[DiemDG] [int] NULL,
 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[IDTK] ASC,
	[IDBaiHat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSu]    Script Date: 11/14/2023 11:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSu](
	[IDTK] [int] NOT NULL,
	[IDBaiHat] [int] NOT NULL,
	[NgayXem] [datetime] NULL,
 CONSTRAINT [PK_LichSu] PRIMARY KEY CLUSTERED 
(
	[IDTK] ASC,
	[IDBaiHat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayListCaNhan]    Script Date: 11/14/2023 11:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayListCaNhan](
	[IDPlayList] [int] IDENTITY(1,1) NOT NULL,
	[IDTK] [int] NULL,
	[AnhPL] [varchar](50) NULL,
	[TenPlayList] [nvarchar](50) NULL,
 CONSTRAINT [PK_PlayListCaNhan] PRIMARY KEY CLUSTERED 
(
	[IDPlayList] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/14/2023 11:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[IDTK] [int] IDENTITY(1,1) NOT NULL,
	[TenTK] [varchar](50) NULL,
	[MatKhau] [varchar](20) NULL,
	[NgayLap] [datetime] NULL,
	[TrangThai] [varchar](20) NULL,
	[LoaiTK] [varchar](50) NULL,
	[SDT] [varchar](20) NULL,
	[TopSQL] [varchar](max) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[IDTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopBXH]    Script Date: 11/14/2023 11:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopBXH](
	[IDTop] [int] NOT NULL,
	[TenTop] [nvarchar](50) NULL,
	[AnhTOP] [varchar](50) NULL,
	[MotaTop] [nvarchar](255) NULL,
	[TopCategories] [varchar](255) NULL,
 CONSTRAINT [PK_TopBXH] PRIMARY KEY CLUSTERED 
(
	[IDTop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BaiHat] ON 

INSERT [dbo].[BaiHat] ([IDBaiHat], [TenBaiHat], [TacGia], [MoTa], [NgayPhatHanh], [AnhBH], [IDChuDe], [QuocGia], [DuongDan], [LuotXem], [BiDanh]) VALUES (1, N'Em của ngày hôm qua', N'Sơn Tùng-MTP', N'Ðây là bài hát', CAST(N'2022-01-22' AS Date), N'ec.jpg', 1, N'VietNam', N'<iframe width="700" height="400" src="https://www.youtube.com/embed/Vt4kAu-ziRY?si=KssDHyQz_blnJkk3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 5, N'MTP')
INSERT [dbo].[BaiHat] ([IDBaiHat], [TenBaiHat], [TacGia], [MoTa], [NgayPhatHanh], [AnhBH], [IDChuDe], [QuocGia], [DuongDan], [LuotXem], [BiDanh]) VALUES (3, N'Champion league', N'FiFa', N'Ðây là bài hát fifa', CAST(N'2022-01-26' AS Date), N'cris.jpg', 1, N'VietNam', N'<iframe width="700" height="400" src="https://www.youtube.com/embed/zwV3h1vqU0A?si=-mnhdvEo-eUyZ0W2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>', 6, N'cr7')
SET IDENTITY_INSERT [dbo].[BaiHat] OFF
GO
INSERT [dbo].[CaSi] ([BiDanh], [TenCaSi], [AnhCS]) VALUES (N'100milion', N'an tôn ni', N'MU.jpg')
INSERT [dbo].[CaSi] ([BiDanh], [TenCaSi], [AnhCS]) VALUES (N'5Milion', N'jack', N'th.jpg')
INSERT [dbo].[CaSi] ([BiDanh], [TenCaSi], [AnhCS]) VALUES (N'cr7', N'Minh Nghiên', N'ronan.jpg')
INSERT [dbo].[CaSi] ([BiDanh], [TenCaSi], [AnhCS]) VALUES (N'MTP', N'Sơn Tùng', N'mtp.jpg')
GO
SET IDENTITY_INSERT [dbo].[ChuDe] ON 

INSERT [dbo].[ChuDe] ([IDChuDe], [TenChuDe], [AnhPLM], [MoTaChuDe]) VALUES (1, N'Minh đức', N'test3.jpg', N'')
INSERT [dbo].[ChuDe] ([IDChuDe], [TenChuDe], [AnhPLM], [MoTaChuDe]) VALUES (2, N'tienThái', N'test2.jpg', N'')
INSERT [dbo].[ChuDe] ([IDChuDe], [TenChuDe], [AnhPLM], [MoTaChuDe]) VALUES (3, N'tân việt', N'test1.jpg', N'')
INSERT [dbo].[ChuDe] ([IDChuDe], [TenChuDe], [AnhPLM], [MoTaChuDe]) VALUES (4, N'jack', N'OIP.jpg', N'')
INSERT [dbo].[ChuDe] ([IDChuDe], [TenChuDe], [AnhPLM], [MoTaChuDe]) VALUES (5, N'cao', N'OIP1.jpg', N'')
INSERT [dbo].[ChuDe] ([IDChuDe], [TenChuDe], [AnhPLM], [MoTaChuDe]) VALUES (6, N'enzo', N'ok.jpg', N'')
INSERT [dbo].[ChuDe] ([IDChuDe], [TenChuDe], [AnhPLM], [MoTaChuDe]) VALUES (7, N'kai', N'download.jpg', N'')
INSERT [dbo].[ChuDe] ([IDChuDe], [TenChuDe], [AnhPLM], [MoTaChuDe]) VALUES (8, N'asp', N'anhnen.jpg', N'')
INSERT [dbo].[ChuDe] ([IDChuDe], [TenChuDe], [AnhPLM], [MoTaChuDe]) VALUES (9, N'ronaldo1', N'ro.jpg', N'')
INSERT [dbo].[ChuDe] ([IDChuDe], [TenChuDe], [AnhPLM], [MoTaChuDe]) VALUES (10, N'ronaldo2', N'ronan.jpg', N'')
INSERT [dbo].[ChuDe] ([IDChuDe], [TenChuDe], [AnhPLM], [MoTaChuDe]) VALUES (11, N'messi', N'th.jpg', N'')
SET IDENTITY_INSERT [dbo].[ChuDe] OFF
GO
INSERT [dbo].[DanhGia] ([IDTK], [IDBaiHat], [DiemDG]) VALUES (3, 1, 4)
INSERT [dbo].[DanhGia] ([IDTK], [IDBaiHat], [DiemDG]) VALUES (3, 3, 5)
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([IDTK], [TenTK], [MatKhau], [NgayLap], [TrangThai], [LoaiTK], [SDT], [TopSQL]) VALUES (3, N'nghien', N'999', CAST(N'2023-06-11T00:00:00.000' AS DateTime), N'ok', N'user', N'192', NULL)
INSERT [dbo].[TaiKhoan] ([IDTK], [TenTK], [MatKhau], [NgayLap], [TrangThai], [LoaiTK], [SDT], [TopSQL]) VALUES (4, N'nam', N'111', CAST(N'2023-11-06T22:44:23.930' AS DateTime), N'active', N'user', N'222', NULL)
INSERT [dbo].[TaiKhoan] ([IDTK], [TenTK], [MatKhau], [NgayLap], [TrangThai], [LoaiTK], [SDT], [TopSQL]) VALUES (5, N'nghien1', N'111', CAST(N'2023-11-06T22:48:21.837' AS DateTime), N'active', N'user', N'12', NULL)
INSERT [dbo].[TaiKhoan] ([IDTK], [TenTK], [MatKhau], [NgayLap], [TrangThai], [LoaiTK], [SDT], [TopSQL]) VALUES (6, N'nghien12', N'111', CAST(N'2023-11-06T22:52:39.503' AS DateTime), N'active', N'user', N'12', NULL)
INSERT [dbo].[TaiKhoan] ([IDTK], [TenTK], [MatKhau], [NgayLap], [TrangThai], [LoaiTK], [SDT], [TopSQL]) VALUES (7, N'ducdaubuoi', N'888', CAST(N'2023-11-06T22:53:55.060' AS DateTime), N'active', N'user', N'198666', NULL)
INSERT [dbo].[TaiKhoan] ([IDTK], [TenTK], [MatKhau], [NgayLap], [TrangThai], [LoaiTK], [SDT], [TopSQL]) VALUES (8, N'test123', N'111', CAST(N'2023-11-06T22:57:09.793' AS DateTime), N'active', N'user', N'9888', NULL)
INSERT [dbo].[TaiKhoan] ([IDTK], [TenTK], [MatKhau], [NgayLap], [TrangThai], [LoaiTK], [SDT], [TopSQL]) VALUES (9, N'thongdoan', N'111', CAST(N'2023-11-06T22:59:47.720' AS DateTime), N'active', N'user', N'1999', NULL)
INSERT [dbo].[TaiKhoan] ([IDTK], [TenTK], [MatKhau], [NgayLap], [TrangThai], [LoaiTK], [SDT], [TopSQL]) VALUES (10, N'ducocho', N'111', CAST(N'2023-11-07T07:10:27.950' AS DateTime), N'active', N'user', N'1333', NULL)
INSERT [dbo].[TaiKhoan] ([IDTK], [TenTK], [MatKhau], [NgayLap], [TrangThai], [LoaiTK], [SDT], [TopSQL]) VALUES (1007, N'khanh', N'122', CAST(N'2023-11-07T14:37:40.010' AS DateTime), N'active', N'user', N'696', NULL)
INSERT [dbo].[TaiKhoan] ([IDTK], [TenTK], [MatKhau], [NgayLap], [TrangThai], [LoaiTK], [SDT], [TopSQL]) VALUES (1008, N'nghienhh', N'0198666', CAST(N'2023-11-08T18:41:31.853' AS DateTime), N'active', N'user', N'198666', NULL)
INSERT [dbo].[TaiKhoan] ([IDTK], [TenTK], [MatKhau], [NgayLap], [TrangThai], [LoaiTK], [SDT], [TopSQL]) VALUES (1009, N'ducngu123', N'000', CAST(N'2023-11-09T10:00:02.460' AS DateTime), N'active', N'user', N'123', NULL)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
INSERT [dbo].[TopBXH] ([IDTop], [TenTop], [AnhTOP], [MotaTop], [TopCategories]) VALUES (1, N'top100VN', N'100rapviet.jpg', N'thisismota', N'
    SELECT
        BaiHat.IDBaiHat,
        BaiHat.TenBaiHat,
        BaiHat.AnhBH,
        BaiHat.QuocGia,
        BaiHat.LuotXem,
        DanhGia.DiemDG,
        CaSi.TenCaSi,
        CaSi.BiDanh
    FROM
        BaiHat
    LEFT JOIN
     ')
GO
ALTER TABLE [dbo].[BaiHatPlayListCN]  WITH CHECK ADD  CONSTRAINT [FK_BaiHatPlayListCN_BaiHat] FOREIGN KEY([IDBaiHat])
REFERENCES [dbo].[BaiHat] ([IDBaiHat])
GO
ALTER TABLE [dbo].[BaiHatPlayListCN] CHECK CONSTRAINT [FK_BaiHatPlayListCN_BaiHat]
GO
ALTER TABLE [dbo].[BaiHatPlayListCN]  WITH CHECK ADD  CONSTRAINT [FK_BaiHatPlayListCN_PlayListCaNhan] FOREIGN KEY([IDPlayList])
REFERENCES [dbo].[PlayListCaNhan] ([IDPlayList])
GO
ALTER TABLE [dbo].[BaiHatPlayListCN] CHECK CONSTRAINT [FK_BaiHatPlayListCN_PlayListCaNhan]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_BaiHat] FOREIGN KEY([IDBaiHat])
REFERENCES [dbo].[BaiHat] ([IDBaiHat])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_BaiHat]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_TaiKhoan] FOREIGN KEY([IDTK])
REFERENCES [dbo].[TaiKhoan] ([IDTK])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_TaiKhoan]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_BaiHat] FOREIGN KEY([IDBaiHat])
REFERENCES [dbo].[BaiHat] ([IDBaiHat])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_BaiHat]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_TaiKhoan] FOREIGN KEY([IDTK])
REFERENCES [dbo].[TaiKhoan] ([IDTK])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_TaiKhoan]
GO
ALTER TABLE [dbo].[LichSu]  WITH CHECK ADD  CONSTRAINT [FK_LichSu_BaiHat] FOREIGN KEY([IDBaiHat])
REFERENCES [dbo].[BaiHat] ([IDBaiHat])
GO
ALTER TABLE [dbo].[LichSu] CHECK CONSTRAINT [FK_LichSu_BaiHat]
GO
ALTER TABLE [dbo].[LichSu]  WITH CHECK ADD  CONSTRAINT [FK_LichSu_TaiKhoan] FOREIGN KEY([IDTK])
REFERENCES [dbo].[TaiKhoan] ([IDTK])
GO
ALTER TABLE [dbo].[LichSu] CHECK CONSTRAINT [FK_LichSu_TaiKhoan]
GO
