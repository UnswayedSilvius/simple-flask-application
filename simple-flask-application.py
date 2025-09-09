from flask import Flask

# Create a Flask web server instance.
app = Flask(__name__)

# Define the root route ("/") for the web application.
# When a user accesses the root URL, this function will be called.
@app.route('/')
def hello():
    # Return a specific string. This is the message our pipeline
    # will test for to confirm the application is running correctly.
    return 'Hello from Sukuna!'

# This block ensures the application runs only when the script is executed directly.
if __name__ == '__main__':
    # Start the Flask development server.
    # The host='0.0.0.0' makes the server accessible from any network interface,
    # which is crucial for running inside a Docker container.
    # The port is set to 5000, which is the standard port for Flask.
    app.run(host='0.0.0.0', port=5000)