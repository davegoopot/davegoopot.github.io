---
layout: post
title: "Handwriting Recognition Testing Process"
categories: mobile
tags: handwriting, recognition, testing, mobile, ocr
---

Quick testing approach for evaluating handwriting recognition services with sample images from my Samsung A54.

## The Testing Process

Simple three-step methodology for comparing handwriting recognition services:

### 1. Pick a Sample Image

Using the [existing Termux workflow](/mobile/2025/08/13/samsung-a54-find-camera-photos-termux.html) to access camera photos:

```bash
# Access latest handwritten sample
ls ~/storage/dcim/Camera/
cp ~/storage/dcim/Camera/$(ls -t ~/storage/dcim/Camera/ | head -1) sample-handwriting.jpg
```


### 2. Document Manual Upload Steps

For each online service tested, record:
- Upload method (web interface, API, mobile app)
- Image format requirements
- Authentication requirements

### 3. Report Back on Results

Compare services on:
- **Accuracy** - Character recognition rate
- **Speed** - Processing time
- **Usability** - Upload workflow complexity
- **Cost** - Per-image or subscription pricing
- **Output format** - Plain text, structured data, searchable PDF

## Initial Services to Test

- Google Vision API
- Microsoft Azure Cognitive Services
- Amazon Textract
- Apple Live Text (iOS comparison)
- Open-source alternatives (Tesseract, PaddleOCR)

Results and detailed comparisons to follow in subsequent posts.

## Update: October 2025

Google Vision API worked so well on the first attempt that I'm not going to test any others. See [Google Vision Handwriting Recognition Works!](/mobile/2025/10/14/google-vision-handwriting-recognition-works.html) for details on the successful implementation.