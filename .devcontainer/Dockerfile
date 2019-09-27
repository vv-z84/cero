FROM ubuntu:latest

# Install tools for working with the container
RUN apt update \
    && apt -y install \
    vim \
    iproute2 \
    procps \
    lsb-release \
    git \
    curl \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    autoconf bison \
    build-essential \
    libyaml-dev \
    libreadline-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm-dev \
    libsqlite3-dev

# Creates an user that uses /bin/bash as shell for installing Ruby and Rails through asdf
RUN adduser --gecos "" --shell /bin/bash --home /asdf --disabled-password asdf
ENV PATH="${PATH}:/asdf/.asdf/shims:/asdf/.asdf/bin"

USER asdf
WORKDIR /asdf

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf \
    && cd ~/.asdf \
    && git checkout "$(git describe --abbrev=0 --tags)" \
    && echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc \
    && echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc \
    && . ~/.bashrc \
    && asdf --version \
    && asdf plugin-add nodejs \
    && bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring \
    && asdf install nodejs 10.16.3 \
    && asdf global nodejs 10.16.3 \
    && node --version \
    && npm --version \
    && npm install -g yarn \
    && asdf plugin-add ruby \
    && asdf install ruby 2.6.4 \
    && asdf global ruby 2.6.4 \
    && ruby --version \
    && gem install rails