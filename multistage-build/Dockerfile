FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as build
WORKDIR /source
ENV HOME /source

COPY TestApi/*sln .
COPY TestApi/TestApi/*csproj ./TestApi/
RUN dotnet restore

COPY TestApi/TestApi/. ./TestApi/
RUN dotnet publish -c Release -o OUTPUT
RUN dotnet dev-certs https -ep /source/TestApi.pfx -p password


FROM ubuntu-with-runtime:1
WORKDIR /app
ENV HOME /app
COPY --from=build /source/OUTPUT ./
COPY --from=build /source/TestApi.pfx .
ENV ASPNETCORE_Kestrel__Certificates__Default__Password=password
ENV ASPNETCORE_Kestrel__Certificates__Default__Path=/app/TestApi.pfx
ENV ASPNETCORE_URLS=https://0.0.0.0:5001
COPY runner.sh ./
ENTRYPOINT ["./runner.sh"]




