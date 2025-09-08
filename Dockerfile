# Use an official Python runtime as a parent image.
# We are using a specific version (3.9-slim) to ensure consistency and
# keep the final image size as small as possible.
FROM python:3.9-slim

# Set the working directory to /app. All subsequent commands will run from here.
# This keeps the container's file system organized and clean.
WORKDIR /app

# Copy the requirements.txt file into the container.
# This step is done early to leverage Docker's build cache. If requirements.txt
# doesn't change, Docker can reuse this layer, making builds faster.
COPY requirements.txt .

# Install the Python dependencies listed in requirements.txt.
# The --no-cache-dir option is a best practice to reduce the size of the image.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container.
COPY . .

# Expose port 5000. This is the port our Flask app listens on.
# It's a way of documenting which port the container uses.
EXPOSE 5000

ENV FLASK_APP=simple-flask-application.py

# Run the Flask application.
# The CMD instruction specifies the command that will be executed when
# the container starts. The --host=0.0.0.0 makes the app accessible from
# outside the container itself, which is essential.
CMD ["flask", "run", "--host=0.0.0.0"]
