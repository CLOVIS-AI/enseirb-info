FROM tianon/latex
MAINTAINER Ivan Canet <ivancanet+foss@gmail.com>

RUN apt update -q \
 && apt install -y --no-install-recommends git pandoc

RUN apt install -y --no-install-recommends ssh
