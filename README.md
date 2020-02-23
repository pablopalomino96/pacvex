# Pacvex 

## What is Pacvex?

Pacvex is a CMS for my personal portfolio website. It's made in [Elixir](http://elixir-lang.org) and built with [Phoenix](http://www.phoenixframework.org).

## Run it locally and development

- Clone this repo from Github
- Install `.tools-versions` dependencies via `asdf`:
```sh
asdf install
```
- Get dependecies:
```sh
mix deps.get
```
- Create and migrate the database:
```sh
mix ecto.create ; mix ecto.migrate
```
- Install node.js dependencies:
```sh
cd assets && npm install
```
- Start Phoenix server:
```sh
mix phx.server
```

You need to create an admin user with your data (Cookbook coming soon...)

----
Pacvex - Minimal cv website made in Elixir / Phoenix.
© Pablo Palomino Gómez, 2019
