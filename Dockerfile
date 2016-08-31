FROM debian:jessie

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential git curl libxml2 libxslt1.1 locales \
    && apt-get clean

# Install rvm
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN curl -L https://get.rvm.io | bash -s stable --ruby
# NOTE: `source` is a build-in in `bash` rather than `sh`.
RUN /bin/bash -c "source /usr/local/rvm/scripts/rvm"
# RUN . /usr/local/rvm/scripts/rvm

# Set locale
RUN locale-gen en_US.UTF-8
# RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

# Install gems
RUN cd /opt/ && git clone https://git.coding.net/GaloisPlusPlus/galoisplusplus.git \
    && cd galoisplusplus \
    && git checkout source \
    && bundle install
