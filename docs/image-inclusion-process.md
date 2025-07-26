# Process for Including Hand-Drawn Diagrams in Blog Posts

This document outlines a simple process for taking a hand-drawn diagram on paper, capturing it with a mobile phone, and including it in a Jekyll blog post on GitHub Pages.

## Overview

This guide covers two approaches:

### Mobile-First Approach (For Android users)
Commit directly from your phone to GitHub using Termux, skipping the computer entirely:
1. **Capture** - Take a photo of your hand-drawn diagram
2. **Upload & Commit** - Use Termux git client to add directly to repository

### Traditional Desktop Approach
The comprehensive four-step process:
1. **Capture** - Take a photo of your hand-drawn diagram
2. **Transfer** - Get the image from your phone to your computer/repository
3. **Optimize** - Prepare the image for web use
4. **Include** - Add the image to your blog post

## Step-by-Step Process

### Mobile-First Workflow (Direct from Android Phone)

If you want to streamline the process and commit directly from your Android phone using Termux:

#### Termux + Git CLI (Full Mobile Development Environment)
For advanced users who want full git functionality on Android:

1. **Install Termux** from F-Droid or Google Play
2. **Install git and gh CLI** in Termux:
   ```bash
   pkg install git gh
   ```
3. **Clone your repository**:
   ```bash
   git clone https://github.com/yourusername/yourrepo.git
   cd yourrepo
   ```
4. **Set up authentication** with GitHub CLI:
   ```bash
   gh auth login
   ```
5. **Copy your photo** to the Termux storage (enable storage access first):
   ```bash
   termux-setup-storage
   # Common Android storage paths (use the one that works on your device):
   cp /sdcard/DCIM/Camera/your-photo.jpg images/
   # Alternative paths: /storage/emulated/0/DCIM/Camera/ or /storage/self/primary/DCIM/Camera/
   ```
6. **Optimize image** (install imagemagick if needed):
   ```bash
   pkg install imagemagick
   convert your-photo.jpg -resize 1200x1200> -quality 85 optimized-photo.jpg
   ```
7. **Commit and push**:
   ```bash
   git add images/optimized-photo.jpg
   git commit -m "Add diagram for blog post"
   git push
   ```

#### Alternative: MGit or Pocket Git Apps
Install a dedicated Git client like MGit or Pocket Git:
1. **Clone** your repository in the app
2. **Use the app's file manager** to add your photo to `images/`
3. **Stage, commit, and push** through the app interface

#### Mobile Workflow Considerations:
- **File naming**: Use descriptive names like `2025-01-15-workflow-diagram.jpg`
- **Image optimization**: Consider using apps like "Photo Compress 2.0" before uploading
- **Alt text planning**: Note down what alt text you'll use in your blog post
- **Repository organization**: Keep the `images/` folder organized with date-based naming

### Traditional Desktop Workflow

### 1. Capture the Diagram

**What you need:**
- Hand-drawn diagram on paper
- Mobile phone with camera
- Good lighting

**Best practices for photography:**
- Ensure the paper fills most of the frame
- Use natural light when possible (near a window)
- Avoid shadows - hold the phone directly above the paper
- Keep the phone parallel to the paper to avoid perspective distortion
- Take multiple shots to ensure you have a clear one
- Consider using your phone's document scanning mode if available

### 2. Transfer the Image

**Options for getting the image to your computer:**

**Option A: Cloud Storage (Recommended)**
- Upload the photo to Google Drive, iCloud, Dropbox, or OneDrive from your phone
- Download it to your computer
- This method preserves image quality

**Option B: Email**
- Email the photo to yourself
- Download the attachment
- Note: Some email providers compress images

**Option C: USB Cable**
- Connect your phone to computer via USB
- Copy the image file directly
- Preserves original quality

**Option D: AirDrop (Mac/iPhone)**
- Use AirDrop to send directly to your Mac
- Fastest method for Apple devices

### 3. Optimize the Image

**File naming:**
- Use descriptive, kebab-case names: `my-diagram-name.jpg`
- Include the date for organization: `2024-01-15-workflow-diagram.jpg`
- Avoid spaces and special characters

**Image optimization:**
- **Recommended size:** 800-1200 pixels wide for diagrams
- **File format:** 
  - JPG for photographs of diagrams (smaller file size)
  - PNG for simple diagrams with text (better quality)
