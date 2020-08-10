FROM mcr.microsoft.com/dotnet/core/aspnet

WORKDIR /aspnetapp
COPY aspnetapp /aspnetapp/
ENTRYPOINT ["dotnet restore", "dotnet publish -c release -o /app --no-restore"]
