# FROM beardedeagle/alpine-phoenix-builder:1.10.0 AS builder
# ENV appdir /opt/test_app
# WORKDIR ${appdir}
# COPY . ${appdir}
# RUN mix deps.get --only prod \
#   && MIX_ENV=prod mix compile \
#   && cd assets \
#   && npm install \
#   && node node_modules/webpack/bin/webpack.js --mode production \
#   && cd ${appdir} \
#   && MIX_ENV=prod mix phx.digest \
#   && MIX_ENV=prod mix release \
#   && V=0.1.0; pushd _build/prod/rel; tar -czvf ${appdir}/test_app-${V}.tar.gz test_app; popd;

# FROM alpine:3.11.3
# EXPOSE 4000
# ENV appver 0.1.0
# WORKDIR /opt/test_app
# COPY --from=builder /opt/test_app/test_app-${appver}.tar.gz .
# RUN apk add --no-cache bash libressl \
#   && tar -xzvf test_app-${appver}.tar.gz \
#   && rm -rf test_app-${appver}.tar.gz \
#   && rm -rf /root/.cache \
#   && rm -rf /var/cache/apk/*
# CMD ["bin/test_app", "start"]

FROM beardedeagle/alpine-phoenix-builder:1.10.0 AS builder
# FROM elixir:1.7.4-alpine
LABEL maintainer="Nick Janetakis <nick.janetakis@gmail.com>"

RUN apk update && apk add inotify-tools postgresql-dev

WORKDIR /app

COPY mix* ./
RUN mix local.hex --force && mix local.rebar --force \
    && mix deps.get && mix deps.compile

COPY . .

EXPOSE 8000
HEALTHCHECK CMD wget -q -O /dev/null http://localhost:8000/healthy || exit 1

CMD ["mix", "phx.server"]
