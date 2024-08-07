#!/bin/bash

echo "Upgrading Chasm Scout to v0.0.5..."

# Stop the running Scout container
echo "Stopping the current Scout container..."
docker stop scout

# Remove the old Scout container
echo "Removing the old Scout container..."
docker rm scout

# Remove dangling images
echo "Removing dangling images..."
docker image prune -f

# Fetch the latest version of the Scout image
echo "Pulling the latest Scout image..."
docker pull chasmtech/chasm-scout:latest

# Start the Scout container with the updated image
echo "Starting the new Scout container..."
docker run -d --restart=always --env-file ./.env -p 3001:3001 --name scout chasmtech/chasm-scout

# View the container logs
echo "Checking the Scout container logs..."
docker logs scout

# Test the server response
echo "Testing the server response..."
curl localhost:3001

echo "Upgrade complete. Visit https://scout.chasm.net/dashboard to verify the version."

# Add the final message
echo "Your Scout has been Successfully Upgraded to v0.0.5 you can close the terminal. Follow x.com/Arun__993 for more."
