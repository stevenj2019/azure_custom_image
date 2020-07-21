from flask import Flask 
import socker 

app = Flask(__name__)

host = socket.gethostname()

@app.route('/')
def index():
	return "<h1>Hello World!, I'm deployed automatically on " + str(host) + " :) </h1>"
