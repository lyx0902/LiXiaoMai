


drop table product;
CREATE TABLE IF NOT EXISTS `PRODUCT`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `NAME` VARCHAR(16) NOT NULL,
    `PRICE` DECIMAL(10,2) NOT NULL DEFAULT '0',
    `STOCK` INT NOT NULL DEFAULT '0',
    `TYPE` VARCHAR(10) NOT NULL,
    `DESCRIPTION` VARCHAR(100),
    `SID` INT NOT NULL,
    `URL` VARCHAR(200) default null
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table deliverman;
CREATE TABLE IF NOT EXISTS `DELIVERMAN`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `NAME` VARCHAR(10) NOT NULL,
    `UNAME` VARCHAR(16) NOT NULL,
    `PASSWORD` VARCHAR(20) NOT NULL,
    `TELEPHONE` VARCHAR(11) NOT NULL,
    `GENDER` VARCHAR(2) NOT NULL,
    `VTYPE` VARCHAR(10) NOT NULL,
    `VID` INT,
    `VBRAND` VARCHAR(10) NOT NULL,
    `STATUS` INT NOT NULL
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table customer;
CREATE TABLE IF NOT EXISTS `CUSTOMER`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `NAME` VARCHAR(10) NOT NULL,
    `UNAME` VARCHAR(16) NOT NULL,
    `PASSWORD` VARCHAR(20) NOT NULL,
    `TELEPHONE` VARCHAR(11) NOT NULL,
    `GENDER` VARCHAR(1) NOT NULL,
    `BIRTHDAY` DATE NOT NULL,
    `ADDRESS` VARCHAR(100) NOT NULL
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table comment;
CREATE TABLE IF NOT EXISTS `COMMENT`(
                                        `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                        `OID` INT NOT NULL,
                                        `STARTID` INT DEFAULT '0',
                                        `ENDID` INT DEFAULT '0',
                                        `STARTNAME` VARCHAR(16),
                                        `ENDNAME` VARCHAR(16),
                                        `TIME` DATETIME NOT NULL,
                                        `CONTENT` VARCHAR(100),
                                        `LIKES` INT,
                                        `COID` INT DEFAULT '0',
                                        `DISLIKES` INT DEFAULT '0',
                                        `STATUS` INT NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table `order`;
CREATE TABLE IF NOT EXISTS `ORDER`(
    `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `CID` INT NOT NULL,
    `SID` INT NOT NULL,
    `GID` VARCHAR(100) NOT NULL,
    `deliverID` INT default '0',
    `GOODSNUM` VARCHAR(100) NOT NULL,
    `ENDTIME` DATETIME,
    `STARTTIME` DATETIME NOT NULL,
    `TOTAL` DECIMAL(10,2) NOT NULL,
    `STATUS` INT NOT NULL,
    `SNAME` VARCHAR(20) NOT NULL,
    `DISCOUNTNUM` VARCHAR(100),
    `DID` VARCHAR(100),
    `CNAME` VARCHAR(16) NOT NULL
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table cart;
CREATE TABLE IF NOT EXISTS `CART`(
    `CID` INT NOT NULL,
    `GID` VARCHAR(100),
    `GOODSNUM` VARCHAR(100),
    `TOTAL` DECIMAL(10,2)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;


drop table wallet;
CREATE TABLE IF NOT EXISTS `WALLET`(
                                       `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                       `PASSWORD` VARCHAR(10),
                                       `BALANCE` DECIMAL(10,2) default 0,
                                       `DID` VARCHAR(100),
                                       `DISCOUNTNUM` VARCHAR(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table admin;
CREATE TABLE IF NOT EXISTS `ADMIN`(
                                      `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                      `PASSWORD` VARCHAR(20),
                                      `UNAME` VARCHAR(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table business;
CREATE TABLE IF NOT EXISTS `BUSINESS`(
                                         `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                         `PASSWORD` VARCHAR(20),
                                         `SHOPNAME` VARCHAR(20),
                                         `UNAME` VARCHAR(16),
                                          `NAME` VARCHAR(10),
                                         `ADDRESS` VARCHAR(32),
                                         `TELEPHONE` VARCHAR(11),
                                         `IDCARD` VARCHAR(18),
    `STATUS` INT DEFAULT 1
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table coupon;
CREATE TABLE IF NOT EXISTS `COUPON`(
                                       `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                       `LIMIT` INT,
                                       `DISCOUNT` DECIMAL(10, 2)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;