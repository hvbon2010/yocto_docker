FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

# Install yocto requirement tools
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -yq sudo bash-completion curl libtinfo5 net-tools xterm rsync \
        u-boot-tools unzip zip gawk wget git git-lfs nano vim diffstat unzip \
        texinfo gcc build-essential chrpath socat cpio python3 python3-yaml python3-pip \
        python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 \
        python3-subunit zstd liblz4-tool file locales libacl1 whiptail qemu && \
    rm -rf /var/lib/apt-lists/* && \
    echo "dash dash/sh boolean false" | debconf-set-selections && \
    dpkg-reconfigure dash

# Install Docker bash completion script
RUN curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/bash/docker -o /etc/bash_completion.d/docker

# Enable bash completion for all users
RUN echo "source /etc/bash_completion" >> /etc/bash.bashrc

# Set the shell to bash
CMD ["bash"]

# Repo tool
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo && chmod a+x /bin/repo
RUN sed -i "1s/python/python3/" /bin/repo

# Setup user account
RUN groupadd user -g 1000
RUN useradd -ms /bin/bash -p user user -u 1000 -g 1000 && \
        usermod -aG sudo user && \
        echo "user:user" | chpasswd

# Setup locale
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen
ENV LANG en_US.utf8

# Setup user work directory
USER user
WORKDIR /home/user

# Setup git config
RUN git config --global user.email "user@example.com" && git config --global user.name "user"
