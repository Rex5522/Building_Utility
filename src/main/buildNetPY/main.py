from flask import Flask, request, jsonify
import threading
import logging
import os

logs = ""
app = Flask(__name__)

user_input = {}

def accept_terminal_input():
    global logs
    while True:
        user_input = input()
        
        if user_input == "":
            os.system('cls')
            print(logs)
            logs = ""
            
        if user_input == "dump":
            logs = ""
            

@app.route('/BU_Debug', methods=['GET'])
def handle_get_request():
    global logs
    message = request.args.get("message")
    
    logs += "\n" + message

    response_data = "received"
    return jsonify(response_data)  # Send the response back



if __name__ == '__main__':
    log = logging.getLogger('werkzeug')
    log.setLevel(logging.ERROR)  # Only show errors

    input_thread = threading.Thread(target=accept_terminal_input, daemon=True)
    input_thread.start()
    app.run(port=5000)