from flask import Flask, jsonify, request, send_from_directory
from flask_cors import CORS
import sqlite3
import os
import logging

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})

logging.basicConfig(level=logging.INFO)

DB_PATH = os.path.join('bd', 'video_videos_new.db')

def get_db_connection():
    try:
        if not os.path.exists(DB_PATH):
            raise FileNotFoundError(f"Database file not found: {DB_PATH}")
        logging.info(f"Database file found at {DB_PATH}")

        with open(DB_PATH, 'rb') as f:
            header = f.read(100)
            if not header.startswith(b'SQLite format 3'):
                raise ValueError(f"File at {DB_PATH} is not a SQLite database")

        conn = sqlite3.connect(DB_PATH)
        conn.row_factory = sqlite3.Row
        return conn
    except Exception as e:
        logging.error(f"Error connecting to the database: {e}")
        raise

@app.route('/')
def index():
    return send_from_directory('.', 'index.html')

@app.route('/layout.html')
def layout():
    return send_from_directory('.', 'layout.html')

@app.route('/get_videos', methods=['GET'])
def get_videos():
    try:
        page = request.args.get('page', default=1, type=int)
        per_page = 10
        offset = (page - 1) * per_page

        conn = get_db_connection()
        videos = conn.execute('SELECT video_id, url, artiste_id, anime_id FROM videos LIMIT ? OFFSET ?', (per_page, offset)).fetchall()
        conn.close()

        videos_list = []
        for video in videos:
            logging.info(f"Video keys: {video.keys()}")
            videos_list.append({
                'video_id': video['video_id'],
                'url': video['url'],
                'artiste_id': video['artiste_id'],
                'anime_id': video['anime_id']
            })

        return jsonify(videos_list)
    except Exception as e:
        logging.error(f"Error fetching videos: {e}")
        return jsonify({"error": str(e)}), 500

@app.route('/test_videos', methods=['GET'])
def test_videos():
    try:
        conn = get_db_connection()
        videos = conn.execute('SELECT video_id, url, artiste_id, anime_id FROM videos LIMIT 10').fetchall()
        conn.close()

        videos_list = []
        for video in videos:
            logging.info(f"Video keys: {video.keys()}")
            videos_list.append({
                'video_id': video['video_id'],
                'url': video['url'],
                'artiste_id': video['artiste_id'],
                'anime_id': video['anime_id']
            })

        return jsonify(videos_list)
    except Exception as e:
        logging.error(f"Error fetching videos: {e}")
        return jsonify({"error": str(e)}), 500

@app.route('/test_db')
def test_db():
    try:
        if os.path.exists(DB_PATH):
            return "Database file found!", 200
        else:
            return "Database file not found!", 404
    except Exception as e:
        logging.error(f"Error accessing the database file: {e}")
        return jsonify({"error": str(e)}), 500

@app.route('/<path:path>')
def static_files(path):
    return send_from_directory('.', path)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)