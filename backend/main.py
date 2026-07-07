from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from sqlalchemy.orm import Session

import os
from backend import database

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
app.mount("/frontend", StaticFiles(directory=os.path.join(BASE_DIR, "..", "frontend")), name="frontend")

def get_db():
    db = next(database.get_db_session())
    try:
        yield db
    finally:
        db.close()

@app.get("/")
def read_root():
    return FileResponse("frontend/index.html")

@app.get("/api/stories")
def get_stories(db: Session = Depends(get_db)):
    return database.get_all_stories(db)

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)