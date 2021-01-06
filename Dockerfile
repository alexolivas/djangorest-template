# Use an official Python runtime as a parent image
FROM python:3.8
# FROM python:3.8-alpine

# ARG INSTALL_PKGS="\
#     curl \
#     wkhtmltopdf"

# # Install packages the docker image running this project requires
# RUN apk update && apk add $INSTALL_PKGS

# Prevents python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# Ports to expose
EXPOSE 8008

# Copy the code into the directory inside the container
COPY . /opt/project_name

# Set the working directory
WORKDIR /opt/project_name/

ENTRYPOINT [ "./entrypoint.sh" ]
