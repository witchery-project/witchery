# witchery

Build distroless images with `apk`!

Witchery is a collection of tools which can be composed to build
distroless images.  It is intended to be portable for use with
any package management tooling, but is primarily focused on apk-based
distributions at the moment, such as Alpine.

It is also designed to be easy to use with any other third-party
tooling in a fully composable fashion, e.g. with Docker.

## Features

### Uses native package manager to assemble the image

Your application payload is converted into an `apk` package or
equivalent.  This allows for the use of the package manager to
assemble the image.

Where possible, witchery uses the pre-existing packaging tools
for a base distribution.  For example, it uses `abuild` to generate
the `apk` package with your payload.  This allows for leveraging
the automatic dependency generation features of `abuild` to
simplify the process of gathering dependencies.

### Friendly for use with Docker

Witchery is designed to be easy to use with Docker.  Some examples
are available in the `examples/` directory.

## Tools

* **witchery-buildapk** - builds an APK out of an arbitrary
  filesystem

* **witchery-compose** - composes an image, given a set of APKs,
  package names, and repositories as inputs

## Caveats

You need to have a signing key generated to sign the intermediary
artifacts.  Use `abuild-keygen -na` to get one.