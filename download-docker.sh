#!/bin/bash
# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi
# Check switch download file
downlaod=false
if [ "$1" == "-d" ]; then
  download=true
fi
. /etc/lsb-release
ARCHITECTURE=$(dpkg --print-architecture)

echo -e "Your operating system, $DISTRIB_ID is the $DISTRIB_CODENAME point of the $ARCHITECTURE architecture"

DISTRIB_ID="${DISTRIB_ID,,}"

CURRENT_DIR=$(pwd)

# URL of the HTML page with the list of Docker files
HTML_URL="https://download.docker.com/linux/${DISTRIB_ID}/dists/${DISTRIB_CODENAME}/pool/stable/${ARCHITECTURE}/"

# Fetch the list of available packages
PACKAGE_LIST=$(curl -s "$HTML_URL" | grep -oP '(?<=href=")[^"]+(?=")' | grep -oP '.*\.deb' | sort -Vr)

# Download the latest package for each type
TYPES=("containerd.io" "docker-ce" "docker-ce-cli" "docker-buildx-plugin" "docker-compose-plugin")
echo -e "Docker download links for your operating system\n"

for TYPE in "${TYPES[@]}"; do
  PACKAGE=$(echo "$PACKAGE_LIST" | grep "$TYPE" | head -n 1)

  if [ -n "$PACKAGE" ]; then
    
    URL="${HTML_URL}${PACKAGE}"
    echo -e "$URL\n"

    if [ "$download" ]; then
      curl -L --progress-bar "$URL" -o "$CURRENT_DIR/$PACKAGE"
    fi    

  fi
done
echo "done successfully!"
