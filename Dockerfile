# Copyright 2017 clair authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM golang:1.10-alpine AS build
RUN apk add --no-cache git
ADD .   /go/src/github.com/coreos/clair/
WORKDIR /go/src/github.com/coreos/clair/
RUN export CLAIR_VERSION=v2.3.0 && \
	go build -ldflags "-X github.com/coreos/clair/pkg/version.Version=v2.3.0" github.com/coreos/clair/cmd/clair

FROM alpine:3.8
COPY --from=build /go/src/github.com/coreos/clair/clair /clair
RUN apk add --no-cache git rpm xz ca-certificates dumb-init
COPY ./clair_config.yaml /etc/config/config.yaml
CMD ["/usr/bin/dumb-init", "--", "/clair"]
EXPOSE 80 
