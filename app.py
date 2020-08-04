import requests
from flask import Flask, render_template

app = Flask(__name__)

app.config['DEBUG'] = True

@app.route('/')
def index():
  headers = { 'Accept': 'application/json' }
  data = requests.get('https://icanhazdadjoke.com/', headers=headers)
  data = data.json()
  joke = data['joke']
  return render_template('index.html', joke=joke)

if __name__ == '__main__':
  app.run(host='0.0.0.0', port=6969)