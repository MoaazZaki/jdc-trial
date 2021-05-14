#!/bin/bash
#!/bin/sh
while true  
do  
  echo "(1/5)Stopping.."
  sudo docker-compose stop
  echo "(2/5)Removing.."
  sudo docker-compose rm -f
  echo "(3/5)pulling.."
  sudo docker-compose pull
  echo "(4/5)building.."
  sudo docker-compose up -d
  sudo docker update --restart unless-stopped $(sudo docker ps -q)
  echo "(5/5)sleeping.."
  sleep 300  
done
