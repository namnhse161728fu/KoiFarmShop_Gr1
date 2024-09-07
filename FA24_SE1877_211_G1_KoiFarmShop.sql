USE FA24_SE1877_211_G1_KoiFarmShop
GO

CREATE TABLE Fish(
    FishTypeID INT  PRIMARY KEY,
    FishName NVARCHAR(250) NOT NULL,
    FishColor NVARCHAR(250),
    FishGender BIT,
    FishBirth DATE,
    MinSize INT,
    MaxSize INT,
    MinPrice FLOAT,
    MaxPrice FLOAT,
    Breed NVARCHAR(250),
    Origin NVARCHAR(250),
    IsActive BIT
);


Create table Account 
(
	AccountID int identity(1,1) primary key,
	EmailAddress nvarchar(255) unique,
	FullName nvarchar(255),
	Password nvarchar(20),
	PhoneNumber varchar(20),
	Status bit,
	Role nvarchar(20) --Manager, Staff, Customer
)

CREATE TABLE [dbo].[Order] (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
	Quantity int,
    TotalAmount float,
    Status NVARCHAR(50), --Pending, Accepted, Ready, Shipping, Shipped, Cancelled
    ShippingAddress NVARCHAR(255),
	ShipStartDate DATETIME,
	ShipEndDate DATETIME,
	OrderNote nvarchar(255),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

CREATE TABLE consignments (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    AccountID int NOT NULL,
    ProductName NVARCHAR(255) NOT NULL,
    Quantity INT NOT NULL,
    DepositDate DATETIME NOT NULL,
    Returndate DATETIME NULL,
    Status NVARCHAR(20) CHECK (status IN ('Pending', 'In Progress', 'Completed', 'Canceled')) NOT NULL,
    WarehouseLocation NVARCHAR(255) NULL,
    ConsigneeContact NVARCHAR(255) NULL,
    ConsignmentValue DECIMAL(10, 2) NULL,
    DeliveryMethod NVARCHAR(20) CHECK (DeliveryMethod IN ('Pickup', 'Delivery', 'Courier')) NULL,
    Notes NVARCHAR(MAX) NULL,
	FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);


CREATE TABLE Promotions (
    ID INT IDENTITY(1,1) PRIMARY KEY, -- Use IDENTITY
    PromotionName VARCHAR(255) NOT NULL,
    PromotionType VARCHAR(50) NOT NULL,
    Value DECIMAL(10,2) NOT NULL,
    Unit VARCHAR(10) NOT NULL,
    ConditionForApplication TEXT,
    StartDate DATE,
    EndDate DATE,
    Status TINYINT DEFAULT 1,
    Description TEXT
);
