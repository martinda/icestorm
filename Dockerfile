# We need to use a python docker base because icetest needs numpy
# and this is the easiest way to install the complicated numpy dependency.
FROM python:3.6.2-alpine3.6

WORKDIR /opt/tools/icestorm

RUN apk add --no-cache \
    bash \
    build-base \
    libftdi1-dev \
    linux-headers \
    musl-dev \
    openblas-dev \
    python3-dev

# Install numpy for the icetime tests
RUN pip install --no-cache-dir --disable-pip-version-check numpy==1.13.1

# Icecube (Lattice)
# sudo apt-get install libc6-i386 zlib1g:i386 libxext6:i386 libpng12-0:i386 libsm6:i386
# sudo apt-get install libxi6:i386 libxrender1:i386 libxrandr2:i386 libxfixes3:i386
# sudo apt-get install libxcursor1:i386 libxinerama1:i386 libfreetype6:i386
# sudo apt-get install libfontconfig1:i386 libglib2.0-0:i386 libstdc++6:i386 libelf1:i386
RUN apk add --no-cache --arch x86 \
    libc6-compat
#    libstdc++

ENV LD_LIBRARY_PATH=/opt/lscc/iCEcube2.2017.01/LSE/bin/lin64
#COPY license.dat /opt/lscc/iCEcube2.2017.01

