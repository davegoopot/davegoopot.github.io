---
layout: post
title: "Termux API Install Needs to Be from F-Droid"
categories: mobile
tags: android, termux, termux-api, f-droid, troubleshooting
---

Quick fix for a key signing error when using Termux API.

## The Problem

Installed Termux from F-Droid, then installed Termux:API via command line:

```bash
pkg install termux-api
```

When attempting to use the API (e.g., `termux-storage-get`), encountered a key signing error preventing the API from functioning.

## The Solution

Install Termux:API from F-Droid, not via `pkg install`.

Both Termux and Termux:API must come from the same source (F-Droid) to have matching signatures.

## The Steps

1. Open F-Droid
2. Search for "Termux:API"
3. Install the Termux:API app
4. The command-line tools will now work correctly

## References

[F-Droid Termux page](https://f-droid.org/en/packages/com.termux/)  
[F-Droid Termux:API page](https://f-droid.org/en/packages/com.termux.api/)
