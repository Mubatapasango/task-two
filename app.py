
import os
from flask import Flask, flash, jsonify,  render_template, redirect, url_for, request, session
from database import Database
import urllib.request, json

app = Flask(__name__)
app.secret_key = os.urandom(12)
db = Database()

@app.route('/')
def index():
    return render_template('login.html')

@app.route('/callapi', methods=['GET', 'POST', 'DELETE', 'PUT'])                                                                                                    
def get_data():
    url = "http://jsonplaceholder.typicode.com/users".format(os.environ.get("TMDB_API_KEY"))

    response = urllib.request.urlopen(url)
    data = response.read()
    dict = json.loads(data)
    if db.insertFromApi(dict):
        flash("Adding successfull")
        return redirect(url_for('dash'))
    else:
        flash("Adding was not suucessfully done")
        return redirect(url_for('dash'))

@app.route('/signout')
def logout():
    if not session.get("authenticated"):
        return redirect("/auth")

    session["authenticated"] = None
    return redirect("/auth")

@app.route('/auth', methods = ['POST', 'GET'])
def adminsignIn():
    if request.method == 'POST':
       
        if db.signin(request.form):
            session['authenticated'] = True
            return redirect(url_for('dash'))
        else:
            flash("Sign in failed. Please try again")  
            return render_template('login.html')

    else:
        return render_template('login.html')

@app.route('/dashboard')
def dash():
    if not session.get("authenticated"):
        return redirect("/auth")
    data = db.read(None)
    #return jsonify(data)
    return render_template('index.html', data = data)

@app.route('/add/')
def add():
    if not session.get("authenticated"):
        return redirect("/auth")
    return render_template('add.html')

@app.route('/adduser', methods = ['POST', 'GET'])
def adddetails():
    if not session.get("authenticated"):
        return redirect("/auth")
    if request.method == 'POST' and request.form['save']:
        if db.insert(request.form):
            flash("A new user has been added")
        else:
            flash("A new user can not be added")

        return redirect(url_for('dash'))
    else:
        return redirect(url_for('dash'))

@app.route('/update/<int:id>/')
def update(id):
    if not session.get("authenticated"):
        return redirect("/auth")
    data = db.read(id);

    if len(data) == 0:
        return redirect(url_for('dash'))
    else:
        session['update'] = id
        return render_template('update.html', data = data)

@app.route('/updateuser', methods = ['POST'])
def updateuser():
    if not session.get("authenticated"):
        return redirect("/auth")
    if request.method == 'POST' and request.form['update']:

        if db.update(session['update'], request.form):
            flash('A user record has been updated')

        else:
            flash('A user record can not be updated')

        session.pop('update', None)

        return redirect(url_for('dash'))
    else:
        return redirect(url_for('dash'))

@app.route('/delete/<int:id>/')
def delete(id):
    if not session.get("authenticated"):
        return redirect("/auth")
    data = db.read(id);

    if len(data) == 0:
        return redirect(url_for('dash'))
    else:
        session['delete'] = id
        return render_template('delete.html', data = data)

@app.route('/deleteuser', methods = ['POST'])
def deleteuser():
    if not session.get("authenticated"):
        return redirect("/auth")

    if request.method == 'POST' and request.form['delete']:

        if db.delete(session['delete']):
            flash('A user record has been deleted')

        else:
            flash('A user record can not be deleted')

        session.pop('delete', None)

        return redirect(url_for('dash'))
    else:
        return redirect(url_for('dash'))

@app.errorhandler(404)
def page_not_found(error):
    return render_template('error.html')

if __name__ == '__main__':
    app.run(debug=True)
