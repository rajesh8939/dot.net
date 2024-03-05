# Use the official .NET Core SDK image as the build environment
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

# Copy the .NET Core project file and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the entire project and build the application
COPY . ./
RUN dotnet publish -c Release -o out

# Use the official .NET Core runtime image for the final stage
FROM mcr.microsoft.com/dotnet/runtime:6.0 AS runtime
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "MyDotNetApp.dll"]
