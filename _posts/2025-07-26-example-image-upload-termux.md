---
layout: post
title: "Example Image Upload from Phone Using Termux"
categories: blogging
tags: mobile, diagrams, workflow, images, termux, git
---

After my [previous attempt with the GitHub Android app didn't work](../2025/07/26/example-image-upload-from-phone.html), I decided to try Termux - a powerful terminal emulator for Android that gives you full git functionality.

This post demonstrates the complete workflow from first-time setup to uploading images directly from my phone to this blog.

## First-Time Setup

### Installing and Setting Up Termux

1. **Install Termux** from F-Droid (recommended) or Google Play Store
2. **Open Termux** and run the initial setup:

```bash
# Update packages
pkg update && pkg upgrade

# Install essential tools
pkg install git gh openssh termux-api

# Set up storage access (grant permission when prompted)
termux-setup-storage
```

### Connecting to GitHub

3. **Authenticate with GitHub** using the GitHub CLI:

```bash
# Login to GitHub
gh auth login
```

Follow the prompts to authenticate via web browser or token.

### First Clone of the Repository

4. **Clone your blog repository**:

```bash
# Clone the repository
git clone https://github.com/davegoopot/davegoopot.github.io.git

# Navigate to the repository
cd davegoopot.github.io

# Verify the clone worked
ls -la
```

5. **Configure git identity** (if not already done):

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Uploading an Image

Now for the actual workflow demonstration. I drew a quick diagram on paper and photographed it with my phone.

### Step 1: Copy the Image

```bash
# Navigate to the repository
cd davegoopot.github.io

# Use termux-storage-get to select and copy image from storage
# This opens a file picker interface
termux-storage-get images/2025-07-26-termux-workflow-diagram.jpg
```

The `termux-storage-get` command opens a file picker where you can browse and select your image from anywhere on your device - camera folder, downloads, or any other location. It's much more user-friendly than navigating file paths manually.

### Step 2: Commit and Push

```bash
# Add the image
git add images/2025-07-26-termux-workflow-diagram.jpg

# Commit with descriptive message
git commit -m "Add Termux workflow diagram for mobile blogging post"

# Push to GitHub
git push
```

## The Result

![Termux workflow diagram showing successful mobile git workflow](/images/2025-07-26-termux-workflow-diagram.jpg)
*Caption: Hand-drawn diagram uploaded successfully using Termux.*

## How Did It Go?

1. The upload from the phone was simple enough.
2. The Copilot got the path of the image user wrong at the first attempt. It fixed it with a quick issue and pull request.
4. But the image sizing was all wrong. I'm going to raise a ticket for the Copilot to fix that. 
