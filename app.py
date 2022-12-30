import sys
from loguru import logger
from flask import Flask, render_template
logger.add(sys.stderr, format="<red>[{level}]</red> Message : <green>{message}</green> @ {time}", colorize=True)

app = Flask(__name__)

@logger.catch
@app.route("/")
def main():
    global running_status
    return render_template('index.html')



if __name__ == "__main__":
    from waitress import serve
    serve(app, host="0.0.0.0", port=8080)