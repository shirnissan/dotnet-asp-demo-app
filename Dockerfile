FROM mcr.microsoft.com/dotnet/core/aspnet

WORKDIR /aspnetapp

COPY aspnetapp.csproj /aspnetapp/
COPY . /app
