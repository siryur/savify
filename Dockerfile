# Use an official Python runtime as a base image
FROM python:3.13-alpine

# Install any needed packages specified in requirements.txt
# RUN apk add --update ffmpeg
RUN apk add --update ffmpeg git

# Clone repo to container
WORKDIR /usr/local/src
COPY . .

# Install dependencies and setup savify from source
RUN pip3 install requests --upgrade
# RUN python3 setup.py install
RUN pip3 install setuptools wheel
RUN pip3 install .

# Define environment variable as placeholder variables
ENV SPOTIPY_CLIENT_ID=
ENV SPOTIPY_CLIENT_SECRET=

# Execute savify when container is started
ENTRYPOINT ["/usr/local/bin/savify"]
# Automatically print help if container is started without arguments
CMD ["--help"]
