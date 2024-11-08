from flask import Flask, request, jsonify
import threading
import logging
import os

logs = ""
app = Flask(__name__)
chunkedData = []
user_input = {}

def accept_terminal_input():
    global logs
    while True:
        user_input = input()
        print('=' * 200)
        print("command: " + user_input)
        print('=' * 200)
        if user_input == "test":
            print(chunkedData)
        
        if user_input == "":
            print(logs)
            logs = ""
            
        if user_input == "dump":
            logs = ""
            

@app.route('/BU_Debug', methods=['GET'])
def handle_get_request():
    global logs
    data = request.args.get("data")
    error_code = request.args.get("ERROR")
    isEnd = request.args.get("end")
    response_data = jsonify("received") 



    if error_code:
        print(error_code)

    elif isEnd and len(chunkedData) > 0:
        for index, item in enumerate(chunkedData):
            logs += item
            
        chunkedData.clear()
    elif data:
        chunkedData.append(data)


    return response_data  # Send the response back


if __name__ == '__main__':
    log = logging.getLogger('werkzeug')
    log.setLevel(logging.ERROR)  # Only show errors

    input_thread = threading.Thread(target=accept_terminal_input, daemon=True)
    input_thread.start()
    app.run(port=5000)