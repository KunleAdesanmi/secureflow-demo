from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    env_name = os.getenv('ENV_NAME', 'Development')
    return f"SecureFlow App is live! Environment: {env_name}. Security Scanned: Yes."

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)