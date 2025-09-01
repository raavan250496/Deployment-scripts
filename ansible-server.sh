#!/bin/bash

sudo apt update -y  && sudo apt upgrade -y  && sudo apt-get install -y software-properties-common  && sudo apt-add-repository ppa:ansible/ansible  && sudo apt-get update -y  && sudo apt-get install -y ansible
