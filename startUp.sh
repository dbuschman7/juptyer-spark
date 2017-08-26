#! /bin/sh 

#
# change CWD to the location of the script
# ##########################################
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${DIR}

mkdir -p notebooks

# Run the jupyter container 
docker run -it --rm \
	-p 8888:8888 \
	-v `pwd`/notebooks:/home/jovyan/work \
	--name jupyter-spark \
	jupyter/all-spark-notebook
