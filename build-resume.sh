#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Detect Chrome binary on macOS or Linux
if [[ "$OSTYPE" == "darwin"* ]]; then
  CHROME_BIN="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
else
  CHROME_BIN=$(which google-chrome || which chromium || which chromium-browser)
fi

if [[ ! -x "$CHROME_BIN" ]]; then
  echo "Error: Google Chrome or Chromium not found at $CHROME_BIN"
  exit 1
fi

echo "Compiling ATS resume PDF from resume.html..."
"$CHROME_BIN" --headless --disable-gpu --no-sandbox --no-pdf-header-footer \
  --print-to-pdf="$DIR/Shubham_Sharma_Resume.pdf" \
  "file://$DIR/resume.html"

cp "$DIR/Shubham_Sharma_Resume.pdf" "$DIR/resume.pdf"
echo "Done! Generated Shubham_Sharma_Resume.pdf and resume.pdf"
