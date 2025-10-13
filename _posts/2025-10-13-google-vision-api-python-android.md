---
layout: post
title: "Accessing Google Vision API from Python on Android"
categories: mobile
tags: google-api, python, android, termux, vision-api
---

Here's a summary of what I needed to do to access the Google Vision API from Python using Termux on Android.

1. **Get API key on laptop** - Generate service account key JSON file using Google Cloud Console on a desktop/laptop
2. **Transfer using Tailscale** - Use Tailscale's file transfer feature to securely move the key file from laptop to phone
3. **Install grpcio via Termux package** - `pip install grpcio` won't work on Android. Use Termux's native package instead:

```bash
# Don't use pip for grpcio on Android
# pip install grpcio  # This fails

# Use Termux package instead
pkg install python-grpcio
```

## Complete Instructions

See [gvision-text repository](https://github.com/davegoopot/gvision-text) for detailed setup and usage instructions.


