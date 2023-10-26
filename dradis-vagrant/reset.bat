@echo off
vagrant halt
vagrant box remove ubuntu/focal64
rm -r .vagrant