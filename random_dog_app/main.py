from flask import Flask
import requests
import json

app = Flask(__name__)

@app.route('/')
def home():
    res = requests.get("https://dog.ceo/api/breeds/image/random")
    breed = json.loads(res.text)["message"].split("/")[-2]
    return "Example of random dog breed : " + breed


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5000)