---
layout: post
title: "Google Vision Handwriting Recognition Works!"
categories: mobile
tags: google-api, handwriting, ocr, python, android, vision-api
---

Got Google Vision working on Android mobile. Example picture worked perfectly.

## Testing on Android

The entire workflow runs on Android mobile using Termux:

1. Set up Google Vision API with service account credentials
2. Transferred credentials securely via Tailscale
3. Ran the Python script directly on the phone
4. Recognition accuracy was excellent

## Example Test

Tested with a hand-drawn workflow diagram showing the process: paper → Google Vision API → GitHub. The API accurately recognised the handwritten text written in casual handwriting.

## Results

**Text accuracy:** Excellent - recognised handwritten notes accurately  
**Setup simplicity:** Straightforward once grpcio installation sorted  
**API response time:** Fast enough for real-time use

See the [complete working code on GitHub](https://github.com/davegoopot/gvision-text/blob/main/extract_handwriting.py).

The [gvision-text repository](https://github.com/davegoopot/gvision-text) contains the full working implementation and setup instructions.
