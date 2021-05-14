#!/bin/bash
#!/bin/sh
while true
do
  echo "(1/5)Checking new updates"
  IS_OLD=$(./get_image_digest.sh $1 $2)
  if [ "$IS_OLD" = "false" ]; 
  then
  sudo docker-compose stop  
  echo "(2/5)Removing.."
  sudo docker-compose rm -f
  echo "(3/5)pulling.."
  sudo docker-compose pull
  fi
  echo "(4/5)building.."
  sudo docker-compose up -d
  echo "(5/5)sleeping.."
  sleep 60
done
