CREATE TABLE [dbo].[Orders] (
    [Id]                    INT                IDENTITY (1, 1) NOT NULL,
    [BuyerId]               NVARCHAR (MAX)     NULL,
    [OrderDate]             DATETIMEOFFSET (7) NOT NULL,
    [ShipToAddress_City]    NVARCHAR (100)     NULL,
    [ShipToAddress_Country] NVARCHAR (90)      NULL,
    [ShipToAddress_State]   NVARCHAR (60)      NULL,
    [ShipToAddress_Street]  NVARCHAR (180)     NULL,
    [ShipToAddress_ZipCode] NVARCHAR (18)      NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([Id] ASC)
);

