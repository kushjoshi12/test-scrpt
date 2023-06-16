-- Adminer 4.8.1 MySQL 8.0.23 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `sl-labs-dev`;
CREATE DATABASE `sl-labs-dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sl-labs-dev`;

DROP TABLE IF EXISTS `PromoCodeUsage`;
CREATE TABLE `PromoCodeUsage` (
  `promoUsageId` int NOT NULL AUTO_INCREMENT,
  `promocodeId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `limit` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `isDeleted` tinyint DEFAULT '0',
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`promoUsageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `UserChipOrders`;
CREATE TABLE `UserChipOrders` (
  `userChipOrderId` int NOT NULL AUTO_INCREMENT,
  `chipId` int NOT NULL,
  `chipPrice` double DEFAULT NULL,
  `chipQuantity` int DEFAULT NULL,
  `chipDesignId` int DEFAULT NULL,
  `userChipPackageOrderId` int NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`userChipOrderId`),
  KEY `chipId` (`chipId`),
  KEY `chipDesignId` (`chipDesignId`),
  KEY `userChipPackageOrderId` (`userChipPackageOrderId`),
  CONSTRAINT `UserChipOrders_ibfk_1` FOREIGN KEY (`chipId`) REFERENCES `chips` (`chipId`) ON UPDATE CASCADE,
  CONSTRAINT `UserChipOrders_ibfk_2` FOREIGN KEY (`chipDesignId`) REFERENCES `user_chip_design` (`chipDesignId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `UserChipOrders_ibfk_3` FOREIGN KEY (`userChipPackageOrderId`) REFERENCES `UserChipPackageOrders` (`userChipPackageOrderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `UserChipPackageOrders`;
CREATE TABLE `UserChipPackageOrders` (
  `userChipPackageOrderId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `packageName` varchar(255) DEFAULT NULL,
  `chipName` varchar(255) DEFAULT NULL,
  `chipPrice` double DEFAULT NULL,
  `chipQuantity` int DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`userChipPackageOrderId`),
  KEY `userId` (`userId`),
  CONSTRAINT `UserChipPackageOrders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `acmcertificates`;
CREATE TABLE `acmcertificates` (
  `acmCertificateId` int NOT NULL AUTO_INCREMENT,
  `arn` varchar(255) DEFAULT NULL,
  `subDomain` varchar(255) DEFAULT NULL,
  `cloudFrontDistributionId` varchar(255) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `siteId` int DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'PENDING_VALIDATION',
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`acmCertificateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `adminactivities`;
CREATE TABLE `adminactivities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdFor` int DEFAULT NULL,
  `chipId` int DEFAULT NULL,
  `subscriptionId` int DEFAULT NULL,
  `chipPackageId` int DEFAULT NULL,
  `promocodeId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `actionType` varchar(255) DEFAULT NULL,
  `management` varchar(255) DEFAULT NULL,
  `updatedAt` datetime NOT NULL,
  `isDeleted` tinyint NOT NULL DEFAULT '0',
  `updatedDataFields` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdFor` (`createdFor`),
  KEY `createdBy` (`createdBy`),
  CONSTRAINT `adminactivities_ibfk_1` FOREIGN KEY (`createdFor`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `adminactivities_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `benefits`;
CREATE TABLE `benefits` (
  `benefitId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `stats` double DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `costPerMonth` double DEFAULT NULL,
  `currency` varchar(255) DEFAULT 'usd',
  `isActive` tinyint(1) DEFAULT '1',
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdBy` int DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`benefitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `benefits` (`benefitId`, `name`, `stats`, `unit`, `costPerMonth`, `currency`, `isActive`, `isDeleted`, `createdBy`, `updatedBy`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(8,	'Landing Pages',	NULL,	NULL,	5,	'usd',	1,	0,	99,	99,	'2023-06-02 11:23:26',	'2023-06-02 11:23:26',	NULL),
(9,	'Analytics',	1000,	NULL,	5,	'usd',	1,	0,	99,	99,	'2023-06-02 11:23:26',	'2023-06-02 11:23:26',	NULL),
(10,	'Unlimited Pages',	NULL,	NULL,	30,	'usd',	1,	0,	99,	99,	'2023-06-02 11:23:26',	'2023-06-02 11:23:26',	NULL),
(11,	'Media Content Storage',	10,	'GB',	5,	'usd',	1,	0,	99,	99,	'2023-06-02 11:23:26',	'2023-06-02 11:23:26',	NULL),
(12,	'Number Of Visitors',	1000,	NULL,	5,	'usd',	1,	0,	99,	99,	'2023-06-02 11:23:26',	'2023-06-02 11:23:26',	NULL),
(13,	'Number Of Mini Sites',	10,	NULL,	10,	'usd',	1,	0,	99,	99,	'2023-06-02 11:23:26',	'2023-06-02 11:23:26',	NULL);

DROP TABLE IF EXISTS `chipOrder`;
CREATE TABLE `chipOrder` (
  `chipOrderId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `userChipPackageOrderId` int NOT NULL,
  `chipPackageData` text,
  `isActive` tinyint(1) DEFAULT '1',
  `isCompleted` tinyint(1) DEFAULT '1',
  `status` varchar(255) DEFAULT 'pending',
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`chipOrderId`),
  KEY `userId` (`userId`),
  KEY `userChipPackageOrderId` (`userChipPackageOrderId`),
  CONSTRAINT `chipOrder_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chipOrder_ibfk_2` FOREIGN KEY (`userChipPackageOrderId`) REFERENCES `UserChipPackageOrders` (`userChipPackageOrderId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `chipchippackagemappings`;
CREATE TABLE `chipchippackagemappings` (
  `chipChipPackageMappingId` int NOT NULL AUTO_INCREMENT,
  `chipId` int DEFAULT NULL,
  `chipPackageId` int DEFAULT NULL,
  `pricePerChip` double NOT NULL DEFAULT '0',
  `minimumPurchaseQuantity` double NOT NULL,
  `currency` varchar(255) NOT NULL DEFAULT 'usd',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `isDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`chipChipPackageMappingId`),
  KEY `chipId` (`chipId`),
  KEY `chipPackageId` (`chipPackageId`),
  CONSTRAINT `chipchippackagemappings_ibfk_7` FOREIGN KEY (`chipId`) REFERENCES `chips` (`chipId`) ON UPDATE CASCADE,
  CONSTRAINT `chipchippackagemappings_ibfk_8` FOREIGN KEY (`chipPackageId`) REFERENCES `chippackages` (`chipPackageId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `chippackages`;
CREATE TABLE `chippackages` (
  `chipPackageId` int NOT NULL AUTO_INCREMENT,
  `chipPackageName` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `isDeleted` tinyint(1) DEFAULT '0',
  `isPublished` tinyint(1) DEFAULT '0',
  `createdBy` int NOT NULL,
  `updatedBy` int NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`chipPackageId`),
  KEY `createdBy` (`createdBy`),
  KEY `updatedBy` (`updatedBy`),
  CONSTRAINT `chippackages_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chippackages_ibfk_2` FOREIGN KEY (`updatedBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `chips`;
CREATE TABLE `chips` (
  `chipId` int NOT NULL AUTO_INCREMENT,
  `chipBanner` varchar(255) DEFAULT NULL,
  `chipCustomLogo` tinyint(1) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `colorCodes` varchar(255) DEFAULT '',
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdBy` int NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `isPublished` tinyint(1) DEFAULT '1',
  `updatedBy` int NOT NULL,
  `chipCustomImage` tinyint(1) DEFAULT '1',
  `chipType` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `chipModelDefault` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`chipId`),
  KEY `createdBy` (`createdBy`),
  KEY `updatedBy` (`updatedBy`),
  KEY `chips_deletedAt_fk` (`deletedAt`),
  KEY `idx_deleted_at` (`deletedAt`),
  CONSTRAINT `chips_deletedAt_fk` FOREIGN KEY (`deletedAt`) REFERENCES `chips` (`deletedAt`),
  CONSTRAINT `chips_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chips_ibfk_2` FOREIGN KEY (`updatedBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `chiptransactions`;
CREATE TABLE `chiptransactions` (
  `chipTransactionId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `chipOrderId` int DEFAULT NULL,
  `siteId` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `promocode` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  PRIMARY KEY (`chipTransactionId`),
  KEY `chiptransactions_orderId_foreign_idx` (`orderId`),
  KEY `userId` (`userId`),
  CONSTRAINT `chiptransactions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chiptransactions_orderId_foreign_idx` FOREIGN KEY (`orderId`) REFERENCES `chipOrder` (`chipOrderId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cms`;
CREATE TABLE `cms` (
  `cmsId` int NOT NULL AUTO_INCREMENT,
  `cmsType` varchar(255) DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `createdBy` int DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `isDeleted` tinyint DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`cmsId`),
  KEY `createdBy` (`createdBy`),
  KEY `updatedBy` (`updatedBy`),
  CONSTRAINT `cms_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_ibfk_2` FOREIGN KEY (`updatedBy`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `connectedChips`;
CREATE TABLE `connectedChips` (
  `connectedChipsId` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `siteId` int NOT NULL,
  `chipId` int NOT NULL,
  `chipQuantity` int NOT NULL,
  `userId` int NOT NULL,
  `chipDesignId` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime NOT NULL,
  `connectionStatus` varchar(255) DEFAULT 'pending',
  `defaultUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`connectedChipsId`),
  KEY `orderId` (`orderId`),
  KEY `siteId` (`siteId`),
  KEY `chipId` (`chipId`),
  KEY `userId` (`userId`),
  KEY `chipDesignId` (`chipDesignId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `emailSubscribers`;
CREATE TABLE `emailSubscribers` (
  `emailSubscriberId` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `uniqueToken` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL,
  `deletedAt` timestamp NOT NULL,
  PRIMARY KEY (`emailSubscriberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `imageStore`;
CREATE TABLE `imageStore` (
  `imageId` int NOT NULL AUTO_INCREMENT,
  `imageUrl` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `isDeleted` tinyint DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`imageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `newsLetter`;
CREATE TABLE `newsLetter` (
  `newsLetterId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `newsLetterImage` varchar(255) DEFAULT NULL,
  `newsLetterContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `isActive` tinyint(1) DEFAULT '1',
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdBy` int NOT NULL,
  `updatedBy` int NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`newsLetterId`),
  UNIQUE KEY `name-index` (`name`),
  KEY `createdBy` (`createdBy`),
  KEY `updatedBy` (`updatedBy`),
  CONSTRAINT `newsLetter_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `newsLetter_ibfk_2` FOREIGN KEY (`updatedBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `promocodes`;
CREATE TABLE `promocodes` (
  `promocodeId` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `discountType` enum('percentage','flat') DEFAULT 'percentage',
  `applicableOn` enum('chippackage','subscription') DEFAULT 'chippackage',
  `chipPackageId` int DEFAULT NULL,
  `subscriptionId` int DEFAULT NULL,
  `usageLimitPerUser` int DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdBy` int DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`promocodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `rolemappings`;
CREATE TABLE `rolemappings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleId` int NOT NULL,
  `userId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `rolemappings_ibfk_19` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`) ON UPDATE CASCADE,
  CONSTRAINT `rolemappings_ibfk_20` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `roleId` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `totalAdminAllowed` int DEFAULT NULL,
  `responsibilities` tinyint(1) DEFAULT '0',
  `userReportManagementCreate` tinyint(1) DEFAULT '0',
  `userReportManagementRead` tinyint(1) DEFAULT '0',
  `userReportManagementUpdate` tinyint(1) DEFAULT '0',
  `userReportManagementDelete` tinyint(1) DEFAULT '0',
  `userManagementCreate` tinyint(1) DEFAULT '0',
  `userManagementUpdate` tinyint(1) DEFAULT '0',
  `userManagementDelete` tinyint(1) DEFAULT '0',
  `userManagementRead` tinyint(1) DEFAULT '0',
  `websiteManagementRead` tinyint(1) DEFAULT '0',
  `websiteManagementUpdate` tinyint(1) DEFAULT '0',
  `websiteManagementCreate` tinyint(1) DEFAULT '0',
  `websiteManagementDelete` tinyint(1) DEFAULT '0',
  `partnerManagementRead` tinyint(1) DEFAULT '0',
  `partnerManagementUpdate` tinyint(1) DEFAULT '0',
  `partnerManagementCreate` tinyint(1) DEFAULT '0',
  `partnerManagementDelete` tinyint(1) DEFAULT '0',
  `transactionManagementRead` tinyint(1) DEFAULT '0',
  `transactionManagementDelete` tinyint(1) DEFAULT '0',
  `cmsCreate` tinyint(1) DEFAULT '0',
  `cmsUpdate` tinyint(1) DEFAULT '0',
  `cmsDelete` tinyint(1) DEFAULT '0',
  `cmsRead` tinyint(1) DEFAULT '0',
  `subscriptionRead` tinyint(1) DEFAULT '0',
  `subscriptionUpdate` tinyint(1) DEFAULT '0',
  `subscriptionDelete` tinyint(1) DEFAULT '0',
  `subscriptionCreate` tinyint(1) DEFAULT '0',
  `isDeleted` tinyint(1) DEFAULT '0',
  `isActive` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `chipRead` tinyint DEFAULT '0',
  `chipUpdate` tinyint DEFAULT '0',
  `chipCreate` tinyint DEFAULT '0',
  `chipDelete` tinyint DEFAULT '0',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sitePermissions`;
CREATE TABLE `sitePermissions` (
  `sitePermissionId` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `siteId` int NOT NULL,
  `readPermission` tinyint(1) DEFAULT '0',
  `editPermission` tinyint(1) DEFAULT '0',
  `commentPermission` tinyint(1) DEFAULT '1',
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `updatedBy` int NOT NULL,
  PRIMARY KEY (`sitePermissionId`),
  KEY `userId` (`userId`),
  KEY `siteId` (`siteId`),
  KEY `createdBy` (`createdBy`),
  KEY `updatedBy` (`updatedBy`),
  CONSTRAINT `sitePermissions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sitePermissions_ibfk_2` FOREIGN KEY (`siteId`) REFERENCES `sites` (`siteId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sitePermissions_ibfk_3` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sitePermissions_ibfk_4` FOREIGN KEY (`updatedBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sitecomponents`;
CREATE TABLE `sitecomponents` (
  `siteComponentId` int NOT NULL AUTO_INCREMENT,
  `componentName` varchar(255) DEFAULT NULL,
  `componentPath` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `components` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `assets` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `css` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `styles` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `updatedBy` int NOT NULL,
  `componentType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`siteComponentId`),
  UNIQUE KEY `sitecomponents_page_name` (`componentName`),
  KEY `createdBy` (`createdBy`),
  KEY `updatedBy` (`updatedBy`),
  CONSTRAINT `sitecomponents_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sitecomponents_ibfk_3` FOREIGN KEY (`updatedBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sitepages`;
CREATE TABLE `sitepages` (
  `sitePageId` int NOT NULL AUTO_INCREMENT,
  `siteId` int NOT NULL,
  `siteVersionId` int DEFAULT NULL,
  `pageName` varchar(255) DEFAULT NULL,
  `pagePath` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `components` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `assets` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `css` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `styles` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `updatedBy` int NOT NULL,
  PRIMARY KEY (`sitePageId`),
  KEY `siteId` (`siteId`),
  KEY `createdBy` (`createdBy`),
  KEY `updatedBy` (`updatedBy`),
  CONSTRAINT `sitepages_ibfk_1` FOREIGN KEY (`siteId`) REFERENCES `sites` (`siteId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sitepages_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sitepages_ibfk_3` FOREIGN KEY (`updatedBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `siteId` int NOT NULL AUTO_INCREMENT,
  `siteName` varchar(255) DEFAULT NULL,
  `siteUrl` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `subDomain` varchar(255) DEFAULT NULL,
  `s3Bucket` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `status` enum('stage','live') DEFAULT 'stage',
  `isDisable` tinyint(1) NOT NULL DEFAULT '0',
  `googleKey` varchar(255) DEFAULT NULL,
  `customUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `siteGtag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `isCustomUrlEnable` tinyint(1) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdBy` int DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `lastViewAt` datetime DEFAULT NULL,
  `propertyId` varchar(255) DEFAULT NULL,
  `customDomain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`siteId`),
  KEY `createdBy` (`createdBy`),
  KEY `updatedBy` (`updatedBy`),
  CONSTRAINT `sites_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sites_ibfk_2` FOREIGN KEY (`updatedBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sitesVersions`;
CREATE TABLE `sitesVersions` (
  `siteVersionId` int NOT NULL AUTO_INCREMENT,
  `siteId` int NOT NULL,
  `versionNumber` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `gitHubRepo` varchar(255) DEFAULT NULL,
  `scheduleTime` datetime DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int NOT NULL,
  `updatedBy` int NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`siteVersionId`),
  KEY `siteId` (`siteId`),
  KEY `createdBy` (`createdBy`),
  KEY `updatedBy` (`updatedBy`),
  CONSTRAINT `sitesVersions_ibfk_1` FOREIGN KEY (`siteId`) REFERENCES `sites` (`siteId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sitesVersions_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sitesVersions_ibfk_3` FOREIGN KEY (`updatedBy`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sitevisitors`;
CREATE TABLE `sitevisitors` (
  `siteVisitorId` int NOT NULL AUTO_INCREMENT,
  `siteId` int DEFAULT NULL,
  `sitePageId` int DEFAULT NULL,
  `visitorId` int DEFAULT NULL,
  `dateOfVisit` timestamp NULL DEFAULT NULL,
  `timeSpend` time DEFAULT NULL,
  `isBounced` tinyint(1) DEFAULT '1',
  `isExited` tinyint(1) DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`siteVisitorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `stripeTransactions`;
CREATE TABLE `stripeTransactions` (
  `transactionId` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `userId` int NOT NULL,
  `status` varchar(255) DEFAULT 'initiated',
  `promocode` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `stripeTransactionId` varchar(255) DEFAULT NULL,
  `stripeIntentId` varchar(255) DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`transactionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `subscriptionbenefits`;
CREATE TABLE `subscriptionbenefits` (
  `subscriptionBenefitId` int NOT NULL AUTO_INCREMENT,
  `subscriptionId` int DEFAULT NULL,
  `benefitId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`subscriptionBenefitId`),
  UNIQUE KEY `subscriptionbenefits_benefitId_subscriptionId_unique` (`subscriptionId`,`benefitId`),
  KEY `benefitId` (`benefitId`),
  CONSTRAINT `subscriptionbenefits_ibfk_5` FOREIGN KEY (`subscriptionId`) REFERENCES `subscriptions` (`subscriptionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriptionbenefits_ibfk_6` FOREIGN KEY (`benefitId`) REFERENCES `benefits` (`benefitId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions` (
  `subscriptionId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('free','paid') DEFAULT 'paid',
  `totalAmount` double DEFAULT NULL,
  `discountPerMonth` double DEFAULT NULL,
  `amountPerMonth` double DEFAULT NULL,
  `discountPerYear` double DEFAULT NULL,
  `amountPerYear` double DEFAULT NULL,
  `currency` varchar(255) DEFAULT 'usd',
  `discountType` enum('percentage','flat') DEFAULT 'percentage',
  `isActive` tinyint(1) DEFAULT '1',
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdBy` int DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `stripeSubscriptionId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subscriptionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `subscriptiontransactions`;
CREATE TABLE `subscriptiontransactions` (
  `subscriptionTransactionId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `subscriptionId` int DEFAULT NULL,
  `subscriptionOldData` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'working',
  `promocode` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `periodicity` varchar(255) DEFAULT 'Monthly',
  PRIMARY KEY (`subscriptionTransactionId`),
  KEY `userId` (`userId`),
  KEY `subscriptionId` (`subscriptionId`),
  CONSTRAINT `subscriptiontransactions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `subscriptiontransactions_ibfk_2` FOREIGN KEY (`subscriptionId`) REFERENCES `subscriptions` (`subscriptionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `userSubscriptions`;
CREATE TABLE `userSubscriptions` (
  `userSubscriptionId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `benefits` varchar(255) DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `cancelDate` datetime DEFAULT NULL,
  `returnAmount` double DEFAULT NULL,
  `subscriptionData` varchar(255) DEFAULT NULL,
  `isCanceled` tinyint(1) DEFAULT '0',
  `subscriptionId` int NOT NULL,
  `subscriptionType` enum('free','paid') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'free',
  `subscriptionPeriod` enum('monthly','yearly') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'monthly',
  `promocode` varchar(255) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `updatedBy` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`userSubscriptionId`),
  KEY `subscriptionId` (`subscriptionId`),
  CONSTRAINT `userSubscriptions_ibfk_1` FOREIGN KEY (`subscriptionId`) REFERENCES `subscriptions` (`subscriptionId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `user_chip_design`;
CREATE TABLE `user_chip_design` (
  `chipDesignId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `chipId` int NOT NULL,
  `chipDesignUrl` varchar(500) NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `logoUrl` varchar(255) DEFAULT NULL,
  `colorCode` varchar(255) DEFAULT NULL,
  `isPurchased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`chipDesignId`),
  KEY `userId` (`userId`),
  KEY `chipId` (`chipId`),
  CONSTRAINT `user_chip_design_ibfk_13` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_chip_design_ibfk_14` FOREIGN KEY (`chipId`) REFERENCES `chips` (`chipId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `user_logo`;
CREATE TABLE `user_logo` (
  `logoId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `logoUrl` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `logoName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`logoId`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_logo_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `mobileNumber` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `isEmailVerified` tinyint DEFAULT '0',
  `isMobileVerified` tinyint DEFAULT '0',
  `is2FA` tinyint DEFAULT '0',
  `emailOTP` varchar(255) DEFAULT NULL,
  `mobileOTP` varchar(255) DEFAULT NULL,
  `mobileOTPExpire` datetime DEFAULT NULL,
  `emailOTPExpire` datetime DEFAULT NULL,
  `authenticatorSecret` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `isActive` tinyint DEFAULT '1',
  `isSuspended` tinyint DEFAULT '0',
  `isBan` tinyint DEFAULT '0',
  `isDeleted` tinyint DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `stripeId` varchar(255) DEFAULT NULL,
  `emailOTPResentCount` int DEFAULT '0',
  `mobileOTPResentCount` int DEFAULT '0',
  `roleId` int DEFAULT NULL,
  `userSubscriptionId` int DEFAULT NULL,
  `userProfile` varchar(255) DEFAULT '',
  `isUpdateMobileOTPVerified` tinyint DEFAULT '0',
  `newMobileNumberTemp` varchar(255) DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `cognitoId` varchar(255) DEFAULT NULL,
  `cognitoIdToken` text,
  `cognitoAuthToken` text,
  `cognitoRefreshToken` text,
  `lastLogin` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email-index` (`email`),
  KEY `roleId` (`roleId`),
  KEY `userSubscriptionId` (`userSubscriptionId`),
  CONSTRAINT `users_ibfk_13` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_14` FOREIGN KEY (`userSubscriptionId`) REFERENCES `userSubscriptions` (`userSubscriptionId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `visitors`;
CREATE TABLE `visitors` (
  `visitorId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `iso2` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `mobileNumber` varchar(255) DEFAULT NULL,
  `isEmailVerified` tinyint(1) DEFAULT '0',
  `emailOtp` varchar(255) DEFAULT NULL,
  `macAddress` varchar(255) DEFAULT NULL,
  `emailOTPExpire` datetime DEFAULT NULL,
  `mobileOTPExpire` datetime DEFAULT NULL,
  `isMobileVerified` tinyint(1) DEFAULT '0',
  `lastVisited` datetime DEFAULT NULL,
  `mobileOtp` char(100) DEFAULT NULL,
  PRIMARY KEY (`visitorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- 2023-06-15 10:29:18
