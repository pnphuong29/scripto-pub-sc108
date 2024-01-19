Artisan Bash Completion
=======================

Original projects:
* https://github.com/janka/artisanBashCompletion
* https://github.com/argakiig/artisanBashCompletion

This adds bash completion for Laravel 9–10 artisan CLI, both for commands and options.

For Laravel versions 5.5+ to Laravel 8, you can install version `^1.0`.

## Examples

```
artisan db:<tab>
monitor  seed     show     table    wipe

artisan db:se<tab>  →  artisan db:seed

artisan db:seed --<tab>
--ansi            --env             --no-ansi         --verbose
--class           --force           --no-interaction  --version
--database        --help            --quiet

artisan db:seed --dat<tab>  →  artisan db:seed --database
```

## Install

```
composer require --dev balping/artisan-bash-completion
```


This package works with package auto-discovery, so you don't need to register a service provider.

Create an alias for the php artisan command with the likes of `echo 'alias artisan="php artisan"' >> ~/.bash_aliases`

Put the file `artisan` (found in the root of this repo) to `/etc/bash_completion.d/` and remember to source it with `. /etc/bash_completion.d/artisan` (or source every completion script with `. /etc/bash_completion`). You might also need to source your aliases file: `. ~/.bash_aliases`

Now use `artisan ` and start tabbing away...

## Upgrade from v1

Replace `/etc/bash_completion.d/artisan` with the current version of this file, found in the root of this repo.

## Lincense

Licensed under GPL v3.
