#! /bin/bash

# Install dependencies (if they were not already installed during user_data)
pip install -r requirements.txt

# Apply database migrations
python3 manage.py migrate

# Start the Django development server (only for development, not recommended for production)
python3 manage.py runserver 0.0.0.0:8080
