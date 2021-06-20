# LiveBook

From 06/17/2021 class we started to use [livebook](https://github.com/elixir-nx/livebook) to all students be able to collaborative write and test `Elixir` code!

## Setting up

Remember to set `LIVEBOOK_PASSWORD` env in [Dockerfile](./Dockerfile)!!!

You nee to create an account at [fly.io](fly.io), install thier cli tool `flyctl` and then:

1. Run `flyctl auth login`
2. In this folder, run `flyctl launch`

After that you will be prompted for the new app config.

To open the new app, run `flyctl open`.
