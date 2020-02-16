IF(db_id(N'CatalogDb') IS NULL)
    BEGIN
        CREATE DATABASE [CatalogDb]
    END;

IF(db_id(N'IdentityDb') IS NULL)
    BEGIN
        CREATE DATABASE [IdentityDb]
    END;