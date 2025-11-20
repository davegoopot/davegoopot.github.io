---
layout: post
title: "Termux UV PyPI Configuration"
categories: mobile
tags: termux, python, uv, pypi, android, package-management
---

I wish I'd found the Termux-specific PyPI index sooner. This PyPI has wheels pre-compiled to run under Termux.

Here's how to set it up as the default under Termux.

## The Configuration File Location

In Termux, uv looks for the configuration file at:

```
~/.config/uv/uv.toml
```

Full absolute path in Termux:

```
/data/data/com.termux/files/home/.config/uv/uv.toml
```

## Creating The Configuration

uv doesn't create this file automatically. Create the directory and file:

```bash
mkdir -p ~/.config/uv && touch ~/.config/uv/uv.toml
```

## Adding The Termux Index

Edit the configuration file:

```bash
nano ~/.config/uv/uv.toml
```

Add the Termux user repository:

```toml
[[index]]
name = "termux"
url = "https://termux-user-repository.github.io/pypi/"
```

## Verification

Test with:

```bash
uv pip list
```

Or:

```bash
uvx <package-name>
```

The verbose output will show if uv picks up the configuration.
