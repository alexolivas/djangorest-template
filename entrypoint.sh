#!/usr/bin/env bash

# Install pipenv and the project's requirements
# pip install pipenv
# pipenv install --system --deploy --ignore-pipfile

# Run the django migrations
python manage.py migrate

if [ $DEBUG ]; then
	# install the dev requirements e.g coverage and tox for testing
	echo " "
	echo "Installing development requirements.."
	# pip3 install -r requirements-dev.txt
	pipenv install --dev --system --deploy --ignore-pipfile

	echo " "
	echo "Starting local development server.."

	# Start the server using the nostatic flag so that whitenoise can handle static files
	# instead of django's built-in web server
	python manage.py runserver 0.0.0.0:8008 --nostatic
else
	# # Load any demo data 
	# echo " "
	# python3 manage.py loaddata fixture.json

	# Collect static files (django-rest, swagger, and dyrf)
	python manage.py collectstatic --noinput

	echo " "
	echo "Starting production environment server.."

	# Production environments are started by gunicorn
	exec gunicorn project_name.wsgi:application \
		--name project_name \
		--bind 0.0.0.0:8008 \
		"$@"
fi

# pipenv lock --pre --clear