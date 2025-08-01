# Copilot Instructions for Dave Potts Software Blog

This is a Jekyll-based software blog hosted on GitHub Pages. When contributing to this repository, please follow these guidelines:

## Repository Structure
- **Jekyll site**: Standard Jekyll structure with `_config.yml`, `_layouts/`, `_posts/`, etc.
- **Blog posts**: Written in Markdown in the `_posts/` directory with YAML front matter
- **Layouts**: HTML templates in `_layouts/` (default.html, post.html)
- **Static files**: HTML pages, images, and theme assets
- **GitHub Pages**: Automatically builds and deploys from the main branch

## Content Guidelines
- Blog posts should focus on software development, programming, and technical topics
- Use clear, concise writing appropriate for a technical audience
- Follow existing post structure with proper YAML front matter including title, categories, and tags
- Images should be optimized and placed in the `images/` directory

## Code Style
- Follow Jekyll conventions for file naming and structure
- Use semantic HTML in layouts and templates
- Maintain consistent indentation and formatting
- Liquid templating syntax should be clean and well-commented when complex

## Development Workflow
- The site uses GitHub Pages' built-in Jekyll processing
- Changes to main branch are automatically deployed
- Local development can use `jekyll serve` or the provided `serve.sh` script
- No custom build process required - GitHub Pages handles Jekyll compilation