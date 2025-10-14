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

*[Placeholder for actual test results]*

**How did it perform?**
- [ ] Text accuracy: 
- [ ] Setup simplicity: 
- [ ] API response time: 

*[Will update after testing with real handwriting samples]*