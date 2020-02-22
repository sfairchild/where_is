# ---- Build Stage ----
FROM erlang:21 AS app_builder

# Set environment variables for building the application
ENV TEST=1 \
    LANG=C.UTF-8

ARG SECRET_KEY_BASE
ARG PORT
ARG MIX_ENV
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG POSTGRES_DB
ARG POSTGRES_HOST
ARG ROOMS_TOKEN
ARG CLIENT_ID
ARG CLIENT_SECRET
ARG TENANT_ID
ARG AUTHORIZE_URL
ARG REDIRECT_URI

# Fetch the latest version of Elixir (once the 1.9 docker image is available you won't have to do this)
RUN set -xe \
  && ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/archive/v1.10.1.tar.gz" \
  && ELIXIR_DOWNLOAD_SHA256="823a685d62b6181be9f3314c1a86b69606dd3d3528a2053060f83802a561d8e136fb32099d51cb90542ea155a0a5768d7e6fc7aa1ae18d2c9f5fd5a5a2ac9cdc" \
  && curl -fSL -o elixir-src.tar.gz $ELIXIR_DOWNLOAD_URL \
  && echo "$ELIXIR_DOWNLOAD_SHA256  elixir-src.tar.gz" | sha512sum -c - \
  && mkdir -p /usr/local/src/elixir \
  && tar -xzC /usr/local/src/elixir --strip-components=1 -f elixir-src.tar.gz \
  && rm elixir-src.tar.gz \
  && cd /usr/local/src/elixir \
  && make install clean

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Create the application build directory
RUN mkdir /app
WORKDIR /app

# Copy over all the necessary application files and directories
COPY mix.exs .
COPY mix.lock .
RUN mix deps.get

COPY config ./config
COPY lib ./lib
COPY priv ./priv

# Fetch the application dependencies and build the application
RUN mix deps.compile
RUN mix phx.digest
RUN mix release


# ---- Application Stage ----
FROM debian:stretch AS app

ENV LANG=C.UTF-8

# Install openssl
RUN apt-get update && apt-get install -y openssl

# Copy over the startup script and build artifact from the previous step
# and create a non root user
RUN useradd --create-home app
WORKDIR /home/app
COPY --from=app_builder /app/_build .
RUN chown -R app: ./prod
USER app

# Run the Phoenix app
CMD ["./prod/rel/where_is/bin/where_is", "start"]

