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

## VS Code Integration

`.vscode/settings.json`:
```json
{
    "python.defaultInterpreterPath": "./venv/bin/python",
    "python.formatting.provider": "black",
    "python.linting.enabled": true,
    "github.copilot.enable": {
        "*": true,
        "yaml": false,
        "plaintext": false
    }
}
```

`.vscode/copilot-instructions.md`:
```markdown
# Copilot Instructions for {% raw %}{{ cookiecutter.project_name }}{% endraw %}

## Project Context
{% raw %}{{ cookiecutter.description }}{% endraw %} - Python {% raw %}{{ cookiecutter.python_version }}{% endraw %}

## Standards
- PEP 8, type hints, docstrings
- Functions <20 lines, single responsibility
- AAA test pattern, >90% coverage

## Code Suggestions
- Include error handling and logging
- Use dependency injection
- Follow existing patterns
```

## Usage

```bash
# Install with uv
uv tool install cookiecutter

# Generate project
cookiecutter https://github.com/yourusername/your-template.git
```

The result: a project with immediate Copilot context, consistent configuration, and zero setup time.