FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 8017

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

COPY "./MockDogApiDec17.csproj" ./
RUN dotnet restore "./MockDogApiDec17.csproj"

COPY . .
RUN dotnet build "./MockDogApiDec17.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "./MockDogApiDec17.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT [ "dotnet", "MockDogApiDec17.dll" ]