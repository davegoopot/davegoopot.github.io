# Image Template for Blog Posts

Use this template when adding images to your Jekyll blog posts.

## Basic Image Inclusion

### Markdown (Simple)
```markdown
![Description of your diagram](/images/YYYY-MM-DD-descriptive-name.jpg)
```

### HTML (More Control)
```html
<img src="/images/YYYY-MM-DD-descriptive-name.jpg" 
     alt="Description of your diagram" 
     style="max-width: 100%; height: auto;" />
```

## Advanced Options

### Centered Image with Caption
```html
<div style="text-align: center; margin: 2em 0;">
  <img src="/images/YYYY-MM-DD-descriptive-name.jpg" 
       alt="Description of your diagram" 
       style="max-width: 100%; height: auto; border: 1px solid #ddd;" />
  <p style="font-style: italic; margin-top: 0.5em; color: #666;">
    Caption: Brief description of what the diagram shows
  </p>
</div>
```

### Responsive Image with Figure
```html
<figure style="margin: 2em 0; text-align: center;">
  <img src="/images/YYYY-MM-DD-descriptive-name.jpg" 
       alt="Description of your diagram" 
       style="max-width: 100%; height: auto;" />
  <figcaption style="font-style: italic; color: #666; margin-top: 0.5em;">
    Your diagram caption here
  </figcaption>
</figure>
```

## File Naming Convention

Use this naming pattern for your image files:
```
YYYY-MM-DD-descriptive-name.jpg
```

Examples:
- `2025-01-15-api-workflow.jpg`
- `2025-01-15-database-schema.jpg`
- `2025-01-15-user-journey-map.jpg`

## Recommended Alt Text Patterns

Good alt text examples:
- `"Workflow diagram showing the API request lifecycle from client to database"`
- `"Hand-drawn database schema with user, posts, and comments tables"`
- `"Sketch of user journey from login to checkout completion"`

Avoid:
- `"My diagram"`
- `"Picture"`
- `"Diagram"`

## Integration with Blog Post Text

### Before the Image
```markdown
I sketched out the process to help clarify my thinking:
```

### After the Image
```markdown
As you can see in the diagram above, the process involves three main stages...
```

### Referencing the Image
```markdown
The workflow (shown below) demonstrates how data flows through the system.
```

## Quick Checklist

Before publishing your post with images:

- [ ] Image is saved in `/images/` directory
- [ ] Filename follows naming convention
- [ ] Alt text is descriptive and meaningful
- [ ] Image displays correctly in preview
- [ ] File size is reasonable (under 500KB recommended)
- [ ] Image is referenced in the post text
- [ ] Jekyll build completes successfully

## Common Issues and Solutions

**Image not showing:**
- Check file path spelling
- Verify image is in `/images/` directory
- Ensure filename case matches exactly

**Image too large:**
- Optimize with TinyPNG or similar tool
- Resize to 800-1200px width maximum
- For mobile users: Use Termux with imagemagick: `convert image.jpg -resize 1200x1200> -quality 85 optimized.jpg`

**Poor mobile display:**
- Always include `max-width: 100%` in styling
- Test on mobile devices or browser dev tools

## Mobile-First Workflow

**Quick upload from Android using Termux:**
```bash
cp /sdcard/DCIM/Camera/photo.jpg images/2025-01-15-diagram.jpg
git add images/2025-01-15-diagram.jpg
git commit -m "Add diagram"
git push
```

**File naming for mobile:**
Use descriptive names that are easy to type on mobile:
- `2025-01-15-workflow.jpg` ✓
- `IMG_20250115_143022.jpg` ✗ (too generic)

See [Mobile Workflow Guide](mobile-workflow-guide.md) for complete setup instructions.