- **File size:** Aim for under 500KB for web performance

**Tools for optimization:**
- **Online tools:** TinyPNG, ImageOptim, Squoosh
- **Built-in tools:** Preview (Mac), Paint (Windows)
- **Phone apps:** Many phones have built-in compression options

**Image editing tips:**
- Crop to remove unnecessary background
- Adjust brightness/contrast if the diagram is hard to read
- Consider rotating if the orientation is wrong
- For handwritten text, ensure it's legible in the final size

### 4. Include in Your Blog Post

**File placement:**
- Save the optimized image in the `/images/` directory of your repository
- Use a descriptive filename that relates to the blog post

**Markdown syntax:**
```markdown
![Description of the diagram](/images/your-image-name.jpg)
```

**HTML syntax (for more control):**
```html
<img src="/images/your-image-name.jpg" 
     alt="Description of the diagram" 
     style="max-width: 100%; height: auto;" />
```

**Best practices for inclusion:**
- Always include descriptive alt text for accessibility
- Add a caption below the image if needed
- Reference the image in your text: "As shown in the diagram below..."
- Consider the image placement in relation to your text flow

## Example Workflow

Here's a complete example:

1. **Draw** a workflow diagram on paper
2. **Photograph** it with your phone in good lighting
3. **Upload** to Google Drive from your phone
4. **Download** to your computer
5. **Optimize** using an online tool like TinyPNG
6. **Rename** to `2024-01-15-blog-workflow.jpg`
7. **Save** to `/images/2024-01-15-blog-workflow.jpg` in your repository
8. **Include** in your blog post:

```markdown
I sketched out my blog writing process to help clarify my thoughts:

![Blog writing workflow diagram showing steps from idea to published post](/images/2024-01-15-blog-workflow.jpg)

This diagram helped me identify bottlenecks in my current process...
```

## Tips for Success

- **Practice the photo technique** - it takes a few tries to get consistently good results
- **Backup your originals** - keep the original photo in case you need to re-edit
- **Test on mobile** - check how your images look on mobile devices
- **Consider your audience** - ensure handwriting is legible to others
- **Be consistent** - develop a standard approach for all your diagrams

## Troubleshooting

**Image not displaying:**
- Check the file path is correct
- Ensure the image file is actually in the `/images/` directory
- Verify the filename matches exactly (case-sensitive)

**Image too large:**
- Use image optimization tools to reduce file size
- Consider reducing dimensions if the diagram is still clear

**Poor quality:**
- Retake the photo in better lighting
- Try using your phone's document scan feature
- Consider using a scanner app instead of the regular camera

**Accessibility concerns:**
- Always include meaningful alt text
- Ensure text in diagrams is large enough to read
- Consider providing a text description of complex diagrams

## Jekyll-Specific Notes

- Images are served from the `/images/` directory in the site root
- GitHub Pages automatically builds and deploys when you push changes
- Test locally with `jekyll serve` before pushing to GitHub
- Images are cached by browsers - use different filenames for updated versions

## Recommended Mobile Tools for Android

### Essential Apps:
- **Termux** - Terminal emulator for full git functionality and mobile development
- **Photo Compress 2.0** - Optimize images before upload
- **MGit** or **Pocket Git** - Alternative dedicated Android git clients (if you prefer GUI)

### Termux Setup Commands:
```bash
# Initial setup
pkg install git gh imagemagick
gh auth login
termux-setup-storage

# Clone your repo (one time)
git clone https://github.com/yourusername/yourrepo.git
cd yourrepo

# Daily workflow
# Copy your photo (use the storage path that works on your device)
cp /sdcard/DCIM/Camera/photo.jpg images/
# Alternative paths: /storage/emulated/0/DCIM/Camera/ or /storage/self/primary/DCIM/Camera/
convert photo.jpg -resize 1200x1200> -quality 85 optimized.jpg
git add images/optimized.jpg
git commit -m "Add diagram for post"
git push
```

This process balances simplicity with quality, allowing you to quickly capture and share your hand-drawn diagrams while maintaining good web practices. The mobile-first approach is especially powerful for Android users who want to maintain their entire blogging workflow on-the-go.