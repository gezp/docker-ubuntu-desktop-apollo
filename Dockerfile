ARG BASE_IMAGE=gezp/ubuntu-desktop:18.04
From $BASE_IMAGE

# Install Bazel 5.3.2
RUN apt-get update &&\
    apt-get install -y unzip &&\
    wget https://github.com/bazelbuild/bazel/releases/download/5.3.2/bazel-5.3.2-installer-linux-x86_64.sh &&\
    chmod +x bazel-5.3.2-installer-linux-x86_64.sh &&\
    ./bazel-5.3.2-installer-linux-x86_64.sh &&\
    rm bazel-5.3.2-installer-linux-x86_64.sh &&\
    rm -rf /var/lib/apt/lists/*

# Install basic apollo packages
RUN curl -sSL https://apollo-pkg-beta.cdn.bcebos.com/neo/beta/key/deb.gpg.key -o /usr/share/keyrings/apollo-archive-keyring.gpg &&\
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/apollo-archive-keyring.gpg] https://apollo-pkg-beta.cdn.bcebos.com/neo/beta bionic main" | sudo tee /etc/apt/sources.list.d/apollo.list > /dev/null && \
    apt-get update && \
    apt-get install -y uuid-dev apollo-neo-cyber-dev apollo-neo-common-dev apollo-neo-common-msgs-dev apollo-neo-buildtool-dev apollo-neo-dreamview-dev apollo-neo-monitor-dev &&\
    rm -rf /var/lib/apt/lists/*

# Install pnc packages
RUN apt-get update && \
    apt-get install -y apollo-neo-planning-dev apollo-neo-routing-dev apollo-neo-control-dev &&\
    rm -rf /var/lib/apt/lists/*

# overlay scripts
COPY startup.sh /docker_config/startup.sh
