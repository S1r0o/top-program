USE [18ip25]
GO
/****** Object:  Table [dbo].[Важность]    Script Date: 08.11.2021 15:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Важность](
	[ID] [nvarchar](50) NOT NULL,
	[Описание] [nvarchar](max) NULL,
 CONSTRAINT [PK_Важность] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявитель]    Script Date: 08.11.2021 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявитель](
	[ID] [nvarchar](50) NOT NULL,
	[Имя] [nchar](10) NULL,
	[Тип] [nvarchar](50) NULL,
	[Телефон] [nvarchar](50) NULL,
	[Электронная почта] [nvarchar](max) NULL,
 CONSTRAINT [PK_Заявитель] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Обращение]    Script Date: 08.11.2021 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Обращение](
	[ID] [nchar](10) NOT NULL,
	[Описание] [nvarchar](50) NULL,
	[Статус] [nchar](10) NULL,
	[Заявитель] [nvarchar](50) NULL,
	[Причина] [nvarchar](50) NULL,
	[Публикатор] [nvarchar](50) NULL,
	[Важность] [nvarchar](50) NULL,
	[Время публикации] [nvarchar](50) NULL,
	[Время рассмотрения] [nvarchar](50) NULL,
 CONSTRAINT [PK_Обращение] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Обращения к сотрудникам]    Script Date: 08.11.2021 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Обращения к сотрудникам](
	[ID] [nchar](10) NOT NULL,
	[id обращения] [nchar](10) NULL,
	[id пользователя] [nchar](10) NULL,
 CONSTRAINT [PK_Обращения к сотрудникам] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 08.11.2021 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[ID] [nchar](10) NOT NULL,
	[Логин] [nvarchar](50) NULL,
	[Пароль] [nvarchar](50) NULL,
	[Должность] [nvarchar](50) NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статус]    Script Date: 08.11.2021 15:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статус](
	[ID] [nchar](10) NOT NULL,
	[Описание] [nchar](10) NULL,
 CONSTRAINT [PK_Статус] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Обращение]  WITH CHECK ADD  CONSTRAINT [FK_Обращение_Важность] FOREIGN KEY([Важность])
REFERENCES [dbo].[Важность] ([ID])
GO
ALTER TABLE [dbo].[Обращение] CHECK CONSTRAINT [FK_Обращение_Важность]
GO
ALTER TABLE [dbo].[Обращение]  WITH CHECK ADD  CONSTRAINT [FK_Обращение_Заявитель] FOREIGN KEY([Заявитель])
REFERENCES [dbo].[Заявитель] ([ID])
GO
ALTER TABLE [dbo].[Обращение] CHECK CONSTRAINT [FK_Обращение_Заявитель]
GO
ALTER TABLE [dbo].[Обращение]  WITH CHECK ADD  CONSTRAINT [FK_Обращение_Статус] FOREIGN KEY([Статус])
REFERENCES [dbo].[Статус] ([ID])
GO
ALTER TABLE [dbo].[Обращение] CHECK CONSTRAINT [FK_Обращение_Статус]
GO
ALTER TABLE [dbo].[Обращения к сотрудникам]  WITH CHECK ADD  CONSTRAINT [FK_Обращения к сотрудникам_Обращение] FOREIGN KEY([id обращения])
REFERENCES [dbo].[Обращение] ([ID])
GO
ALTER TABLE [dbo].[Обращения к сотрудникам] CHECK CONSTRAINT [FK_Обращения к сотрудникам_Обращение]
GO
ALTER TABLE [dbo].[Обращения к сотрудникам]  WITH CHECK ADD  CONSTRAINT [FK_Обращения к сотрудникам_Пользователь] FOREIGN KEY([id пользователя])
REFERENCES [dbo].[Пользователь] ([ID])
GO
ALTER TABLE [dbo].[Обращения к сотрудникам] CHECK CONSTRAINT [FK_Обращения к сотрудникам_Пользователь]
GO
