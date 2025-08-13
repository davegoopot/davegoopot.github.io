---
layout: post
title: "Samsung A54: Finding Camera Photos from Termux"
categories: mobile
tags: android, termux, samsung, camera, mobile-workflow
---

Quick reference for Samsung A54 users working with Termux who need to locate camera-taken photos for their mobile blogging workflow.

## TL;DR - The Commands

```bash
# Samsung A54 camera photos are typically here:
ls /sdcard/DCIM/Camera/

# Copy latest photo to your blog images folder:
cp /sdcard/DCIM/Camera/$(ls -t /sdcard/DCIM/Camera/ | head -1) images/2025-08-13-diagram.jpg

# If using Samsung's enhanced camera features:
ls /sdcard/DCIM/Camera/Pro/
ls /sdcard/DCIM/Screenshots/
```

## Samsung A54 Specific Locations

The Samsung A54 stores camera photos in several locations depending on camera mode and settings:

**Standard camera photos:**
```bash
/sdcard/DCIM/Camera/
```

**Pro mode or manual settings:**
```bash
/sdcard/DCIM/Camera/Pro/
```

**Screenshots (useful for capturing phone screens):**
```bash
/sdcard/DCIM/Screenshots/
```

**Downloaded images from apps:**
```bash
/sdcard/Download/
/sdcard/Pictures/
```

## Quick File Browser

```bash
# List all photo directories at once:
for dir in /sdcard/DCIM/Camera /sdcard/DCIM/Screenshots /sdcard/Download /sdcard/Pictures; do
    echo "=== $dir ==="
    ls -lt "$dir" 2>/dev/null | head -3
    echo
done
```

## Integration with Mobile Workflow

Once you've located your photo, the standard [mobile workflow](../docs/mobile-workflow-guide.html) applies:

```bash
cd davegoopot.github.io
cp /sdcard/DCIM/Camera/20250813_143022.jpg images/2025-08-13-workflow-diagram.jpg
git add images/2025-08-13-workflow-diagram.jpg
git commit -m "Add workflow diagram"
git push
```

## Samsung A54 Gotchas

- **File naming**: Samsung uses `YYYYMMDD_HHMMSS.jpg` format
- **Pro mode**: Creates larger files in a separate subfolder
- **Burst photos**: Creates numbered sequences (IMG_001.jpg, IMG_002.jpg)
- **Storage permission**: Ensure Termux has storage access via `termux-setup-storage`

That's it. The Samsung A54 follows standard Android conventions, but knowing the exact paths saves time when you're working on mobile.