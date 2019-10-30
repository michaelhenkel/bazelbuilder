FROM insready/bazel
RUN apt-get update && apt-get install apt-transport-https -y && apt-get install ca-certificates -y \
    && apt-get install curl -y && apt-get install gnupg2 -y \
    && apt-get install software-properties-common -y && apt-get install iptables -y && apt-get install bazel -y
RUN curl -OL https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/docker-ce_19.03.3~3-0~debian-stretch_amd64.deb
RUN curl -OL https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/docker-ce-cli_19.03.3~3-0~debian-stretch_amd64.deb
RUN curl -OL https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/containerd.io_1.2.6-3_amd64.deb
RUN dpkg -i docker-ce_19.03.3~3-0~debian-stretch_amd64.deb docker-ce-cli_19.03.3~3-0~debian-stretch_amd64.deb containerd.io_1.2.6-3_amd64.deb

RUN mkdir -p /usr/src/app
ENV WORKSPACE /usr/src/app
WORKDIR /usr/src/app

## docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD":/usr/src/app -e BUILD_NUMBER=11 docker.jfrog.io/jfrog/bazel-docker-builder:0.19.0 bash -c "bazel build all && bazel test --test_output=errors --curses=no //..."
