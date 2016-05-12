# modified from https://github.com/trevorstephens/gplearn

# This script is meant to be called by the "install" step defined in
# .travis.yml. See http://docs.travis-ci.com/ for more details.
# The behavior of the script is controlled by environment variabled defined
# in the .travis.yml in the top level folder of the project.

# License: GNU/GPLv3

set -e

python --version
python -c "import numpy; print('numpy %s' % numpy.__version__)"
python -c "import scipy; print('scipy %s' % scipy.__version__)"
python -c "import pandas; print('pandas %s' % pandas.__version__)"
python -c "import matplotlib; print('matplotlib %s' % matplotlib.__version__)"
python -c "import numba; print('numba %s ' % numba.__version__)"
python -c "import ipython; print('ipython %s ' % ipython.__version__)"
python -c "import seaborn; print('seaborn %s ' % seaborn.__version__)"
python -c "import notebook; print('notebook %s ' % notebook.__version__)"

if [[ "$COVERAGE" == "true" ]]; then
    nosetests -s -v --with-coverage
else
    nosetests -s -v
fi
#make test-doc test-sphinxext
