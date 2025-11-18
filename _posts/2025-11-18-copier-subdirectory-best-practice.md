---
layout: post
title: "Copier _subdirectory Best Practice: Keep Template Files Organised"
categories: development
tags: copier, project-templates, best-practices, organisation
---

Copier's documentation is generally clear and obvious, but there's one configuration property that deserves more prominence: [`_subdirectory`](https://copier.readthedocs.io/en/stable/configuring/#subdirectory).

## The Problem

By default, Copier expects template files to live in the repository root alongside configuration files like `copier.yml`, README, and other repository metadata. This quickly becomes messy as your template grows.

## The Solution

Use the `_subdirectory` property in your `copier.yml` to specify a dedicated folder for template files:

```yaml
_subdirectory: template
```

This tells Copier to look for template files in the `template/` directory rather than the repository root. Your repository structure becomes:

```
my-copier-template/
├── copier.yml              # Configuration
├── README.md               # Template documentation
├── .gitignore
└── template/               # All template files here
    ├── src/
    ├── tests/
    └── README.md
```

## Why This Matters

- **Clarity**: Immediate distinction between repository files and template files
- **Maintenance**: Easier to navigate and modify templates
- **Professional**: Cleaner repository structure for users browsing your template

## Further Reading

The Copier maintainers [recommend this approach](https://github.com/orgs/copier-org/discussions/2383) for keeping templates organised. The official documentation covers [additional `_subdirectory` use cases](https://copier.readthedocs.io/en/stable/configuring/#subdirectory) including monorepo scenarios.
