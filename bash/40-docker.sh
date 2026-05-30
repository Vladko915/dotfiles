#docker
if command -v docker >/dev/null 2>&1; then

   alias doa="docker ps -a"
   alias doi="docker images"

   #functions
   dor ()
   {
      docker stop "$1" && docker rm "$1" && docker rmi "$1"
   }

fi

