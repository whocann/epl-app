# epl-app
an experimental app about English Premier League using SAP Cloud Platform Programming Model

https://blogs.sap.com/2019/10/19/build-an-english-premier-league-app-with-sap-cloud-application-programming-model-part-1-the-story-begins/

git clone https://github.com/whocann/epl-app.git

npm install

cds deploy --to sqlite:db/epl.db && cds watch .

http://localhost:4004


http://localhost:4004/$fiori-preview/?service=com.epl.CatalogService&entity=Matches&sap-language=zh_CN

http://localhost:4004/$fiori-preview/?service=com.epl.CatalogService&entity=Matches&sap-language=de_DE