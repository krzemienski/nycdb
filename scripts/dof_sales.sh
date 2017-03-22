#!/bin/bash

set -e
pwd=$(pwd)
printf "***DOF ROLLING SALES***\n"

cp ./env.sh ${pwd}/modules/dof-sales/env.sh

if [ ! -d "${pwd}/modules/dof-sales/venv" ]; then
    printf "Setting up python3 virtual environment with xlrd\n"
    cd ${pwd}/modules/dof-sales
    python3 -m venv venv
    source venv/bin/activate
    pip3 install xlrd
    cd ${pwd}
else
    printf "Using the python3 virutal environment located at ${pwd}/modules/dof-sales/venv\n"
fi

source ${pwd}/modules/dof-sales/venv/bin/activate
cd ${pwd}/modules/dof-sales
bash to_postgres.sh ${pwd}/data/dofsales
deactivate

cd ${pwd}