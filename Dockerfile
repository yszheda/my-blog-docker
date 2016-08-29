FROM debian:jessie

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential git curl libxml2 libxslt locales
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN curl -L https://get.rvm.io | bash -s stable --ruby
# NOTE: `source` is a build-in in `bash` rather than `sh`.
# RUN . /usr/local/rvm/scripts/rvm
RUN /bin/bash -c "source /usr/local/rvm/scripts/rvm"
RUN rvm install 1.9.3
RUN rvm use 1.9.3
RUN rvm rubygems latest
RUN gem install bundle
# RUN cd /opt/ && bundle install
# RUN locale-gen en_US.UTF-8
