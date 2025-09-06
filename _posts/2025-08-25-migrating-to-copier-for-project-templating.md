---
layout: post
title: "Migrating to Copier for Project Templating"
categories: development
tags: copier, project-templates, cookiecutter, automation, migration
---

Moving from Cookiecutter to [Copier](https://copier.readthedocs.io/en/stable/) to solve the template update problem identified in the [Cookiecutter GitHub Copilot project template](/development/2025/08/01/cookiecutter-github-copilot-project-template.html) post.

## The Problem with Cookiecutter

Cookiecutter excels at creating new projects but cannot update existing projects when the template changes. This is particularly problematic for frequently evolving files like [copilot-instructions.md](https://github.com/davegoopot/cookiecutter-basic/blob/main/%7B%7Bcookiecutter.project_slug%7D%7D/.github/copilot-instructions.md) which I'm constantly refining as I learn better Copilot practices.

## Why Copier

[Copier](https://copier.readthedocs.io/en/stable/updating/) addresses this limitation with its [updating capability](https://copier.readthedocs.io/en/stable/updating/) - it can apply template changes to existing projects, maintaining the original answers whilst incorporating new template features.

## Migration Plan

- [ ] **Migrate Existing CookieCutter Git Repo** - Convert the [cookiecutter-basic](https://github.com/davegoopot/cookiecutter-basic) template structure to Copier format
- [ ] **Translate Into A Copier Repo** - Transform cookiecutter.json and template variables to Copier's copier.yml format  
- [ ] **Apply To An Existing Project** - Test the converted template on an existing project created with the old Cookiecutter template
- [ ] **Update The Template Then Reapply To A Project** - Verify the update workflow by modifying the template and applying changes to the existing project

Implementation details and results to follow.