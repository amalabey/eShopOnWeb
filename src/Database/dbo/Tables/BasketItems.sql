CREATE TABLE [dbo].[BasketItems] (
    [Id]            INT             IDENTITY (1, 1) NOT NULL,
    [BasketId]      INT             NULL,
    [CatalogItemId] INT             NOT NULL,
    [Quantity]      INT             NOT NULL,
    [UnitPrice]     DECIMAL (18, 2) NOT NULL,
    CONSTRAINT [PK_BasketItems] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_BasketItems_Baskets_BasketId] FOREIGN KEY ([BasketId]) REFERENCES [dbo].[Baskets] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_BasketItems_BasketId]
    ON [dbo].[BasketItems]([BasketId] ASC);

