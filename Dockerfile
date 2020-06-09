FROM ruby:2.5.1

RUN apt-get update && \
    apt-get install -y mysql-client nodejs vim --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# コンテナにmyprogressというディレクトリを作成
RUN mkdir /myprogress

# myprogressを起点
WORKDIR /myprogress

# Gemfileをコンテナ上にコピー
ADD Gemfile /myprogress/Gemfile
ADD Gemfile.lock /myprogress/Gemfile.lock

RUN gem install bundler
RUN bundle install

# ローカルのディレクトリ、ファイルをコンテナ上にコピー
ADD . /myprogress

RUN mkdir -p tmp/sockets