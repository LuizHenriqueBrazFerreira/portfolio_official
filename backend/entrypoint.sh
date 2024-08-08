#!/bin/sh

# Essa parte é importante para garantir que o banco de dados já esteja no ar
# antes de rodar as migrações

while ! nc -z db_service 3306 ; do
    echo "> > > Esperando o banco de dados MySQL ficar disponível..."
    sleep 3
done

echo "> > > Banco de dados MySQL disponível!"


python3 manage.py collectstatic --noinput
python3 manage.py makemigrations
python3 manage.py migrate
gunicorn portfolio.wsgi --bind 0.0.0.0:8000