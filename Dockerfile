FROM ubuntu:14.04
LABEL maintainer "Dave Larson <delarson@wustl.edu>"

# Build dependencies
RUN apt-get update -qq \
    && apt-get -y install \
        --no-install-recommends \
        apt-transport-https \
        ca-certificates \
    && echo "deb [trusted=yes] https://basespace.bintray.com/BaseSpaceCLI-DEB trusty main" | tee -a /etc/apt/sources.list.d/basespace-cli.list \
    && apt-get update -qq \
    && apt-get -y install \
        --no-install-recommends \
        basespace-cli \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
