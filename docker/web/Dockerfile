# escape=`
FROM microsoft/dotnet-framework:3.5-sdk-windowsservercore-1709 AS builder

RUN Install-PackageProvider -Name "chocolatey" -RequiredVersion 2.8.5.130 -Force; `
    Install-Package -Name webdeploy -RequiredVersion 3.6.0 -Force
    
WORKDIR /src
COPY ./src/PetShop .
RUN mkdir 'C:\Windows\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files'; `
    msbuild .\Web\website.publishproj /p:DeployOnBuild=true /p:OutputPath=c:\out\ /p:Configuration=Release /p:AutoParameterizationWebConfigConnectionStrings=False

# PetShop
FROM mcr.microsoft.com/dotnet/framework/aspnet:3.5-windowsservercore-1709
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Install-WindowsFeature NET-HTTP-Activation; `
    Remove-Website -Name 'Default Web Site';`
    New-Website -Name 'web-app' -Port 80 -PhysicalPath 'C:\app' -Force

COPY --from=builder C:\out\obj\Release\Package\PackageTmp C:\app