from sqlalchemy import create_engine, Column, Integer, String, DateTime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from datetime import datetime
import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DATABASE_URL = f"sqlite:///{os.path.join(BASE_DIR, 'blog.db')}"
engine = create_engine(DATABASE_URL, connect_args={"check_same_thread": False})
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

class Story(Base):
    __tablename__ = "stories"
    id = Column(Integer, primary_key=True, index=True)
    thumbnail = Column(String, nullable=False)
    title = Column(String, nullable=False)
    path_page = Column(String, nullable=False)
    publish_at = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

Base.metadata.create_all(bind=engine)

def get_db_session():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def get_all_stories(db):
    return db.query(Story).order_by(Story.id.desc()).all()

def create_story(db, title, path_page, thumbnail):
    db_story = Story(title=title, path_page=path_page, thumbnail=thumbnail)
    db.add(db_story)
    db.commit()
    db.refresh(db_story)
    return db_story

def update_story(db, story_id, title=None, path_page=None, thumbnail=None):
    db_story = db.query(Story).filter(Story.id == story_id).first()
    if db_story:
        if title: db_story.title = title
        if path_page: db_story.path_page = path_page
        if thumbnail: db_story.thumbnail = thumbnail
        db.commit()
        db.refresh(db_story)
    return db_story

def delete_story(db, story_id):
    db_story = db.query(Story).filter(Story.id == story_id).first()
    if db_story:
        db.delete(db_story)
        db.commit()
        return True
    return False