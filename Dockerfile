FROM quay.io/uninuvola/base:main

# DO NOT EDIT USER VALUE
USER root

## -- ADD YOUR CODE HERE !! -- ##
RUN apt update && apt -y install cmake build-essential

## --------------------------- ##

# DO NOT EDIT USER VALUE
USER jovyan
