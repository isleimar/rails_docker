#!/bin/bash
set -e

#Criado por Isleimar Oliveira
#07/04/2022

echo "Criando o projeto"
docker-compose run --no-deps web rails new . --force --database=postgresql
sudo chown -R $USER:$USER .
docker-compose build

echo "Criando a base de dados"
cp database.yml ./config/
docker-compose run web rake db:create


echo "Iniciando a aplicação"
docker-compose up -d

echo "Concluído"