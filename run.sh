python3 -m http.server 8000 --bind 127.0.0.1 & sleep 2 && xdg-open http://localhost:8000 || (curl -s "http://localhost:8000" > /dev/null)
