---
layout: post
title: "Tailscale SSH on Windows"
categories: infrastructure
tags: tailscale, ssh, windows, authentication, automation
---

Tailscale SSH on the server side for automation of authentication is not supported on Windows.

However, standard SSH key pairs and SSH config files work normally on Windows, providing a viable alternative for automated access to Windows machines over Tailscale.

## The Limitation

Tailscale's SSH feature that handles authentication automatically doesn't work when the target machine is Windows. The feature is available for Linux and macOS servers.

## The Workaround

Use traditional SSH setup instead:

- Generate and configure SSH key pairs
- Set up the SSH config file (`~/.ssh/config`)
- Connect through Tailscale's network using standard SSH with key-based authentication

This approach maintains secure, automated access whilst working within Windows constraints.
