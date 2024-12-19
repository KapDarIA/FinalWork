/****** Object:  Table [dbo].[ExamOrder]    Script Date: 14.06.2024 8:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamOrder](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderPickupCode] [int] NOT NULL,
 CONSTRAINT [PK__ExamOrde__C3905BAFC7CC9AED] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamOrderProduct]    Script Date: 14.06.2024 8:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamOrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Amount] [smallint] NOT NULL,
 CONSTRAINT [PK__ExamOrde__817A266255BBC081] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamPickupPoint]    Script Date: 14.06.2024 8:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamPickupPoint](
	[OrderPickupPoint] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ExamPickupPoint] PRIMARY KEY CLUSTERED 
(
	[OrderPickupPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamProduct]    Script Date: 14.06.2024 8:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamProduct](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](max) NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__ExamProd__2EA7DCD5BF55BCD9] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamRole]    Script Date: 14.06.2024 8:54:55 ******/
SET ANSI_NULLS ON
GO
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (4, N'660540, �. �������, ��. ���������, 25')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (5, N'125837, �. �������, ��. ���������, 40')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (6, N'125703, �. �������, ��. ������������, 49')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (7, N'625283, �. �������, ��. ������, 46')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (8, N'614611, �. �������, ��. ����������, 50')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (9, N'454311, �.�������, ��. �����, 19')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (10, N'660007, �.�������, ��. �����������, 19')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (11, N'603036, �. �������, ��. �������, 4')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (12, N'450983, �.�������, ��. �������������, 26')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (13, N'394782, �. �������, ��. ������, 3')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (14, N'603002, �. �������, ��. ������������, 28')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (15, N'450558, �. �������, ��. ����������, 30')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (16, N'394060, �.�������, ��. ������, 43')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (17, N'410661, �. �������, ��. ��������, 50')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (18, N'625590, �. �������, ��. ����������������, 20')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (19, N'625683, �. �������, ��. 8 �����')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (20, N'400562, �. �������, ��. �������, 32')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (21, N'614510, �. �������, ��. �����������, 47')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (22, N'410542, �. �������, ��. �������, 46')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (23, N'620839, �. �������, ��. ���������, 8')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (24, N'443890, �. �������, ��. ����������������, 1')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (25, N'603379, �. �������, ��. ����������, 46')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (26, N'603721, �. �������, ��. ������, 41')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (27, N'410172, �. �������, ��. ��������, 13')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (28, N'420151, �. �������, ��. ��������, 32')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (29, N'125061, �. �������, ��. ���������, 8')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (30, N'630370, �. �������, ��. ���������, 24')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (31, N'614753, �. �������, ��. �������, 35')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (32, N'426030, �. �������, ��. �����������, 44')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (33, N'450375, �. ������� ��. �������, 44')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (34, N'625560, �. �������, ��. ���������, 12')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (35, N'630201, �. �������, ��. �������������, 17')
INSERT [dbo].[ExamPickupPoint] ([OrderPickupPoint], [Address]) VALUES (36, N'190949, �. �������, ��. ��������, 26')
SET IDENTITY_INSERT [dbo].[ExamPickupPoint] OFF
GO
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'A436H7', N'Chanel No. 5', N'����������� ������� ������ � ������� ������ ������ � ������.', N'����������', N'1', N'Chanel', CAST(2399.0000 AS Decimal(19, 4)), 99, 16, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D344Y7', N'MAC Studio Fix Fluid Foundation', N'��������� ���� � ������������ ��������� � ������� �������.', N'���������', N'1', N'MAC', CAST(31999.0000 AS Decimal(19, 4)), 13, 47, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D378D3', N'Dior Lip Glow', N'���������� ������� ��� ���, ������� ������ ���� ������� ��� ������������ pH ����.', N'���������', N'1', N'Dior', CAST(12799.0000 AS Decimal(19, 4)), 18, 266, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D526R4', N'Yves Saint Laurent Black Opium', N'��������������� ������� ������ � ������ ���� � ������.
', N'����������', N'1', N'YSL', CAST(1499.0000 AS Decimal(19, 4)), 45, 84, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E245R5', N'Anastasia Beverly Hills Modern Renaissance Eyeshadow Palette', N'������� ����� ��� ��� � �������� � ������ ���������.', N'���������', N'1', N'ABH', CAST(16099.0000 AS Decimal(19, 4)), 18, 100, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E479G6', N'Gucci Bloom', N'������� ������ � ������ �������, �������� � ����.', N'����������', N'1', N'Gucci', CAST(1099.0000 AS Decimal(19, 4)), 0, 0, N'��� � �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E530Y6', N'Huda Beauty FauxFilter Foundation', N'������� ����������� ��������� ��������, ��������� ��������� ������.', N'���������', N'1', N'Huda Beauty', CAST(4899.0000 AS Decimal(19, 4)), 7, 20, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E573G6', N'Marc Jacobs Daisy', N'������ � ��������� ������� ������, ������������� ������� �������.', N'����������', N'1', N'Marc Jacobs', CAST(41999.0000 AS Decimal(19, 4)), 40, 41, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F344S4', N'Fenty Beauty Gloss Bomb Universal Lip Luminizer', N'������-��������� ����� ��� ��� � ������ ��������� � ����� ��������.', N'���������', N'1', N'Fenty Beauty', CAST(9999.0000 AS Decimal(19, 4)), 25, 18, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F346G5', N'Dolce & Gabbana Light Blue', N'������ � ������ ������ � ������ ���������� � ������.', N'����������', N'1', N'Dolce & Gabbana', CAST(1499.0000 AS Decimal(19, 4)), 11, 45, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F893T5', N'NARS Radiant Creamy Concealer', N'�������� � ������ ��������� � ������� ��������� ��� ���������� �������.', N'���������', N'1', N'NARS', CAST(6499.0000 AS Decimal(19, 4)), 6, 19, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G532R5', N'Lancome La Vie Est Belle', N'������� ������ � ������ �����, ������� � ���������.', N'����������', N'1', N'Lancome', CAST(47199.0000 AS Decimal(19, 4)), 40, 56, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H732R5', N'Urban Decay Naked Heat Eyeshadow Palette', N'������� � ������� ��������� ����� ��� �������� ������ �������.', N'���������', N'1', N'Urban Decay', CAST(32199.0000 AS Decimal(19, 4)), 18, 410, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'J432E4', N'Tom Ford Black Orchid', N'����������� � ���������� ������� ������ � ������ �������� � ������.', N'����������', N'1', N'Tom Ford', CAST(4899.0000 AS Decimal(19, 4)), 12, 150, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K535G6', N'Too Faced Better Than Sex Mascara', N'���� ��� ������ � �������� �������� � ���������� ���������.', N'���������', N'1', N'Too Faced
', CAST(65099.0000 AS Decimal(19, 4)), 20, 88, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'O875F6', N'Viktor & Rolf Flowerbomb', N'������� � ����� ������ � ������ ������, ������ � ������.', N'����������', N'1', N'Viktor & Rolf', CAST(2799.0000 AS Decimal(19, 4)), 30, 41, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'R464G6', N'Benefit Hoola Matte Bronzer', N'������� ������� ��� �������� ���������� � ������ �� ����.', N'���������', N'1', N'Benefit', CAST(12599.0000 AS Decimal(19, 4)), 18, 11, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S753T5', N'Chloe Eau de Parfum', N'������ � ��������� ������� ������ � ������ ���� � ������.', N'����������', N'1', N'Chloe', CAST(1099.0000 AS Decimal(19, 4)), 45, 83, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V472S3', N'Tarte Shape Tape Concealer', N'�������� � ������� ��������� � ������ ��������� ��� ������������ �������.', N'���������', N'1', N'Tarte', CAST(1999.0000 AS Decimal(19, 4)), 45, 75, N'� �������')
INSERT [dbo].[ExamProduct] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'�112�4', N'Giorgio Armani Si Passione', N'��������� � ����������� ������� ������ � ������ ������� ��������� � ����.', N'����������', N'1', N'Giorgio Armani', CAST(1299.0000 AS Decimal(19, 4)), 5, 10, N'� �������')
GO
SET IDENTITY_INSERT [dbo].[ExamRole] ON 

