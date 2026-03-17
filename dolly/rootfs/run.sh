#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

# --- Read configuration from Home Assistant ---
GREETING=$(bashio::config 'greeting_message')
PORT=8080

bashio::log.info "Starting Dolly template add-on..."

# --- Create data directory ---
mkdir -p /data

# --- Generate the welcome page dynamically ---
cat > /opt/dolly/www/index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dolly - Template Add-on</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            max-width: 640px;
            margin: 60px auto;
            padding: 0 20px;
            color: #333;
            background: #f5f5f5;
        }
        h1 { color: #03a9f4; }
        .card {
            background: white;
            border-radius: 8px;
            padding: 24px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        code {
            background: #e8e8e8;
            padding: 2px 6px;
            border-radius: 3px;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Dolly</h1>
        <p>${GREETING}</p>
        <hr>
        <p>This is a <strong>template add-on</strong> for Home Assistant.
        Use it as a starting point for your own add-ons.</p>
        <p>To create a new add-on, copy the <code>dolly/</code> directory
        and customize it to your needs.</p>
    </div>
</body>
</html>
EOF

bashio::log.info "Dolly listening on port ${PORT}"

# --- Start the HTTP server ---
cd /opt/dolly/www
exec python3 -m http.server "${PORT}" --bind 0.0.0.0
