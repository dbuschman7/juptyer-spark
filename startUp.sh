#! /bin/sh 

#
# change CWD to the location of the script
# ##########################################
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${DIR}

mkdir -p notebooks

# Run the jupyter container 
docker run -it --rm \
	--name jupyter-spark \
	-p 8888:8888 \
	-e NB_UID=$(id -u) \
	-e NB_GID=$(id -g) \
	-v `pwd`/notebooks:/home/jovyan \
	jupyter/all-spark-notebook
