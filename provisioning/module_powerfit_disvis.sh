#!/usr/bin/env bash

#
# Provisioning for the PowerFit and DisVis module
#
export DEBIAN_FRONTEND=noninteractive # StackOverflow 500764

echo "[+] Provisioning: PowerFit module"

# Install dependencies for PowerFit and DisVis
echo "[++] Downloading & Installing Python 2.7.10"
apt-get install build-essential checkinstall
apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
cd /opt/software
wget -q http://python.org/ftp/python/2.7.10/Python-2.7.10.tgz
tar xzf Python-2.7.10.tgz && cd Python-2.7.10 && ./configure && make && make altinstall
rm -rf /opt/software/Python-2.7.10.tgz

echo "[++] Downloading pip for Python2.7.10"
curl -O https://bootstrap.pypa.io/get-pip.py
python2.7 /vagrant/assets/config/get-pip.py
echo "[++] Downloading PowerFit & DisVis dependencies including fftw for multiple CPU usage "
apt-get install	-y libfftw3-dev cython > /dev/null
apt-get install -y python-dev python-pip
#/usr/local/bin/#
pip2.7 install --upgrade pip
#/usr/local/bin/#
pip2.7 install --upgrade virtualenv
#/usr/local/bin/#
pip2.7 install -q numpy
#/usr/local/bin/#
pip2.7 install -q matplotlib
apt-get install -y libatlas-base-dev gfortran
#/usr/local/bin/#
pip2.7 install -q scipy
#/usr/local/bin/#
pip2.7 install -q pyfftw

# PowerFit
echo "[++] Downloading & installing PowerFit"

git clone https://github.com/haddocking/powerfit.git /opt/software/powerfit
(cd /opt/software/powerfit && python2.7 setup.py install) > /dev/null

#DisVis
echo "[++] Downloading & installing DisVis"

git clone https://github.com/haddocking/disvis.git /opt/software/disvis
(cd /opt/software/disvis && python2.7 setup.py install) > /dev/null

echo "[++] Downloading & installing PowerFit tutorial"
git clone https://github.com/haddocking/powerfit-tutorial.git /opt/powerfit-tutorial
(cd /opt/powerfit-tutorial && g++ contact-chainID.cpp -o contact-chainID) > /dev/null
ln -sf /opt/powerfit-tutorial/contact-chainID /opt/bin/
