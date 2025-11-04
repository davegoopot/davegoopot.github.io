---
layout: post
title: "Pydantic In Termux? Install Rust And Some Patience"
categories: mobile
tags: termux, python, pydantic, rust, android, build-from-source
---

Installing Pydantic in Termux requires building from source. The solution: install Rust and wait.

## The Problem

Attempting to `pip install pydantic` in Termux fails because pydantic-core needs to be built from source. No precompiled wheel is available for the Termux environment.

```bash
pip install pydantic
# Fails: pydantic-core build error
```

## The Solution

Install Rust, then let pip build pydantic-core from source:

```bash
pkg install rust
pip install pydantic
```

The build takes approximately 10 minutes. Let it run in the Termux window without interruption.

## Why This Works

Pydantic-core is written in Rust and requires compilation for ARM Android environments. Termux doesn't have prebuilt wheels, so the Rust toolchain compiles it locally.

## References

[Pydantic documentation](https://docs.pydantic.dev/)  
[Termux wiki](https://wiki.termux.com/)
