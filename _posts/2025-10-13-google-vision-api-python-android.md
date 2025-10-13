---
layout: post
title: "Accessing Google Vision API from Python on Android"
categories: mobile
tags: google-api, python, android, termux, vision-api
---

Brief signposting for using Google Vision API with Python from Termux on Android.

## The Problem

Can't get an API key using the Google Cloud app on a phone. The mobile interface doesn't provide easy access to service account key generation.

## The Solution

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

## Quick Test

```bash
# Install dependencies
pkg install python-grpcio
pip install google-cloud-vision

# Run with your service account key
python detect_text.py --image sample.jpg --key service-account-key.json
```

Works well for on-device OCR and handwriting recognition using Google's Vision API directly from your Android phone.
