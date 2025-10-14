---
layout: post
title: "Testing Google's Handwriting Recognition API with a Single Image"
categories: mobile
tags: google-api, handwriting, ocr, python
---

I want to test Google's Vision API handwriting recognition with a simple image upload to see how well it handles handwritten text.

## Quick Setup

1. Create Google Cloud project and enable Vision API
2. Generate a service account key JSON file
3. Install the Python client: `pip install google-cloud-vision`

## Simple Test Script

```python
#!/usr/bin/env python3
import base64
from google.cloud import vision

def detect_handwriting(image_path, credentials_path):
    """Upload single image to Google Vision API for handwriting detection."""
    
    # Set up client with credentials
    client = vision.ImageAnnotatorClient.from_service_account_json(credentials_path)
    
    # Read and encode image
    with open(image_path, 'rb') as image_file:
        content = image_file.read()
    
    image = vision.Image(content=content)
    
    # Call API for document text detection (best for handwriting)
    response = client.document_text_detection(image=image)
    
    # Extract text
    if response.full_text_annotation:
        print(f"Detected text:\n{response.full_text_annotation.text}")
        print(f"Confidence: {response.full_text_annotation.pages[0].confidence:.2f}")
    else:
        print("No text detected")
    
    # Check for errors
    if response.error.message:
        raise Exception(f'API Error: {response.error.message}')

if __name__ == '__main__':
    detect_handwriting('handwriting_sample.jpg', 'service-account-key.json')
```

## Usage

1. Take a photo of handwritten text
2. Save as `handwriting_sample.jpg`
3. Download service account key as `service-account-key.json`
4. Run: `python test_handwriting.py`

## Results

**Update October 2025:** It works brilliantly! Google Vision API successfully recognised handwritten text from a mobile photo.

### Testing on Android

Got the entire workflow running on Android mobile using Termux:

1. Set up Google Vision API with service account credentials
2. Transferred credentials securely via Tailscale
3. Ran the Python script directly on the phone
4. Recognition accuracy was excellent

### Example Test

Tested with a hand-drawn workflow diagram showing the process: handwritten note → Google Vision API → GitHub. The API accurately recognised the handwritten text, including the word "GitHub" written in casual handwriting.

See the [complete working code on GitHub](https://github.com/davegoopot/gvision-text/blob/main/extract_handwriting.py).

**How did it perform?**
- [x] Text accuracy: Excellent - recognised handwritten notes accurately
- [x] Setup simplicity: Straightforward once grpcio installation sorted
- [x] API response time: Fast enough for real-time use

The [gvision-text repository](https://github.com/davegoopot/gvision-text) contains the full working implementation and setup instructions.