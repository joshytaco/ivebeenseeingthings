#!/bin/bash

# Start Rails server in the background
rails server &
RAILS_PID=$!

# Start React development server on port 8000
cd client && PORT=8000 npm start

# When React server is stopped, also stop Rails server
kill $RAILS_PID 