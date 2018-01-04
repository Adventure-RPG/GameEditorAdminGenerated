#!/usr/bin/env bash
cd web
npm install --save-dev  
ng build --prod
cp dist/* ../src/main/resources/static
cd ..
mvn package
cp target/celerio-game-editor-admin-generated.jar docker/.
cd docker
docker-compose build db admin
docker-compose up -d
