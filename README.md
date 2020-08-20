# flask-celery-example

An example to run flask with celery including:

- app factory setup
- send a long running task from flask app
- send periodic tasks with celery beat

based on [flask-celery-example by Miguel Grinberg](https://github.com/miguelgrinberg/flask-celery-example) and his [bloc article](http://blog.miguelgrinberg.com/post/using-celery-with-flask)


# endpoints
- / adds a task to the queue and schedule it to start in 10 seconds
- /message - shows messages in the database (revered every 10 seconds by celery task)
- /status/<task_id> - show the status of the long running task


# installation

## start container
```
docker-compose build
docker-compose up -d
docker exec -it flask-celery-example_alert_1 /bin/bash
```
## install dependencies with [poetry](https://python-poetry.org/)
``` bash
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3
source $HOME/.poetry/env
export FLASK_ENV="development"
export FLASK_APP="src.app:create_app"
export SECRET_KEY="change_me"
export DATABASE_URL="postgresql+psycopg2://postgres:postgres@localhost:5432/celery"
export CELERY_TIMEZONE="Europe/Berlin"
export CELERY_BROKER_URL="redis://localhost:6379/0"
export CELERY_RESULT_BACKEND="redis://localhost:6379/0"
poetry install
poetry shell
```

## start redis backend (using docker)
``` bash
docker run -d --name redis -p 6379:6379 redis
```

## run celery worker
```
source .env
celery -A src.worker:celery worker --loglevel=DEBUG
```

## run celery beat for periodic tasks
```
source .env
celery -A src.worker:celery beat --loglevel=INFO
```

## run flask app
``` bash
source .env
# check the available routes
flask routes
# start flask development server
flask run
```
