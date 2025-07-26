# Mobile-First Blogging: Commit Directly from Android

This guide shows you how to set up your Android phone to commit images and blog posts directly to GitHub using Termux, eliminating the need for a computer in your blogging workflow.

## Quick Setup (One-Time)

### Termux Terminal Setup
1. Install **Termux** from F-Droid (recommended) or Google Play
2. Open Termux and run:
   ```bash
   pkg install git gh
   gh auth login
   termux-setup-storage
   git clone https://github.com/davegoopot/davegoopot.github.io.git
   cd davegoopot.github.io
   ```

## Daily Workflow

### Using Termux Terminal
1. **Capture** your diagram
2. **Open Termux** and navigate to your repo:
   ```bash
   cd davegoopot.github.io
   ```
3. **Copy photo** from camera folder:
   ```bash
   cp /sdcard/DCIM/Camera/IMG_20250115_143022.jpg images/2025-01-15-workflow-diagram.jpg
   ```
4. **Optimize image** (optional):
   ```bash
   pkg install imagemagick  # one-time install
   convert images/2025-01-15-workflow-diagram.jpg -resize 1200x1200> -quality 85 images/2025-01-15-workflow-diagram-optimized.jpg
   ```
5. **Commit and push**:
   ```bash
   git add images/2025-01-15-workflow-diagram.jpg
   git commit -m "Add workflow diagram for mobile blogging post"
   git push
   ```

### Creating a Blog Post from Phone
Using Termux, you can also create the entire blog post:

```bash
# Create new post file
cat > _posts/2025-01-15-mobile-blogging.md << 'EOF'
---
layout: post
title: "Mobile Blogging Workflow"
date: 2025-01-15
---

I've been experimenting with a mobile-first approach to blogging. Here's my workflow diagram:

![Mobile blogging workflow showing phone to GitHub integration](/images/2025-01-15-workflow-diagram.jpg)

This approach has streamlined my process significantly...
EOF

# Commit the post
git add _posts/2025-01-15-mobile-blogging.md
git commit -m "Add mobile blogging post"
git push
```

## Pro Tips

### File Organization
- **Use consistent naming**: `YYYY-MM-DD-topic-description.jpg`
- **Create folders** for different post series in `images/`
- **Keep original photos** in a separate phone folder as backup

### Image Quality
- **Use good lighting** when photographing diagrams
- **Fill the frame** with your diagram
- **Consider document scan apps** like Google Drive's scan feature for cleaner results

### Termux Shortcuts
Create aliases for common commands in `~/.bashrc`:
```bash
alias blog='cd ~/davegoopot.github.io'
alias addimg='git add images/ && git commit -m "Add images" && git push'
alias newpost='cp _posts/template.md _posts/$(date +%Y-%m-%d)-new-post.md'
```

### Termux Advantages
- Full git functionality
- Image optimization tools
- Automated workflows
- Better file management
- Can write entire posts
- Complete mobile development environment

## Troubleshooting

**Termux storage access denied:**
```bash
termux-setup-storage
# Grant storage permission when prompted
```

**Git authentication issues:**
```bash
gh auth login
# Follow the prompts to re-authenticate
```

**Image too large:**
```bash
# Compress before adding
convert large-image.jpg -resize 1200x1200> -quality 75 compressed-image.jpg
```

**Can't find camera folder:**
```bash
# List common photo locations
ls /sdcard/DCIM/
ls /sdcard/Pictures/
ls /sdcard/Download/
```

This mobile-first approach means you can go from hand-drawn sketch to published blog post entirely from your phone, making blogging more spontaneous and immediate.