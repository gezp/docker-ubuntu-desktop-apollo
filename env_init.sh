#!/bin/sh
# for apollo
mkdir -p /opt/apollo/neo/data/log
chmod -R 777 /opt/apollo/neo/data
echo "source /opt/apollo/neo/setup.sh" >> /home/$USER/.bashrc
