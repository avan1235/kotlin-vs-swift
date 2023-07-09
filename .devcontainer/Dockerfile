FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

RUN sudo apt update  \
    && sudo apt install -y \
           binutils \
           git \
           gnupg2 \
           java-common \
           libc6-dev \
           libcurl4-openssl-dev \
           libedit2 \
           libgcc-11-dev \
           libncurses6 \
           libpython3.11 \
           libsqlite3-0 \
           libstdc++-11-dev \
           libxml2-dev \
           libz3-dev \
           pkg-config \
           tzdata \
           unzip \
           wget \
           zlib1g-dev \
    && sudo apt autoremove -y \
    && sudo rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
    wget https://download.swift.org/swift-5.8.1-release/ubuntu2204/swift-5.8.1-RELEASE/swift-5.8.1-RELEASE-ubuntu22.04.tar.gz

RUN cd /tmp && tar -xzf swift-5.8.1-RELEASE-ubuntu22.04.tar.gz && sudo mv swift-5.8.1-RELEASE-ubuntu22.04 /opt/swift

RUN echo "if [ -f /home/$USERNAME/.bashrc ]; then source /home/$USERNAME/.bashrc; fi" >> /home/$USERNAME/.bash_profile
RUN echo "export PATH=$PATH:/opt/swift/usr/bin" >> /home/$USERNAME/.bashrc
ENV PATH="$PATH:/opt/swift/usr/bin"

RUN cd /tmp && \
    git clone https://github.com/apple/swift-format.git && \
    cd swift-format && \
    git checkout "tags/508.0.1" && \
    swift build -c release && \
    sudo mv .build/release/swift-format /bin/ && \
    cd .. && \
    rm -rf swift-format

RUN cd /tmp && \
    wget https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.deb && \
    sudo dpkg --install amazon-corretto-17-x64-linux-jdk.deb && \
    rm amazon-corretto-17-x64-linux-jdk.deb

ENTRYPOINT [ "/usr/bin/bash" ]