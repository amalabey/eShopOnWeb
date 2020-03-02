CREATE TABLE [dbo].[Baskets] (
    [Id]      INT           IDENTITY (1, 1) NOT NULL,
    [BuyerId] NVARCHAR (40) NOT NULL,
    CONSTRAINT [PK_Baskets] PRIMARY KEY CLUSTERED ([Id] ASC)
);

