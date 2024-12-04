---
layout: post
title: "How to Run a Dev Server Via GitHub Workspace"
categories: development
tags: GitHub, development
---

Running a development server using GitHub Workspace is a straightforward process. This guide will walk you through the steps to get your development server up and running.

## Prerequisites

Before you begin, ensure you have the following:

- A GitHub account
- A repository with the necessary code for your project
- GitHub Codespaces enabled for your account

## Steps to Run a Dev Server

1. **Open the Repository in GitHub Workspace**

   Navigate to your repository on GitHub and click the "Open in Workspace" button. This will open the repository in a new GitHub Workspace.

2. **Set Up the Development Environment**

   Once the workspace is open, you need to set up the development environment. This involves installing the necessary dependencies and configuring the environment.

   ```sh
   bundle install
   ```

3. **Run the Development Server**

   After setting up the environment, you can run the development server using the following command:

   ```sh
   bundle exec jekyll serve --host 0.0.0.0
   ```

   This command will start the Jekyll server, and the site will be available at `http://localhost:4000`.

4. **Access the Development Server**

   Open your web browser and navigate to `http://localhost:4000` to access the development server. You can now make changes to your code and see the updates in real-time.

## Additional Tips

- **Using Docker**: If you prefer to use Docker, you can run the Jekyll server inside a Docker container. This can help ensure consistency across different development environments.

  ```sh
  docker run --rm -v "$PWD:/srv/jekyll" -it jekyll/jekyll jekyll serve --host 0.0.0.0
  ```

- **Testing**: Before deploying your changes, it's a good idea to run tests to ensure everything is working correctly. You can use the following command to run Jekyll tests:

  ```sh
  bundle exec jekyll doctor
  ```

By following these steps, you can easily set up and run a development server using GitHub Workspace. This allows you to develop and test your code in a consistent and controlled environment.

For more detailed information on using GitHub Workspace, refer to the existing post [Using GitHub Workspace](2024-10-14-using-github-workspace.md).
