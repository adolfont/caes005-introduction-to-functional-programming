FROM hexpm/elixir:1.12.0-erlang-24.0-alpine-3.13.3

# we need to git if anyone try to install a git Mix dep
RUN apk add --no-cache build-base openssl ncurses-libs

RUN adduser caes005-introduction-to-functional-programming intro_functional -D

USER caes005-introduction-to-functional-programming 

WORKDIR /home/caes005-introduction-to-functional-programming

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# install livebook itself
RUN yes | mix escript.install hex livebook

COPY ./notebooks /home/caes005-introduction-to-functional-programming/notebooks

# Override the default 127.0.0.1 address, so that the app
# can be accessed outside the container by binding ports
ENV LIVEBOOK_IP 0.0.0.0
ENV LIVEBOOK_PASSWORD xxxxxxxxxxxxxxx

CMD [ "./.mix/escripts/livebook", "server" ]
