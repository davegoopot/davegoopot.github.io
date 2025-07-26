---
layout: post
title: "A Simple Process for Including Hand-Drawn Diagrams in Blog Posts"
categories: development
tags: Jekyll, GitHub Pages, blogging, documentation, workflow
---

Here's what GitHub Copilot came up with for getting images into blog posts. I'm going to give it a go with the Android GitHub client.

## The Challenge

I wanted a process that would:
- Work with basic tools (just a phone and computer)
- Produce good-quality images suitable for the web
- Be fast enough that I wouldn't avoid doing it
- Result in accessible, professional-looking posts

## My Solution: A Four-Step Process

Here's a visual overview of the process I've developed:

![Blog image process diagram showing four steps: capture, transfer, optimise, and include, with tips for each stage](/images/2025-07-26-blog-image-process-example.svg)

### 1. Capture

I use my phone's camera to photograph the diagram. The key is good lighting and holding the phone directly above the paper to avoid perspective distortion.

### 2. Transfer

I upload the photo to Google Drive from my phone, then download it to my computer. This preserves image quality better than emailing it to myself.

### 3. Optimise

I use an online tool like TinyPNG to compress the image, aiming for under 500KB. I also crop out unnecessary background and adjust brightness if needed.

### 4. Include

I save the optimised image in my Jekyll site's `/images/` directory and reference it in my markdown with proper alt text.

## Why This Works

This process strikes the right balance between simplicity and quality:

- **Fast**: Once you've done it a few times, the whole process takes under 5 minutes
- **Consistent**: Following the same steps each time ensures reliable results
- **Quality**: The images look professional and load quickly
- **Accessible**: Including alt text makes the content accessible to all readers

## Real-World Example

Here's how I used this process for a recent diagram about API design patterns. The hand-drawn sketch helped me think through the relationships between different components, and including it in the blog post made the explanation much clearer for readers.

## Tips I've Learned

1. **Lighting matters**: Natural light from a window works much better than artificial overhead lighting
2. **Take multiple shots**: It's easier to pick the best one than to try to retake it later
3. **Keep originals**: I always save the unedited photo in case I need to re-crop or adjust
4. **Test on mobile**: Check how your images look on smaller screens

## The Complete Process Guide

I've documented the complete process with step-by-step instructions, troubleshooting tips, and best practices. You can find it in the [Image Inclusion Process Guide](https://github.com/davegoopot/davegoopot.github.io/blob/master/docs/image-inclusion-process.md).

For quick reference when adding images to your posts, check out the [Image Template Guide](https://github.com/davegoopot/davegoopot.github.io/blob/master/docs/image-template.md) with copy-paste examples and best practices.

## Next Steps

I'm planning to experiment with:
- Using a dedicated document scanning app for even better quality
- Creating templates for common diagram types
- Exploring automated image optimisation in my Jekyll build process

The goal is always the same: remove friction from the process of sharing ideas through visual content.

---

*Have you found a better process for including hand-drawn diagrams in your blog posts? I'd love to hear about it! Feel free to reach out with your own tips and techniques.*
