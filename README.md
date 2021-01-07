# Django REST Starter Template

A project starter template for Django 3.1.4 and django-rest 3.12.2.

## Features

- Configured for production environments running gunicorn
- Production ready docker setup for easy deployment
- Serve django's static files with Whitenoise
- Built-in support for CORS management
- Dependency management with `Pipenv`
- Python formatting with black
- Python 3.8 environment
- Customizable via environment variables defined in `.env` file
- Comes installed with `pre-commit`

## Creating Your Project

Use this template to create a new Django REST project:

```bash
django-admin.py startproject --template=https://github.com/alexolivas/djangorest-template/archive/master.zip --name=Procfile <your-project-name>
```

## Configuration

Create an environment variables file `vim .env` with the following values

```bash
POSTGRES_USER=<username>
POSTGRES_PASSWORD=<password>
POSTGRES_DB=<db-name>
POSTGRES_PORT=5432
POSTGRES_HOST=postgres
SECRET_KEY=<generate-secret-key>
DEBUG=<True|False>
# Examples
ALLOWED_HOSTS=localhost:3000, 0.0.0.0
CORS_ORIGIN_WHITELIST='http://localhost:3000', 'http://127.0.0.1:3000'
```

## Docker And Docker Compose

This project uses docker which means you can use the standard docker and docker-compose commands to manage your project

```bash
docker-compose up --build
```

To start a container

```bash
docker-compose up
```

## Dependency Management With Pipenv

This project uses `Pipenv` to manage it's dependencies. There's no need to do anything to setup the project, but if you want add or delete packages you'll have to install them via Pipenv within your project's docker container. This project doesn't rely on setting up a virtualenv for development since the docker container's volume is mounted to your local computer.

## Code Formatting And Pre-Commit

This project uses `black` code formatter to keep your python code styling consistent. You also have the option of taking advantage of `pre-commit` so all of your staged files are automatically formatted for a consistent code base. `pre-commit` is configured via the [.pre-commit-config.yaml](.pre-commit-config.yaml) file. See [installation instructions](https://pre-commit.com/#install) to set this up in your local environment.

To run black on its own, within the docker container, run:

```bash
black .
```

## License: MIT

## Further Reading

- [Django REST](https://www.django-rest-framework.org/)
- [Gunicorn](https://warehouse.python.org/project/gunicorn/)
- [WhiteNoise](https://warehouse.python.org/project/whitenoise/)
- [Pipenv](https://pypi.org/project/pipenv/)
- [black](https://black.readthedocs.io/en/stable/)
- [pre-commit](https://pre-commit.com/)
