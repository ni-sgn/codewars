# !/bin/bash

echo "setting up folders"
mkdir ../src
mkdir ../tests

echo "creating dotnet consle project"
dotnet new console -o ../src -n cw

echo "creating test project"
dotnet new xunit -o ../tests

echo "creating solution"
dotnet new sln -n CW

echo "adding projects to the sln"
dotnet sln add ../src/cw.csproj
dotnet sln add ../tests/tests.csproj

echo "finished"
