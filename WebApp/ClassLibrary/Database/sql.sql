USE [DatabaseFirst]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 12/14/2023 10:54:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorDetail]    Script Date: 12/14/2023 10:54:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorDetail](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [nvarchar](max) NULL,
	[SpecializationID] [int] NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_DoctorDetail] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 12/14/2023 10:54:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[SpecializationID] [int] IDENTITY(1,1) NOT NULL,
	[SpecializationName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[SpecializationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([DoctorID], [UserName], [Password]) VALUES (1, N'namdv', N'Namdv123')
INSERT [dbo].[Doctor] ([DoctorID], [UserName], [Password]) VALUES (2, N'baont', N'Baont123')
INSERT [dbo].[Doctor] ([DoctorID], [UserName], [Password]) VALUES (3, N'hatt', N'Hatt123')
INSERT [dbo].[Doctor] ([DoctorID], [UserName], [Password]) VALUES (4, N'gioitv', N'Gioitv123')
SET IDENTITY_INSERT [dbo].[Doctor] OFF
SET IDENTITY_INSERT [dbo].[DoctorDetail] ON 

INSERT [dbo].[DoctorDetail] ([DoctorID], [DoctorName], [SpecializationID], [Email], [Address]) VALUES (1, N'Dang Van Nam', 1, N'namdv@gmail.com', N'Quang Nam')
INSERT [dbo].[DoctorDetail] ([DoctorID], [DoctorName], [SpecializationID], [Email], [Address]) VALUES (2, N'Nguyen The Bao', 2, N'baont@gmail.com', N'Da Nang')
INSERT [dbo].[DoctorDetail] ([DoctorID], [DoctorName], [SpecializationID], [Email], [Address]) VALUES (3, N'Tran Thi Ha', 3, N'hatt@gmail.com', N'Hue')
INSERT [dbo].[DoctorDetail] ([DoctorID], [DoctorName], [SpecializationID], [Email], [Address]) VALUES (4, N'Thai Van Gioi', 3, N'gioitv@gmail.com', N'Da Nang')
SET IDENTITY_INSERT [dbo].[DoctorDetail] OFF
SET IDENTITY_INSERT [dbo].[Specialization] ON 

INSERT [dbo].[Specialization] ([SpecializationID], [SpecializationName]) VALUES (1, N'Internal Medicine')
INSERT [dbo].[Specialization] ([SpecializationID], [SpecializationName]) VALUES (2, N'Pediatrics')
INSERT [dbo].[Specialization] ([SpecializationID], [SpecializationName]) VALUES (3, N'Dentistry')
SET IDENTITY_INSERT [dbo].[Specialization] OFF
ALTER TABLE [dbo].[DoctorDetail]  WITH CHECK ADD  CONSTRAINT [FK_DoctorDetail_Doctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([DoctorID])
GO
ALTER TABLE [dbo].[DoctorDetail] CHECK CONSTRAINT [FK_DoctorDetail_Doctor]
GO
ALTER TABLE [dbo].[DoctorDetail]  WITH CHECK ADD  CONSTRAINT [FK_DoctorDetail_Specialization] FOREIGN KEY([SpecializationID])
REFERENCES [dbo].[Specialization] ([SpecializationID])
GO
ALTER TABLE [dbo].[DoctorDetail] CHECK CONSTRAINT [FK_DoctorDetail_Specialization]
GO
