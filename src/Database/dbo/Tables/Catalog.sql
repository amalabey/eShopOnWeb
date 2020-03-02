CREATE TABLE [dbo].[Catalog] (
    [Id]             INT             NOT NULL,
    [CatalogBrandId] INT             NOT NULL,
    [CatalogTypeId]  INT             NOT NULL,
    [Description]    NVARCHAR (MAX)  NULL,
    [Name]           NVARCHAR (50)   NOT NULL,
    [PictureUri]     NVARCHAR (MAX)  NULL,
    [Price]          DECIMAL (18, 2) NOT NULL,
    CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Catalog_CatalogBrands_CatalogBrandId] FOREIGN KEY ([CatalogBrandId]) REFERENCES [dbo].[CatalogBrands] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Catalog_CatalogTypes_CatalogTypeId] FOREIGN KEY ([CatalogTypeId]) REFERENCES [dbo].[CatalogTypes] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_Catalog_CatalogBrandId]
    ON [dbo].[Catalog]([CatalogBrandId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Catalog_CatalogTypeId]
    ON [dbo].[Catalog]([CatalogTypeId] ASC);

