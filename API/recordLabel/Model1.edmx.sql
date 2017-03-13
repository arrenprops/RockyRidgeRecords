
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/13/2017 09:51:40
-- Generated from EDMX file: C:\Users\Arren\Documents\Visual Studio 2015\Projects\recordLabel\recordLabel\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [recordLabel];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Artistmember]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Members1] DROP CONSTRAINT [FK_Artistmember];
GO
IF OBJECT_ID(N'[dbo].[FK_Artistalbum]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[albums] DROP CONSTRAINT [FK_Artistalbum];
GO
IF OBJECT_ID(N'[dbo].[FK_albumsong]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[songs] DROP CONSTRAINT [FK_albumsong];
GO
IF OBJECT_ID(N'[dbo].[FK_Artistproduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[products] DROP CONSTRAINT [FK_Artistproduct];
GO
IF OBJECT_ID(N'[dbo].[FK_ArtisttourDates]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tourDates] DROP CONSTRAINT [FK_ArtisttourDates];
GO
IF OBJECT_ID(N'[dbo].[FK_Cartalbum]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[albums] DROP CONSTRAINT [FK_Cartalbum];
GO
IF OBJECT_ID(N'[dbo].[FK_Cartproduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[products] DROP CONSTRAINT [FK_Cartproduct];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Artists]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Artists];
GO
IF OBJECT_ID(N'[dbo].[tourDates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tourDates];
GO
IF OBJECT_ID(N'[dbo].[albums]', 'U') IS NOT NULL
    DROP TABLE [dbo].[albums];
GO
IF OBJECT_ID(N'[dbo].[products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[products];
GO
IF OBJECT_ID(N'[dbo].[songs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[songs];
GO
IF OBJECT_ID(N'[dbo].[Members1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Members1];
GO
IF OBJECT_ID(N'[dbo].[Carts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Carts];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Artists'
CREATE TABLE [dbo].[Artists] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [numMembers] int  NOT NULL,
    [isTouring] bit  NOT NULL,
    [picUrl] nvarchar(max)  NULL
);
GO

-- Creating table 'tourDates'
CREATE TABLE [dbo].[tourDates] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [date] datetime  NOT NULL,
    [venue] nvarchar(max)  NOT NULL,
    [price] decimal(18,0)  NOT NULL,
    [ArtistId] int  NOT NULL,
    [location] nvarchar(max)  NULL
);
GO

-- Creating table 'albums'
CREATE TABLE [dbo].[albums] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [dateReleased] datetime  NOT NULL,
    [ArtistId] int  NOT NULL,
    [price] decimal(18,0)  NULL,
    [picUrl] nvarchar(max)  NULL,
    [CartId] int  NULL
);
GO

-- Creating table 'products'
CREATE TABLE [dbo].[products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [price] decimal(18,0)  NOT NULL,
    [size] nvarchar(max)  NULL,
    [ArtistId] int  NOT NULL,
    [picUrl] nvarchar(max)  NULL,
    [onSale] bit  NOT NULL,
    [CartId] int  NULL
);
GO

-- Creating table 'songs'
CREATE TABLE [dbo].[songs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [lyrics] nvarchar(max)  NOT NULL,
    [albumId] int  NOT NULL
);
GO

-- Creating table 'Members1'
CREATE TABLE [dbo].[Members1] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [instrument] nvarchar(max)  NOT NULL,
    [ArtistId] int  NOT NULL
);
GO

-- Creating table 'Carts'
CREATE TABLE [dbo].[Carts] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Artists'
ALTER TABLE [dbo].[Artists]
ADD CONSTRAINT [PK_Artists]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'tourDates'
ALTER TABLE [dbo].[tourDates]
ADD CONSTRAINT [PK_tourDates]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'albums'
ALTER TABLE [dbo].[albums]
ADD CONSTRAINT [PK_albums]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'products'
ALTER TABLE [dbo].[products]
ADD CONSTRAINT [PK_products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'songs'
ALTER TABLE [dbo].[songs]
ADD CONSTRAINT [PK_songs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Members1'
ALTER TABLE [dbo].[Members1]
ADD CONSTRAINT [PK_Members1]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Carts'
ALTER TABLE [dbo].[Carts]
ADD CONSTRAINT [PK_Carts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ArtistId] in table 'Members1'
ALTER TABLE [dbo].[Members1]
ADD CONSTRAINT [FK_Artistmember]
    FOREIGN KEY ([ArtistId])
    REFERENCES [dbo].[Artists]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Artistmember'
CREATE INDEX [IX_FK_Artistmember]
ON [dbo].[Members1]
    ([ArtistId]);
GO

-- Creating foreign key on [ArtistId] in table 'albums'
ALTER TABLE [dbo].[albums]
ADD CONSTRAINT [FK_Artistalbum]
    FOREIGN KEY ([ArtistId])
    REFERENCES [dbo].[Artists]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Artistalbum'
CREATE INDEX [IX_FK_Artistalbum]
ON [dbo].[albums]
    ([ArtistId]);
GO

-- Creating foreign key on [albumId] in table 'songs'
ALTER TABLE [dbo].[songs]
ADD CONSTRAINT [FK_albumsong]
    FOREIGN KEY ([albumId])
    REFERENCES [dbo].[albums]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_albumsong'
CREATE INDEX [IX_FK_albumsong]
ON [dbo].[songs]
    ([albumId]);
GO

-- Creating foreign key on [ArtistId] in table 'products'
ALTER TABLE [dbo].[products]
ADD CONSTRAINT [FK_Artistproduct]
    FOREIGN KEY ([ArtistId])
    REFERENCES [dbo].[Artists]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Artistproduct'
CREATE INDEX [IX_FK_Artistproduct]
ON [dbo].[products]
    ([ArtistId]);
GO

-- Creating foreign key on [ArtistId] in table 'tourDates'
ALTER TABLE [dbo].[tourDates]
ADD CONSTRAINT [FK_ArtisttourDates]
    FOREIGN KEY ([ArtistId])
    REFERENCES [dbo].[Artists]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArtisttourDates'
CREATE INDEX [IX_FK_ArtisttourDates]
ON [dbo].[tourDates]
    ([ArtistId]);
GO

-- Creating foreign key on [CartId] in table 'albums'
ALTER TABLE [dbo].[albums]
ADD CONSTRAINT [FK_Cartalbum]
    FOREIGN KEY ([CartId])
    REFERENCES [dbo].[Carts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Cartalbum'
CREATE INDEX [IX_FK_Cartalbum]
ON [dbo].[albums]
    ([CartId]);
GO

-- Creating foreign key on [CartId] in table 'products'
ALTER TABLE [dbo].[products]
ADD CONSTRAINT [FK_Cartproduct]
    FOREIGN KEY ([CartId])
    REFERENCES [dbo].[Carts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Cartproduct'
CREATE INDEX [IX_FK_Cartproduct]
ON [dbo].[products]
    ([CartId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------