from flask import Flask, render_template, request, redirect, url_for, jsonify, session, flash
import subprocess
import time
import json
import os

app = Flask(__name__)
app.secret_key = 'supersecretkey'  # مفتاح سري لتفعيل الجلسات

# المسارات
START_VM_SCRIPT = "/root/start_vm.sh"
STOP_VM_SCRIPT = "/root/stop_vm.sh"
STATUS_VM_SCRIPT = "/root/vm_status.sh"
PASSWORD_FILE = "/root/vm_password.txt"
UPDATE_PASSWORD_SCRIPT = "/root/update_vm_password.sh"
USERS_FILE = "/root/users.json"

# تسجيل مستخدم جديد
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        # تحميل بيانات المستخدمين
        with open(USERS_FILE, 'r') as file:
            data = json.load(file)
        
        # التحقق من عدم وجود المستخدم مسبقاً
        for user in data['users']:
            if user['username'] == username:
                flash('Username already exists!')
                return redirect(url_for('register'))
        
        # إضافة المستخدم الجديد
        data['users'].append({"username": username, "password": password})
        with open(USERS_FILE, 'w') as file:
            json.dump(data, file)
        
        flash('Registration successful! Please log in.')
        return redirect(url_for('login'))
    
    return render_template('register.html')

# تسجيل الدخول
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        # تحميل بيانات المستخدمين
        with open(USERS_FILE, 'r') as file:
            data = json.load(file)
        
        # التحقق من صحة بيانات المستخدم
        for user in data['users']:
            if user['username'] == username and user['password'] == password:
                session['username'] = username
                return redirect(url_for('index'))
        
        flash('Invalid credentials. Please try again.')
    
    return render_template('login.html')

# تسجيل الخروج
@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('login'))

# لوحة التحكم
@app.route('/')
def index():
    if 'username' not in session:
        return redirect(url_for('login'))
    return render_template("dashboard.html")

# بدء تشغيل VM
@app.route("/start_vm", methods=["POST"])
def start_vm():
    subprocess.run(["bash", START_VM_SCRIPT], check=True)
    time.sleep(1)
    update_password()
    return redirect(url_for("index"))

# إيقاف تشغيل VM
@app.route("/stop_vm", methods=["POST"])
def stop_vm():
    subprocess.run(["bash", STOP_VM_SCRIPT], check=True)
    time.sleep(1)
    return redirect(url_for("index"))

# حالة VM
@app.route("/vm_status")
def vm_status():
    result = subprocess.run(["bash", STATUS_VM_SCRIPT], capture_output=True, text=True)
    status = result.stdout.strip()
    return jsonify({"status": status})

# كلمة المرور
@app.route("/password")
def get_password():
    try:
        with open(PASSWORD_FILE, "r") as f:
            password = f.read().strip()
        return jsonify({"password": password})
    except Exception as e:
        return jsonify({"error": "Password not available"}), 500

def update_password():
    subprocess.run(["bash", UPDATE_PASSWORD_SCRIPT], check=True)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
