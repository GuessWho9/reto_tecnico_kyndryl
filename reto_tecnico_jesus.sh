#!/bin/bash

echo -e "It will download all images needed Backend - Nginx - BD"
docker pull cedenojes/nginx_reto_tecnico:latest
docker pull cedenojes/postgres_bd:latest
docker pull cedenojes/backend_reto_tecnico
sleep  3
echo -e "The images were downloaded already to my personal repository of dockerhub at local repository, the 03 images needed for technical challenge \n"
echo -n -e "---------------------------------------------------------------------------------------------------------------------------------------------------------\n"
docker images
sleep 3
echo -n -e "--------------------------------------------------------------------------------------------------------------------------------------------------------\n"
echo -n -e "\n"
echo -e "It's begin to build the images belonging to technical challenge"
echo -n -e "--------------------------------------------------------------------------------------------------------------------------------------------------------\n"
docker run -d --name backend_reto_tecnico -t cedenojes/backend_reto_tecnico:latest
docker run -d --name nginx_reto_tecnico cedenojes/nginx_reto_tecnico:latest
docker run --name postgres_bd -e POSTGRES_PASSWORD=Password2023.@. -d cedenojes/postgres_bd:latest
sleep 2
echo -n -e "--------------------------------------------------------------------------------------------------------------------------------------------------------\n"
echo -e "The images were deployment correctly \n"
echo -n -e "---------------------------------------------------------------------------------------------------------------------------------------------------------\n"
sleep 5
docker ps
echo -n -e "\n"
echo -n -e "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n"
echo -n -e "--------Must be waiting 30 sec for the images run correctly-------------------------------------------------\n"
echo -n -e "----------------------------------------------------------------------------------------------------------------------------------------------------------\n"
sleep 30
docker ps
echo -n -e "------------------------------------------------------------------------------------------------------------------------------------------------------------\n"
echo -e " Addition of 02 numbers using REST \n"
echo -n -e "------------------------------------- \n"
echo -n "Enter 01 number:  "
read n1
echo -n "Enter 02 number:  "
read n2
echo -e "Addition result =  "
echo -e "var suma=0;
var json = [
        {"Number 01":"n1":$n1},
        {"Number 02":"n2":$n2}
       ];
json.forEach(function(element, indice) {
    suma += element["Number"];
});
console.log('the number addition is: ' + suma);"
echo $n1 + $n2 = $(($n1+$n2))
echo -n -e "---------------------------------------- \n"
echo -e "The result will added into database = " $(($n1+$n2)) 

