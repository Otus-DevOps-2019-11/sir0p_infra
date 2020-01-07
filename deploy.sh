#!/bin/bash
username=$(whoami)
home_dir=/home/$username
cd $home_dir
git clone -b monolith https://github.com/express42/reddit.git
cd $home_dir/reddit && bundle install
puma -d
