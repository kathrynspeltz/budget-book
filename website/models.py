from website import db
from flask_login import UserMixin
from sqlalchemy.sql import func

# class Budget(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     monthly_budget = db.Column(db.Integer)
#     user_id = db.Column(db.Integer, db.ForeignKey('user.id'))

class Expense(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(150), nullable=False)
    spent = db.Column(db.Integer, nullable=False)
    date = db.Column(db.DateTime(timezone=True), default=func.now())
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))

# class Tag(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#      name = db.Column(db.String(128), nullable=False)

# expense_tag_table = db.Table(
#     'expense_tag',
#     db.columnI
# )


class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(128), unique=True, nullable=False)
    password = db.Column(db.String(128), nullable=False)
    first_name = db.Column(db.String(128))
    expenses =db.relationship('Expense')
    # user_goal = db.relationship('UserGoal')