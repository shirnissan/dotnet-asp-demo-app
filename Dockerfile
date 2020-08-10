FROM mcr.microsoft.com/dotnet/core/aspnet

WORKDIR /aspnetapp
COPY aspnetapp /aspnetapp/
ENTRYPOINT ["dotnet", "restore"]
CMD ["dotnet", "publish -c release -o /app --no-restore"]
