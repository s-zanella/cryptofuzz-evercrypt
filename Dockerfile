# Copyright 2019 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

FROM gcr.io/oss-fuzz-base/base-builder
MAINTAINER guidovranken@gmail.com

RUN apt-get update && apt-get install -y software-properties-common python-software-properties make autoconf automake libtool build-essential cmake libboost-all-dev curl vim

# BoringSSL needs Go to build
RUN add-apt-repository -y ppa:gophers/archive && apt-get update && apt-get install -y golang-1.9-go
RUN ln -s /usr/lib/go-1.9/bin/go /usr/bin/go

RUN git clone --depth 1 https://github.com/s-zanella/cryptofuzz
RUN git clone --depth 1 https://github.com/guidovranken/cryptofuzz-corpora
RUN git clone --depth 1 https://github.com/openssl/openssl
RUN git clone --depth 1 https://boringssl.googlesource.com/boringssl
RUN git clone --depth 1 https://github.com/jedisct1/libsodium

RUN curl -SL https://github.com/project-everest/hacl-star/archive/evercrypt-v0.1alpha1.tar.gz \
    | tar -zx \
    && mv hacl-star-evercrypt-v0.1alpha1 evercrypt

COPY build.sh $SRC/
COPY env.sh $SRC/
COPY fuzz.sh $SRC/
