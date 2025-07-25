# Dave Potts - Software Blog

This is a Jekyll-based blog hosted on GitHub Pages. The site is automatically built and deployed using GitHub Pages' default Jekyll processing.

## Automatic Deployment

This site uses GitHub Pages' built-in Jekyll support for automatic deployment:

- **Main branch**: Automatically deployed to the live site when changes are pushed
- **Test branch**: Automatically deployed to a test environment for preview

Simply push your changes to the appropriate branch and GitHub Pages will handle the Jekyll build and deployment automatically. No manual build steps or custom GitHub Actions are required.

## Local Development (Optional)

If you want to preview changes locally before pushing to GitHub, you can set up a local Jekyll environment:

### Prerequisites

- Ruby (version 2.7 or later)
- Jekyll

### Quick Setup

1. Clone the repository:
   ```sh
   git clone https://github.com/davegoopot/davegoopot.github.io.git
   cd davegoopot.github.io
   ```

2. Install Jekyll (if not already installed):
   ```sh
   gem install jekyll
   ```

3. Serve the site locally:
   ```sh
   jekyll serve
   ```

   The site will be available at `http://localhost:4000`.

### Using GitHub Codespace

You can also use GitHub Codespace for development:

1. Open the repository in GitHub Codespace
2. Run the provided serve script:
   ```sh
   ./serve.sh
   ```
3. The site will be available at the provided Codespace URL

## Site Structure

The site follows standard Jekyll conventions:
- `_config.yml` - Site configuration
- `_layouts/` - Page templates
- `_posts/` - Blog posts
- `index.md` - Homepage
- Static HTML files for individual pages

## Important Notes

- The `_config.yml` file must remain in the root directory for GitHub Pages to build the site correctly
- GitHub Pages automatically processes Jekyll sites, so no manual build or deployment steps are needed
- Changes pushed to the main branch are automatically deployed to the live site
