USE [mike]
GO
/****** Object:  Table [dbo].[mike] *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailsTable](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [varchar](100) NULL,
	[Event] [varchar](100) NULL,
 CONSTRAINT [PK_DetailsTable] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdateDetail] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Stored Procedure to update record into Detail table by ID
CREATE PROC [dbo].[UpdateDetail]
@PersonID int,
@Date varchar(100),
@Event	varchar(100)
as
UPDATE DetailsTable set Date=@Date,Event=@Event where PersonID=@PersonID;
GO
/****** Object:  StoredProcedure [dbo].[InsertDetail] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Stored Procedure to Insert record into Detail table
CREATE PROC [dbo].[InsertDetail]
@Date varchar(100),
@Event	varchar(100)
as
Insert into DetailsTable (Date,Event) values(@Date,@Event) ;
GO
/****** Object:  StoredProcedure [dbo].[GetDetialByID] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Stored Procedure to get records from detail table by ID
CREATE PROC [dbo].[GetDetialByID]
@PersonID int
as
Select PersonID,Date,Event from DetailsTable where PersonID=@PersonID;
GO
/****** Object:  StoredProcedure [dbo].[GetDetail] *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Stored Procedure to get all records from detail table
CREATE PROC [dbo].[GetDetail]
as
Select PersonID,Date,Event from DetailsTable;
GO
/****** Object:  StoredProcedure [dbo].[DeleteDetialByID] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Stored Procedure to delete records from detail table by ID
CREATE PROC [dbo].[DeleteDetialByID]
@PersonID int
as
Delete from DetailsTable  where PersonID=@PersonID;
GO
