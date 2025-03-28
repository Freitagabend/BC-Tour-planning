# FastAPI main entry
from fastapi import FastAPI
from routing import optimize_route

app = FastAPI()

@app.get('/')
def root():
    return {"message": "Tourplanung Backend läuft"}