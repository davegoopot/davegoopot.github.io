# Testing Changes Before Merging to Master

To ensure that the changes you make to the site are correct and do not introduce any issues, you can test the compiled Jekyll code locally before merging to the master branch. Follow the steps below to run the Jekyll build and tests locally.

## Prerequisites

Make sure you have the following installed on your local machine:

- Ruby (version 2.7 or later)
- Bundler
- Docker (optional, for running tests in a containerized environment)

## Steps to Run Jekyll Build Locally

1. Clone the repository to your local machine:
   ```sh
   git clone https://github.com/davegoopot/davegoopot.github.io.git
   cd davegoopot.github.io
   ```

2. Install the required gems:
   ```sh
   bundle install
   ```

3. Build the Jekyll site:
   ```sh
   bundle exec jekyll build
   ```

4. Serve the site locally to preview the changes:
   ```sh
   bundle exec jekyll serve
   ```

   The site will be available at `http://localhost:4000`. Open this URL in your web browser to preview the changes.

## Steps to Run Jekyll Tests Locally

1. Ensure you have Docker installed on your local machine.

2. Run the Jekyll tests using the `jekyll/jekyll` Docker image:
   ```sh
   docker run --rm -v "$PWD:/srv/jekyll" -it jekyll/jekyll jekyll doctor
   ```

   This command will run the Jekyll tests and output any issues found with the site.

## Steps to Publish the Test Branch to GitHub Pages

1. Ensure you have Docker installed on your local machine.

2. Run the Jekyll build:
   ```sh
   bundle exec jekyll build
   ```

3. Publish the test branch to the GitHub Pages site under the branch URL:
   ```sh
   git checkout -b test
   git add .
   git commit -m "Test branch"
   git push origin test
   ```

   The test branch will be published to the GitHub Pages site under the branch URL. You can manually check the resulting site before merging the changes to master.

## Using GitHub Codespace for Testing Jekyll Changes

You can use GitHub Codespace to test the Jekyll changes before merging to the master branch. Follow the steps below:

1. Open the repository in GitHub Codespace.
2. Once the Codespace is ready, run the following command to build the Jekyll site:
   ```sh
   bundle exec jekyll build
   ```
3. Serve the site locally to preview the changes:
   ```sh
   bundle exec jekyll serve --host 0.0.0.0
   ```
4. The site will be available at `http://localhost:4000`. Open this URL in your web browser to preview the changes.

## Important Note

The `_config.yml` file must be located in the root directory of the repository for the Jekyll site to function correctly. Ensure that the `_config.yml` file is in the root directory before running the Jekyll build and tests.
