#!/usr/bin/env bash

nginx_ip=$(dig +short rwo-nginx.default.svc.cluster.local)
URL="http://${nginx_ip}/static.json"

# exec env NGINX=${URL} dotnet run --project TestApi
exec env NGINX=${URL} dotnet TestApi.dll
