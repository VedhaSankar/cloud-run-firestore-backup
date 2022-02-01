from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route('/')
def start():

    result = {
        "status": "ok"
    }

    return result


@app.route('/backup')
def backup():

    os.system('/app/backup.sh')

    return "Back up complete"



if __name__== "__main__":
    app.run(host="0.0.0.0", debug = True, port = 8500)