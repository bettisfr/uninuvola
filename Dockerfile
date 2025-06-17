FROM quay.io/uninuvola/base:main

# DO NOT EDIT USER VALUE
USER root

## -- ADD YOUR CODE HERE !! -- ##
RUN apt update && apt -y install cmake build-essential

# Copy Gurobi installation into the image
COPY gurobi1200 /opt/gurobi1200

# Copy Gurobi license folder
COPY .gurobi /home/jovyan/.gurobi

# Fix permissions so jovyan owns the license and Gurobi files
RUN chown -R jovyan:jovyan /opt/gurobi1200 && \
    chown -R jovyan:jovyan /home/jovyan/.gurobi

# Set environment variables for Gurobi
ENV GRB_LICENSE_FILE=/home/jovyan/.gurobi.lic \
    GUROBI_HOME=/opt/gurobi1200/linux64 \
    PATH=$PATH:/opt/gurobi1200/linux64/bin \
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/gurobi1200/linux64/lib

## --------------------------- ##

# DO NOT EDIT USER VALUE
USER jovyan
