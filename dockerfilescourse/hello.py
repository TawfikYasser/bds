from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return "Flask Second Container"

@app.route('/first_docker')
def firstDocker():
    return "Hello from first docker"


if __name__ == "__main__":
    app.run(debug=False, host='0.0.0.0', port=5000)