USE [master]
GO

ALTER LOGIN [sa] WITH PASSWORD='Hobbes!78217'
GO
ALTER LOGIN [sa] ENABLE

CREATE DATABASE [MSPetShop4Orders] ON  PRIMARY 
    ( NAME = N'MSPetShop4Orders', FILENAME = N'C:\sqldata\MSPetShop4Orders.mdf' , SIZE = 167872KB , MAXSIZE = UNLIMITED, FILEGROWTH = 16384KB )
     LOG ON 
    ( NAME = N'MSPetShop4Orders_log', FILENAME = N'C:\sqldata\MSPetShop4Orders_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 16384KB )
    GO