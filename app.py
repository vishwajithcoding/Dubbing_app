# app.py

import os
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def health():
    return jsonify(status='ok', message='Dubbing backend is alive!')

# TODO: paste your /api/detect_gender and /api/dub routes here

if __name__ == '__main__':
    # This line is only for local debugging; Railway uses Gunicorn.
    app.run(host='0.0.0.0', port=int(os.getenv('PORT', 8000)))

