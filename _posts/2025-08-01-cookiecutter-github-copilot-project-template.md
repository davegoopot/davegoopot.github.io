---
layout: post
title: "Cookiecutter Templates with Integrated Copilot Instructions"
categories: development
tags: cookiecutter, GitHub Copilot, VS Code, project-templates, automation
---


I'm going to create my own Cookiecutter template containing VS Code workspace configuration and GitHub Copilot instructions tailored to my coding preferences.


For detailed information on creating repository custom instructions, see the [GitHub documentation](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions#creating-a-repository-custom-instructions-file).

## Progress

The first attempt with Copilot resulted in it developing a vast and complex template for a Python project. After calming it down with pull request comments, I've managed to get the simple template I wanted.

[cookiecutter-basic](https://github.com/davegoopot/cookiecutter-basic)

I need to change the Copilot instructions to match my coding approach, keep it simple, before this is useful. 

Here's what I've come up with [copilot-instructions.md](https://github.com/davegoopot/cookiecutter-basic/blob/main/%7B%7Bcookiecutter.project_slug%7D%7D/.github/copilot-instructions.md).

## Serious Limitation: Updates When The Template Changes

My [copilot-instructions.md](https://github.com/davegoopot/cookiecutter-basic/blob/main/%7B%7Bcookiecutter.project_slug%7D%7D/.github/copilot-instructions.md) file changes frequently, since I'm just learning
how to best code with Copilot. This results in a problem: Cookieuctter is designed to create new projects, but cannot update existing projects when the template changes. I'm going to 
seek an alternative. Probably [Copier](https://copier.readthedocs.io/en/stable/updating/).