INSERT [dbo].[ExamRole] ([RoleID], [RoleName]) VALUES (1, N'��������
')
INSERT [dbo].[ExamRole] ([RoleID], [RoleName]) VALUES (2, N'������')
INSERT [dbo].[ExamRole] ([RoleID], [RoleName]) VALUES (3, N'�������������')
SET IDENTITY_INSERT [dbo].[ExamRole] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamUser] ON 

INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (1, 1, N'������������� ', N'��������', N'����������', N'loginDEsgg2018', N'qhgYnW')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (2, 2, N'�������� ', N'������', N'���������', N'loginDEdcd2018', N'LxR6YI')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (3, 1, N'������� ', N'�����', N'�����������', N'loginDEisg2018', N'Cp8ddU')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (4, 3, N'������ ', N'����', N' ����������', N'loginDEcph2018', N'7YpE0p')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (5, 2, N'������ ', N'������', N'���������', N'loginDEgco2018', N'nMr|ss')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (6, 2, N'���� ', N'������', N' �����������', N'loginDEwjg2018', N'9UfqWQ')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (7, 3, N'������� ', N'����', N' ������������', N'loginDEjbz2018', N'xIAWNI')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (8, 1, N'������ ', N'��������', N'��������', N'loginDEmgu2018', N'0gC3bk')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (9, 1, N'������ ', N'������', N'����������', N'loginDErdg2018', N'ni0ue0')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (10, 2, N'�������� ', N'����', N'�����������', N'loginDEjtv2018', N'f2ZaN6')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (11, 2, N'������ ', N'�����', N' ����������', N'loginDEtfj2018', N'{{ksPn')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (12, 3, N'�������� ', N'�������', N' ������������', N'loginDEpnb2018', N'{ADBdc')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (13, 3, N'������ ', N'������', N'��������', N'loginDEzer2018', N'5&R+zs')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (14, 2, N'������ ', N'�����', N' ���������', N'loginDEiin2018', N'y9l*b}')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (15, 2, N'������� ', N'���������', N' ���������', N'loginDEqda2018', N'|h+r}I')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (16, 2, N'�������� ', N'��������', N' ����������', N'loginDEbnj2018', N'12345')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (17, 2, N'��������� ', N'����', N'����������', N'loginDEqte2018', N'dC8bDI')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (18, 2, N'�������� ', N'������', N'��������', N'loginDEfeo2018', N'8cI7vq')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (19, 2, N'��������� ', N'�����', N'��������', N'loginDEvni2018', N'e4pVIv')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (20, 1, N'�������� ', N'������', N' �����������', N'loginDEjis2018', N'A9K++2')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (21, 1, N'�������� ', N'�������', N' ��������', N'loginDExvv2018', N'R1zh}|')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (22, 1, N'�������� ', N'�������', N'���������', N'loginDEadl2018', N'F&IWf4')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (23, 2, N'������� ', N'���������', N' �������������', N'loginDEyzn2018', N'P1v24R')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (24, 2, N'������� ', N'���������', N'�����������', N'loginDEphn2018', N'F}jGsJ')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (25, 3, N'������� ', N'������', N'������������', N'loginDEdvk2018', N'NKNkup')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (26, 1, N'�������� ', N'����', N'����������', N'loginDEtld2018', N'c+CECK')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (27, 3, N'������ ', N'������', N'��������', N'loginDEima2018', N'XK3sOA')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (28, 2, N'������ ', N'����', N'���������', N'loginDEyfe2018', N'4Bbzpa')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (29, 1, N'������ ', N'���', N' ����������', N'loginDEwqc2018', N'vRtAP*')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (30, 1, N'������� ', N'�����', N'�������������', N'loginDEgtt2018', N'7YD|BR')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (31, 1, N'�������� ', N'������', N'���������', N'loginDEiwl2018', N'LhlmIl')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (32, 3, N'������������ ', N'ϸ��', N'�����������', N'loginDEyvi2018', N'22beR}')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (33, 2, N'������� ', N'��������', N' ��������', N'loginDEtfz2018', N'uQY0ZQ')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (34, 3, N'��������� ', N'��������', N'�����������', N'loginDEikb2018', N'*QkUxc')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (35, 2, N'�������� ', N'������', N' ���������', N'loginDEdmi2018', N'HOGFbU')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (36, 3, N'������� ', N'���������', N'����������', N'loginDEtlo2018', N'58Jxrg')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (37, 3, N'������ ', N'������', N'������������', N'loginDEsnd2018', N'lLHqZf')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (38, 3, N'����� ', N'�������', N'����������', N'loginDEgno2018', N'4fqLiO')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (39, 2, N'�������� ', N'�����', N'��������', N'loginDEgnl2018', N'wdio{u')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (40, 2, N'��������� ', N'�����', N'����������', N'loginDEzna2018', N'yz1iMB')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (41, 1, N'����� ', N'�����', N'������������', N'loginDEsyh2018', N'&4jYGs')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (42, 2, N'�������� ', N'������', N'�����������', N'loginDExex2018', N'rnh36{')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (43, 1, N'��������� ', N'�����', N'������������', N'loginDEdjm2018', N'KjI1JR')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (44, 2, N'������ ', N'����', N'���������', N'loginDEgup2018', N'36|KhF')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (45, 3, N'����� ', N'��������', N'����������', N'loginDEdat2018', N'ussd8Q')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (46, 2, N'���� ', N'������', N'���������', N'loginDEffj2018', N'cJP+HC')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (47, 1, N'���������� ', N'������', N' ������������', N'loginDEisp2018', N'dfz5Ii')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (48, 1, N'����� ', N'�������', N'������������', N'loginDEfrp2018', N'6dcR|9')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (49, 2, N'��������� ', N'��������', N'������������', N'loginDEaee2018', N'5&qONH')
INSERT [dbo].[ExamUser] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (50, 2, N'�������� ', N'������', N'����������', N'loginDEthu2018', N'|0xWzV')
SET IDENTITY_INSERT [dbo].[ExamUser] OFF
GO
ALTER TABLE [dbo].[ExamOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamPickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[ExamPickupPoint] ([OrderPickupPoint])
GO
ALTER TABLE [dbo].[ExamOrder] CHECK CONSTRAINT [FK_ExamOrder_ExamPickupPoint]
GO
ALTER TABLE [dbo].[ExamOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[ExamUser] ([UserID])
GO
ALTER TABLE [dbo].[ExamOrder] CHECK CONSTRAINT [FK_ExamOrder_ExamUser]
GO
ALTER TABLE [dbo].[ExamOrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__ExamOrder__Order__403A8C7D] FOREIGN KEY([OrderID])
REFERENCES [dbo].[ExamOrder] ([OrderID])
GO
ALTER TABLE [dbo].[ExamOrderProduct] CHECK CONSTRAINT [FK__ExamOrder__Order__403A8C7D]
GO
ALTER TABLE [dbo].[ExamOrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__ExamOrder__Produ__412EB0B6] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[ExamProduct] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[ExamOrderProduct] CHECK CONSTRAINT [FK__ExamOrder__Produ__412EB0B6]
GO
ALTER TABLE [dbo].[ExamUser]  WITH CHECK ADD  CONSTRAINT [FK_ExamUser_ExamRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[ExamRole] ([RoleID])
GO
ALTER TABLE [dbo].[ExamUser] CHECK CONSTRAINT [FK_ExamUser_ExamRole]
GO
