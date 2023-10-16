FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app

EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 as build
COPY . .
RUN dotnet restore "manager.sln"
RUN dotnet build  "src/server/api/api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "manager.sln" -c Release -o /app /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/ .
ENTRYPOINT ["dotnet", "api.dll"]
