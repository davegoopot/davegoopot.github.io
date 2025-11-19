---
layout: post
title: "Pydantic In Termux? Install Rust And Some Patience"
categories: mobile
tags: termux, python, pydantic, rust, android, build-from-source
---

Installing Pydantic in Termux requires building from source. The solution: install Rust and wait.

## The Problem

Attempting to `pip install pydantic` in Termux fails because pydantic-core needs to be built from source. No precompiled wheel is available for the Termux environment.


## The Solution

Install Rust, `pkg install rust` then let pip build pydantic-core from source.

The build takes approximately 10 minutes. Let it run in the Termux window without interruption.

## A Better Solution

Use [uv with the Termux PyPI repository](/mobile/2025/11/19/termux-uv-pypi-configuration.html) which provides precompiled wheels. This avoids the need to build from source and is significantly faster.

