#!/bin/bash

cd ..
mkdir manager
cd manager

mkdir src
mkdir src/server
mkdir src/front

cd src/server
mkdir application 
mkdir infrastructure
mkdir domain 
mkdir dataaccess 
mkdir externalservices
mkdir api
mkdir scripts

dotnet new classlib -o application  
dotnet new classlib -o infrastructure
dotnet new classlib -o domain
dotnet new classlib -o dataaccess
dotnet new classlib -o externalservices
dotnet new webapi -o api -n api

cd ../..


mkdir tests
dotnet new xunit -o tests -n tests
cd tests 
dotnet add reference ../src/server/application/application.csproj
cd ..

dotnet new sln -n manager
dotnet sln add src/server/application/application.csproj
dotnet sln add src/server/infrastructure/infrastructure.csproj
dotnet sln add src/server/domain/domain.csproj
dotnet sln add src/server/dataaccess/dataaccess.csproj
dotnet sln add src/server/externalservices/externalservices.csproj
dotnet sln add src/server/api/api.csproj
dotnet sln add tests/tests.csproj

cd src/server/application
dotnet add reference ../domain/domain.csproj
dotnet add reference ../dataaccess/dataaccess.csproj
dotnet add reference ../infrastructure/infrastructure.csproj

cd ../dataaccess
dotnet add reference ../domain/domain.csproj
dotnet add reference ../infrastructure/infrastructure.csproj

cd ../infrastructure
dotnet add reference ../domain/domain.csproj

cd ../api
dotnet add reference ../domain/domain.csproj
dotnet add reference ../application/application.csproj


