from flask import Flask, jsonify

app = Flask(__name__)

from models import bus_routes

@app.get('/')
def get_all_products():
    return jsonify(bus_routes)

@app.get('/<string:id>')
def get_product_by_id(id):
    response = [route for route in bus_routes if route['id'] == id]
    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True,
        port=8080)