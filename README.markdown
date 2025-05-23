# Nitrogen Web Framework for Erlang

Nitrogen is an Erlang-based web framework that allows you to develop
infinitely scaleable, Ajax-rich web applications using a pure Erlang 
technology stack.

See the [Nitrogen Project website](http://nitrogenproject.com) for
additional information.

## Upgrading from Nitrogen 2 to Nitrogen 3?

If you are using a Nitrogen 2 structured project, run the following two commands
from the root of your Nitrogen 2-based project.

**WARNING: Make sure you commit to version control before running this - it
will change your working directory heavily**

**WARNING 2: Running scripts directly from the internet is dumb. Review
[this script's code](https://raw.githubusercontent.com/nitrogen/nitrogen/master/scripts/upgrade_to_nitrogen3.sh)
before you run it. But if you really want to do it this way, here you go.**

```bash
curl -o https://raw.githubusercontent.com/nitrogen/nitrogen/master/scripts/upgrade_to_nitrogen3.sh
bash upgrade_to_nitrogen3.sh
```

The first line downloads the upgrade script to your local project directory

The second line runs that script


## Getting Started

Follow the tutorial at
[http://nitrogenproject.com/doc/tutorial.html](http://nitrogenproject.com/doc/tutorial.html)

## Building Nitrogen on Linux and OSX

The [Getting Started](http://nitrogenproject.com/doc/index.html#sec-3) guide covers this.

## Building Nitrogen on FreeBSD

Install Erlang

Make sure you have `gmake` installed, and use `gmake` instead of `make`

Example:

```
$ gmake rel_cowboy
```

## Building Nitrogen on Windows

Instructions for building on windows can be found in [rel/overlay/win](https://github.com/nitrogen/nitrogen/blob/master/rel/overlay/win/README.md)

## Want to contribute?

[nitrogen_core](https://github.com/nitrogen/nitrogen_core) is where you would
find the vast majority of Nitrogen's codebase, should you wish to contribute or
make changes.

Read our [contribution
guidelines](https://github.com/nitrogen/nitrogen/blob/master/CONTRIB.markdown)
to get started contributing to Nitrogen!  (they're not strict, just
recommendations)
