ARG BASE_IMAGE=gezp/ubuntu-desktop:18.04
From $BASE_IMAGE

## Install apollo
RUN curl -sSL https://apollo-pkg-beta.cdn.bcebos.com/neo/beta/key/deb.gpg.key  -o /usr/share/keyrings/apollo-archive-keyring.gpg &&\
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/apollo-archive-keyring.gpg] https://apollo-pkg-beta.cdn.bcebos.com/neo/beta bionic main" | sudo tee /etc/apt/sources.list.d/apollo.list > /dev/null && \
    apt-get update && \
    apt-get install -y apollo-neo-cyber-dev apollo-neo-common-dev apollo-neo-common-msgs-dev apollo-neo-buildtool-dev apollo-neo-dreamview-dev apollo-neo-monitor-dev &&\
    apt-get install -y apollo-neo-planning-dev apollo-neo-routing-dev apollo-neo-control-dev &&\
    rm -rf /var/lib/apt/lists/*

# overlay scripts
COPY startup.sh /docker_config/startup.sh
