docker run -d --name testcopy ubuntu:22.04 sleep 360

docker cp run_inside.sh testcopy:/root/run_inside.sh
docker exec -it testcopy /bin/bash /root/run_inside.sh

docker cp testcopy:/root/inside.txt .
cat inside.txt
