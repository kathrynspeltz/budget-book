from flask import Blueprint, render_template, request, flash

auth = Blueprint('auth', __name__)

@auth.route('/login', methods=('GET', 'POST'))
def login():
    data = request.form
    print(data)
    return render_template("login.html", text='testing')

@auth.route('/logout')
def logout():
    return "<p>logout</p>"

@auth.route('/register', methods=('GET', 'POST'))
def sign_up():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

    return render_template("register.html")