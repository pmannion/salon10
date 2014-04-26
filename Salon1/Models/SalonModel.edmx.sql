
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/26/2014 20:41:58
-- Generated from EDMX file: C:\Users\Ger\Source\Repos\salon7\Salon1\Models\SalonModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Salon];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_Booking_dbo_Customer_FirstName]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bookings] DROP CONSTRAINT [FK_dbo_Booking_dbo_Customer_FirstName];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Booking_dbo_Staff_StaffID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bookings] DROP CONSTRAINT [FK_dbo_Booking_dbo_Staff_StaffID];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Booking_dbo_Status_Description]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bookings] DROP CONSTRAINT [FK_dbo_Booking_dbo_Status_Description];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Contact_dbo_Customer_CustomerID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Contacts] DROP CONSTRAINT [FK_dbo_Contact_dbo_Customer_CustomerID];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Contact_dbo_Staff_StaffID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Contacts] DROP CONSTRAINT [FK_dbo_Contact_dbo_Staff_StaffID];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Notifier_dbo_Booking_BookingID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Notifiers] DROP CONSTRAINT [FK_dbo_Notifier_dbo_Booking_BookingID];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Notifier_dbo_Customer_CustomerID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Notifiers] DROP CONSTRAINT [FK_dbo_Notifier_dbo_Customer_CustomerID];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Staff_dbo_Role_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Staffs] DROP CONSTRAINT [FK_dbo_Staff_dbo_Role_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Treatment_dbo_TreatmentType_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Treatments] DROP CONSTRAINT [FK_dbo_Treatment_dbo_TreatmentType_Category];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Bookings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Bookings];
GO
IF OBJECT_ID(N'[dbo].[Contacts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contacts];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Notifiers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Notifiers];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[Staffs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Staffs];
GO
IF OBJECT_ID(N'[dbo].[Status]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Status];
GO
IF OBJECT_ID(N'[dbo].[Treatments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Treatments];
GO
IF OBJECT_ID(N'[dbo].[TreatmentTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TreatmentTypes];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Bookings'
CREATE TABLE [dbo].[Bookings] (
    [BookingID] int IDENTITY(1,1) NOT NULL,
    [TimeStart] datetime  NULL,
    [EndTime] datetime  NULL,
    [CustomerID] int  NOT NULL,
    [StaffID] int  NOT NULL,
    [StatusID] int  NOT NULL,
    [TreatmentID] int  NOT NULL,
    [Date] datetime  NULL
);
GO

-- Creating table 'Contacts'
CREATE TABLE [dbo].[Contacts] (
    [ContactID] int IDENTITY(1,1) NOT NULL,
    [AddressLine1] nvarchar(50)  NULL,
    [AddressLine2] nvarchar(50)  NULL,
    [Town] nvarchar(50)  NULL,
    [City] nvarchar(50)  NULL,
    [Email] nvarchar(50)  NULL,
    [Phone] nvarchar(50)  NULL,
    [CustomerID] int  NULL,
    [StaffID] int  NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerID] int IDENTITY(1,1) NOT NULL,
    [LastName] nvarchar(50)  NULL,
    [FirstName] nvarchar(50)  NULL,
    [Gender] nvarchar(50)  NULL,
    [DOB] datetime  NULL
);
GO

-- Creating table 'Notifiers'
CREATE TABLE [dbo].[Notifiers] (
    [NotifierID] int IDENTITY(1,1) NOT NULL,
    [CustomerID] int  NOT NULL,
    [BookingID] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [RoleID] int IDENTITY(1,1) NOT NULL,
    [Category] nvarchar(50)  NULL
);
GO

-- Creating table 'Staffs'
CREATE TABLE [dbo].[Staffs] (
    [StaffID] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(50)  NULL,
    [Lastname] nvarchar(50)  NULL,
    [RoleID] int  NOT NULL
);
GO

-- Creating table 'Status'
CREATE TABLE [dbo].[Status] (
    [StatusID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(50)  NULL
);
GO

-- Creating table 'Treatments'
CREATE TABLE [dbo].[Treatments] (
    [TreatmentID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NULL,
    [Cost] decimal(5,2)  NOT NULL,
    [TreatmentTypeID] int  NOT NULL
);
GO

-- Creating table 'TreatmentTypes'
CREATE TABLE [dbo].[TreatmentTypes] (
    [TreatmentTypeID] int IDENTITY(1,1) NOT NULL,
    [Category] nvarchar(50)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [BookingID] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [PK_Bookings]
    PRIMARY KEY CLUSTERED ([BookingID] ASC);
GO

-- Creating primary key on [ContactID] in table 'Contacts'
ALTER TABLE [dbo].[Contacts]
ADD CONSTRAINT [PK_Contacts]
    PRIMARY KEY CLUSTERED ([ContactID] ASC);
GO

-- Creating primary key on [CustomerID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [NotifierID] in table 'Notifiers'
ALTER TABLE [dbo].[Notifiers]
ADD CONSTRAINT [PK_Notifiers]
    PRIMARY KEY CLUSTERED ([NotifierID] ASC);
GO

-- Creating primary key on [RoleID] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RoleID] ASC);
GO

-- Creating primary key on [StaffID] in table 'Staffs'
ALTER TABLE [dbo].[Staffs]
ADD CONSTRAINT [PK_Staffs]
    PRIMARY KEY CLUSTERED ([StaffID] ASC);
GO

-- Creating primary key on [StatusID] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([StatusID] ASC);
GO

-- Creating primary key on [TreatmentID] in table 'Treatments'
ALTER TABLE [dbo].[Treatments]
ADD CONSTRAINT [PK_Treatments]
    PRIMARY KEY CLUSTERED ([TreatmentID] ASC);
GO

-- Creating primary key on [TreatmentTypeID] in table 'TreatmentTypes'
ALTER TABLE [dbo].[TreatmentTypes]
ADD CONSTRAINT [PK_TreatmentTypes]
    PRIMARY KEY CLUSTERED ([TreatmentTypeID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerID] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [FK_dbo_Booking_dbo_Customer_FirstName]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customers]
        ([CustomerID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Booking_dbo_Customer_FirstName'
CREATE INDEX [IX_FK_dbo_Booking_dbo_Customer_FirstName]
ON [dbo].[Bookings]
    ([CustomerID]);
GO

-- Creating foreign key on [StaffID] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [FK_dbo_Booking_dbo_Staff_StaffID]
    FOREIGN KEY ([StaffID])
    REFERENCES [dbo].[Staffs]
        ([StaffID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Booking_dbo_Staff_StaffID'
CREATE INDEX [IX_FK_dbo_Booking_dbo_Staff_StaffID]
ON [dbo].[Bookings]
    ([StaffID]);
GO

-- Creating foreign key on [StatusID] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [FK_dbo_Booking_dbo_Status_Description]
    FOREIGN KEY ([StatusID])
    REFERENCES [dbo].[Status]
        ([StatusID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Booking_dbo_Status_Description'
CREATE INDEX [IX_FK_dbo_Booking_dbo_Status_Description]
ON [dbo].[Bookings]
    ([StatusID]);
GO

-- Creating foreign key on [BookingID] in table 'Notifiers'
ALTER TABLE [dbo].[Notifiers]
ADD CONSTRAINT [FK_dbo_Notifier_dbo_Booking_BookingID]
    FOREIGN KEY ([BookingID])
    REFERENCES [dbo].[Bookings]
        ([BookingID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Notifier_dbo_Booking_BookingID'
CREATE INDEX [IX_FK_dbo_Notifier_dbo_Booking_BookingID]
ON [dbo].[Notifiers]
    ([BookingID]);
GO

-- Creating foreign key on [CustomerID] in table 'Contacts'
ALTER TABLE [dbo].[Contacts]
ADD CONSTRAINT [FK_dbo_Contact_dbo_Customer_CustomerID]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customers]
        ([CustomerID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Contact_dbo_Customer_CustomerID'
CREATE INDEX [IX_FK_dbo_Contact_dbo_Customer_CustomerID]
ON [dbo].[Contacts]
    ([CustomerID]);
GO

-- Creating foreign key on [StaffID] in table 'Contacts'
ALTER TABLE [dbo].[Contacts]
ADD CONSTRAINT [FK_dbo_Contact_dbo_Staff_StaffID]
    FOREIGN KEY ([StaffID])
    REFERENCES [dbo].[Staffs]
        ([StaffID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Contact_dbo_Staff_StaffID'
CREATE INDEX [IX_FK_dbo_Contact_dbo_Staff_StaffID]
ON [dbo].[Contacts]
    ([StaffID]);
GO

-- Creating foreign key on [CustomerID] in table 'Notifiers'
ALTER TABLE [dbo].[Notifiers]
ADD CONSTRAINT [FK_dbo_Notifier_dbo_Customer_CustomerID]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customers]
        ([CustomerID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Notifier_dbo_Customer_CustomerID'
CREATE INDEX [IX_FK_dbo_Notifier_dbo_Customer_CustomerID]
ON [dbo].[Notifiers]
    ([CustomerID]);
GO

-- Creating foreign key on [RoleID] in table 'Staffs'
ALTER TABLE [dbo].[Staffs]
ADD CONSTRAINT [FK_dbo_Staff_dbo_Role_Category]
    FOREIGN KEY ([RoleID])
    REFERENCES [dbo].[Roles]
        ([RoleID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Staff_dbo_Role_Category'
CREATE INDEX [IX_FK_dbo_Staff_dbo_Role_Category]
ON [dbo].[Staffs]
    ([RoleID]);
GO

-- Creating foreign key on [TreatmentTypeID] in table 'Treatments'
ALTER TABLE [dbo].[Treatments]
ADD CONSTRAINT [FK_dbo_Treatment_dbo_TreatmentType_Category]
    FOREIGN KEY ([TreatmentTypeID])
    REFERENCES [dbo].[TreatmentTypes]
        ([TreatmentTypeID])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Treatment_dbo_TreatmentType_Category'
CREATE INDEX [IX_FK_dbo_Treatment_dbo_TreatmentType_Category]
ON [dbo].[Treatments]
    ([TreatmentTypeID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------