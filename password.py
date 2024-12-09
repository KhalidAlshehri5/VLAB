from flask import Flask, jsonify
import subprocess

app = Flask(__name__)

@app.route('/password', methods=['GET'])
def get_password():
    try:
        # Run the update password script
        subprocess.run(['/root/update_vm_password.sh'], check=True)

        # Read the updated password
        with open('/root/vm_password.txt', 'r') as file:
            password = file.read().strip()
            return jsonify({"password": password})
    except Exception as e:
        return jsonify({"error": "Password not available"}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
