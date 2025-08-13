---
layout: post
title: "Samsung A54: Finding Camera Photos from Termux"
categories: mobile
tags: android, termux, samsung, camera, mobile-workflow
---

Quick reference for Samsung A54 users working with Termux who need to locate camera-taken photos.

## The Steps

```bash
# 1. First, set up storage access in Termux:
termux-setup-storage
# (Grant permissions in the dialog that appears)

# 2. Samsung A54 camera photos are then accessible here:
ls ~/storage/dcim/Camera/

# 3. Copy latest photo to your blog images folder:
cp ~/storage/dcim/Camera/$(ls -t ~/storage/dcim/Camera/ | head -1) images/2025-08-13-diagram.jpg
```

## The Gotcha: Storage Setup

**Critical first step:** Termux needs storage permissions to access camera photos.

```bash
# Run this command first:
termux-setup-storage
```

When the permissions dialog appears, make sure to grant Termux access to storage. Without this, you won't see any photos in the directories.



