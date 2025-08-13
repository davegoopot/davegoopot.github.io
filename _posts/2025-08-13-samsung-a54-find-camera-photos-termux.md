---
layout: post
title: "Samsung A54: Finding Camera Photos from Termux"
categories: mobile
tags: android, termux, samsung, camera, mobile-workflow
---

Quick reference for Samsung A54 users working with Termux who need to locate camera-taken photos for their mobile blogging workflow.

## TL;DR - The Steps

```bash
# 1. First, set up storage access in Termux:
termux-setup-storage
# (Grant permissions in the dialog that appears)

# 2. Samsung A54 camera photos are then accessible here:
ls ~/storage/dcim/Camera/

# 3. Copy latest photo to your blog images folder:
cp ~/storage/dcim/Camera/$(ls -t ~/storage/dcim/Camera/ | head -1) images/2025-08-13-diagram.jpg
```

## Prerequisites: Storage Setup

**Critical first step:** Termux needs storage permissions to access camera photos.

```bash
# Run this command first:
termux-setup-storage
```

When the permissions dialog appears, make sure to grant Termux access to storage. Without this, you won't see any photos in the directories.

## Samsung A54 Specific Locations

After running `termux-setup-storage`, the Samsung A54 stores camera photos in these locations:

**Standard camera photos:**
```bash
~/storage/dcim/Camera/
```

**Screenshots (useful for capturing phone screens):**
```bash
~/storage/dcim/Screenshots/
```

**Downloaded images from apps:**
```bash
~/storage/downloads/
~/storage/pictures/
```

## Quick File Browser

```bash
# List all photo directories at once:
for dir in ~/storage/dcim/Camera ~/storage/dcim/Screenshots ~/storage/downloads ~/storage/pictures; do
    echo "=== $dir ==="
    ls -lt "$dir" 2>/dev/null | head -3
    echo
done
```

## Integration with Mobile Workflow

Once you've located your photo, the standard [mobile workflow](../docs/mobile-workflow-guide.html) applies:

```bash
cd davegoopot.github.io
cp ~/storage/dcim/Camera/20250813_143022.jpg images/2025-08-13-workflow-diagram.jpg
git add images/2025-08-13-workflow-diagram.jpg
git commit -m "Add workflow diagram"
git push
```

## Samsung A54 Gotchas

- **Storage permission**: **Must** run `termux-setup-storage` first and grant permissions in the dialog
- **Path confusion**: Don't use `/sdcard/` paths - use `~/storage/` after setup
- **File naming**: Samsung uses `YYYYMMDD_HHMMSS.jpg` format
- **Empty directories**: If directories appear empty, check storage permissions again

That's it. The key is the `termux-setup-storage` step - without it, you won't see any photos even though they exist.