#!/bin/bash

# code as a documentaiton

# projects current location
dir="/home/nika/src/personal/codewars/manager/src/server"


cd "$dir"/api
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.Tools

cd "$dir"/application
dotnet add package Microsoft.EntityFrameworkCore

cd "$dir"/dataaccess
dotnet add package Microsoft.EntityFrameworkCore

# remember for some reason migrations needed this
dotnet add package Microsoft.EntityFrameworkCore.SqlServer


