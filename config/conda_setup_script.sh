# -------------
# Author: Karen Ng <mailto:karen.y.ng@intel.com>
# dependency: wget
# usage:
# source THIS_SCRIPT.sh
# -------------
# set per project settings
export CONDA_ENV=sc2
export INTEL_PYTHON_VERSION=2018.0.0
export PY_VERSION=35
export PY_DOT_VERSION=3.5 
export PY_MAJOR_VERSION=3
export EDITION=full

export DIR=$HOME/miniconda${PY_MAJOR_VERSION}
export ENV_DIR=$HOME/miniconda${PY_MAJOR_VERSION}
echo "ENV_DIR=$ENV_DIR"

BASH_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
if [[ ! -f ${BASH_DIR}/setup_conda.sh ]]; then
  wget -O ${BASH_DIR}/setup_conda.sh https://gist.githubusercontent.com/karenyyng/d854662dadd2f1fa027bc87abf0a045c/raw/setup_conda.sh
fi
if [[ ! -f ${BASH_DIR}/load_conda.sh ]]; then
  wget -O ${BASH_DIR}/load_conda.sh https://gist.githubusercontent.com/karenyyng/692025f1cc8ec753cd44a6cc9f78db6a/raw/load_conda.sh
fi  
source ${BASH_DIR}/setup_conda.sh
source ${BASH_DIR}/load_conda.sh

# create scripts for you to reload the conda environment easily
if [[ ! -f ${BASH_DIR}/load_py${PY_MAJOR_VERSION}_${INTEL_PYTHON_VERSION}.sh ]]; then
  echo "Creating file for reloading the environment called ${BASH_DIR}/load_py${PY_MAJOR_VERSION}_${INTEL_PYTHON_VERSION}.sh"
  echo "export CONDA_ENV=$CONDA_ENV" > ${BASH_DIR}/load_py${PY_MAJOR_VERSION}_${INTEL_PYTHON_VERSION}.sh
  echo "export ENV_DIR=$ENV_DIR" >> ${BASH_DIR}/load_py${PY_MAJOR_VERSION}_${INTEL_PYTHON_VERSION}.sh
  echo "export INTEL_PYTHON_VERSION=$INTEL_PYTHON_VERSION" >> ${BASH_DIR}/load_py${PY_MAJOR_VERSION}_${INTEL_PYTHON_VERSION}.sh
  echo "export PY_VERSION=$PY_VERSION" >> ${BASH_DIR}/load_py${PY_MAJOR_VERSION}_${INTEL_PYTHON_VERSION}.sh
  echo "export PY_DOT_VERSION=$PY_DOT_VERSION" >> ${BASH_DIR}/load_py${PY_MAJOR_VERSION}_${INTEL_PYTHON_VERSION}.sh
  echo "export PY_MAJOR_VERSION=$PY_MAJOR_VERSION" >> ${BASH_DIR}/load_py${PY_MAJOR_VERSION}_${INTEL_PYTHON_VERSION}.sh
  cat ${BASH_DIR}/load_conda.sh >> ${BASH_DIR}/load_py${PY_MAJOR_VERSION}_${INTEL_PYTHON_VERSION}.sh
fi 

# install extra dependencies
echo "Using conda at $CONDA"
$CONDA install -y -c intel \
scikit-learn=0.18.2 \
jupyter=1.0.0 \
matplotlib=2.0.2 \
h5py=2.7.0 \
pysocks=1.6.6 \
dask=0.15.2 \
psutil=5.2.2 
graphviz=2.38.0 \
# python-graphviz=0.5.2=py35_0 \
paramiko=2.1.2 \
distributed=1.18.1 \
pytables=3.3.0 \
numba=0.34.0
$CONDA install -y memory_profiler line_profiler bokeh
$CONDA install -y -c anaconda readline

pip install --no-deps py==1.4.33 \
  gnureadline==6.3.3 \
  pygal==2.0.13 \
  pygaljs==1.0.1 \
  pysc2

if [ -f Miniconda3-latest-${OS}-x86_64.sh ]; then 
  rm -f ./Miniconda3-latest-${OS}-x86_64.sh
fi
if [ -f ${BASH_DIR}/load_conda.sh ]; then
  rm -f ${BASH_DIR}/load_conda.sh
fi
if [ -f ${BASH_DIR}/setup_conda.sh ]; then
  rm -f ${BASH_DIR}/setup_conda.sh
fi
