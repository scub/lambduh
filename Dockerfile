FROM debian:9-slim
ENV DEBIAN_FRONTEND noninteractive

# Install all the pre-reqs
RUN apt-get update \
    && apt-get -y install \
                git \
                git-buildpackage \
                haveged \
                curl \
                wget \
                vim \
                zip \
                python3 \
                python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY functions /functions

VOLUME /build
ADD ./build /build 

COPY sbin/build-packages.sh /build-packages.sh
ENTRYPOINT [ "/build-packages.sh" ]
