  
  #!/bin/bash
  echo "Hello, World!!"
  sudo apt-get update
  sudo apt-get install -y docker.io
  sudo usermod -aG docker ubuntu
  sudo systemctl restart docker
  sudo apt install maven -y
  git clone https://github.com/jaiswaladi246/jpetstore-6.git
  cd /jpetstore
  mvn package
  docker build -t petstore .
  docker run -d --p 8081:8080 sreemural/petstore
  