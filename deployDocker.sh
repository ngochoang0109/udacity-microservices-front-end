docker build -t udagram-frontend .
docker tag udagram-frontend ngochoang010900/udagram-frontend
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push ngochoang010900/udagram-frontend
