#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS base
WORKDIR /app
COPY *.csproj ./
RUN dotnet restore
COPY . ./

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:3.1
WORKDIR /app
COPY --from=base /app/out .
ENTRYPOINT ["dotnet", "SimpleWebHalloWorld.dll"]