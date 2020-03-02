CREATE TABLE [dbo].[OrderItems] (
    [Id]                        INT             IDENTITY (1, 1) NOT NULL,
    [OrderId]                   INT             NULL,
    [UnitPrice]                 DECIMAL (18, 2) NOT NULL,
    [Units]                     INT             NOT NULL,
    [ItemOrdered_CatalogItemId] INT             NOT NULL,
    [ItemOrdered_PictureUri]    NVARCHAR (MAX)  NULL,
    [ItemOrdered_ProductName]   NVARCHAR (50)   NULL,
    CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Orders] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId]
    ON [dbo].[OrderItems]([OrderId] ASC);

