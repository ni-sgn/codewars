#!/bin/bash

mkdir ../pipe
dir="../pipe"

mkdir "$dir"/src
src="$dir"/src
mkdir "$dir"/tests
tests="$dir"/tests


dotnet new console -o "$src" -n pipe
dotnet new xunit -o "$tests" -n tests 
dotnet new sln -o "$dir" -n pipe
cd "$dir"
dotnet sln add ./src/pipe.csproj
dotnet sln add ./tests/tests.csproj

cd tests
dotnet add reference ../src/pipe.csproj
