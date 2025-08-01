---
layout: post
title: "Cookiecutter Templates with Integrated Copilot Instructions"
categories: development
tags: cookiecutter, GitHub Copilot, VS Code, project-templates, automation
---

Enhance your Cookiecutter templates with VS Code workspace configuration and GitHub Copilot instructions for context-aware AI assistance from day one.

## Template Structure

```
my-project-template/
├── cookiecutter.json
├── {% raw %}{{cookiecutter.project_slug}}{% endraw %}/
│   ├── .vscode/
│   │   ├── settings.json
│   │   └── copilot-instructions.md
│   ├── README.md
│   ├── .gitignore
│   └── src/
│       └── main.py
```

## Configuration

`cookiecutter.json`:
```json
{
    "project_name": "My Awesome Project",
    "project_slug": "{% raw %}{{ cookiecutter.project_name.lower().replace(' ', '-') }}{% endraw %}",
    "description": "A brief description of the project",
    "author_name": "Your Name",
    "python_version": "3.9"
}
```

For detailed information on creating repository custom instructions, see the [GitHub documentation](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions#creating-a-repository-custom-instructions-file).