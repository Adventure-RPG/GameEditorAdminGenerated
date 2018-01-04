#!/bin/bash
rm -r src web target
ng new web
rm web/src/app/app.module.ts web/src/app/app.component.* web/src/styles.css
mvn -Pdb,metadata,gen generate-sources
rm WELCOME.TXT
rm -r .celerio
rm -r target
cd web
npm install --save @angular/animations
npm install --save @angular/material@2.0.0-beta.6
npm install --save primeng@4.1.0-rc.2
npm install --save font-awesome
cd ../
git add src web
git reset -- web/node_modules/*
git commit -m "sync with latest templates"
git push
