#!/bin/bash

java -jar /home/jenkins/swarm-client-3.3.jar -name "worker1" -executors 8 -labels docker -master "http://jenkins.local.io:8080" -fsroot /tmp 
