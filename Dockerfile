FROM ruby:2.1
MAINTAINER Richard Attermeyer <richard.attermeyer@gmail.com>

RUN apt-get update \
  && apt-get install -y \
    node \
    python-pygments \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

RUN gem install \
  github-pages \
  jekyll \
  jekyll-redirect-from \
  kramdown \
  rdiscount \
  rouge

RUN groupadd -g 1001 richard && \
  useradd -u 1001 richard -g 1001

VOLUME /src
EXPOSE 4000

USER richard
WORKDIR /src
ENTRYPOINT ["jekyll"]
