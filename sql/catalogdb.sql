CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(95) NOT NULL,
    `ProductVersion` varchar(32) NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
);

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210507044609_initial') THEN

    CREATE TABLE `Baskets` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `BuyerId` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
        CONSTRAINT `PK_Baskets` PRIMARY KEY (`Id`)
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210507044609_initial') THEN

    CREATE TABLE `CatalogBrands` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `Brand` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        CONSTRAINT `PK_CatalogBrands` PRIMARY KEY (`Id`)
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210507044609_initial') THEN

    CREATE TABLE `CatalogTypes` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `Type` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
        CONSTRAINT `PK_CatalogTypes` PRIMARY KEY (`Id`)
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210507044609_initial') THEN

    CREATE TABLE `Orders` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `BuyerId` longtext CHARACTER SET utf8mb4 NULL,
        `OrderDate` datetime(6) NOT NULL,
        `ShipToAddress_Street` varchar(180) CHARACTER SET utf8mb4 NULL,
        `ShipToAddress_City` varchar(100) CHARACTER SET utf8mb4 NULL,
        `ShipToAddress_State` varchar(60) CHARACTER SET utf8mb4 NULL,
        `ShipToAddress_Country` varchar(90) CHARACTER SET utf8mb4 NULL,
        `ShipToAddress_ZipCode` varchar(18) CHARACTER SET utf8mb4 NULL,
        CONSTRAINT `PK_Orders` PRIMARY KEY (`Id`)
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210507044609_initial') THEN

    CREATE TABLE `BasketItems` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `UnitPrice` decimal(18,2) NOT NULL,
        `Quantity` int NOT NULL,
        `CatalogItemId` int NOT NULL,
        `BasketId` int NOT NULL,
        CONSTRAINT `PK_BasketItems` PRIMARY KEY (`Id`),
        CONSTRAINT `FK_BasketItems_Baskets_BasketId` FOREIGN KEY (`BasketId`) REFERENCES `Baskets` (`Id`) ON DELETE CASCADE
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210507044609_initial') THEN

    CREATE TABLE `Catalog` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `Name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
        `Description` longtext CHARACTER SET utf8mb4 NULL,
        `Price` decimal(18,2) NOT NULL,
        `PictureUri` longtext CHARACTER SET utf8mb4 NULL,
        `CatalogTypeId` int NOT NULL,
        `CatalogBrandId` int NOT NULL,
        CONSTRAINT `PK_Catalog` PRIMARY KEY (`Id`),
        CONSTRAINT `FK_Catalog_CatalogBrands_CatalogBrandId` FOREIGN KEY (`CatalogBrandId`) REFERENCES `CatalogBrands` (`Id`) ON DELETE CASCADE,
        CONSTRAINT `FK_Catalog_CatalogTypes_CatalogTypeId` FOREIGN KEY (`CatalogTypeId`) REFERENCES `CatalogTypes` (`Id`) ON DELETE CASCADE
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210507044609_initial') THEN

    CREATE TABLE `OrderItems` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `ItemOrdered_CatalogItemId` int NULL,
        `ItemOrdered_ProductName` varchar(50) CHARACTER SET utf8mb4 NULL,
        `ItemOrdered_PictureUri` longtext CHARACTER SET utf8mb4 NULL,
        `UnitPrice` decimal(18,2) NOT NULL,
        `Units` int NOT NULL,
        `OrderId` int NULL,
        CONSTRAINT `PK_OrderItems` PRIMARY KEY (`Id`),
        CONSTRAINT `FK_OrderItems_Orders_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `Orders` (`Id`) ON DELETE RESTRICT
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210507044609_initial') THEN

    CREATE INDEX `IX_BasketItems_BasketId` ON `BasketItems` (`BasketId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210507044609_initial') THEN

    CREATE INDEX `IX_Catalog_CatalogBrandId` ON `Catalog` (`CatalogBrandId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210507044609_initial') THEN

    CREATE INDEX `IX_Catalog_CatalogTypeId` ON `Catalog` (`CatalogTypeId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210507044609_initial') THEN

    CREATE INDEX `IX_OrderItems_OrderId` ON `OrderItems` (`OrderId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20210507044609_initial') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20210507044609_initial', '3.1.1');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

