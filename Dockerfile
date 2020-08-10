FROM mcr.microsoft.com/dotnet/core/aspnet

WORKDIR /aspnetapp
COPY aspnetapp /aspnetapp/
RUN dotnet restore
ENTRYPOINT dotnet msbuild aspnetapp.csproj

