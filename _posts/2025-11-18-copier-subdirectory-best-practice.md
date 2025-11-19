---
layout: post
title: "Copier _subdirectory Best Practice: Keep Template Files Organised"
categories: development
tags: copier, project-templates, best-practices, organisation
---

Copier's getting started documentation doesn't mention the `_subdirectory` setting, but you need if you're going to have a template in a repo that you then want to apply to multiple projects. See:
 [`_subdirectory`](https://copier.readthedocs.io/en/stable/configuring/#subdirectory).

## The Problem

By default, Copier expects template files to live in the repository root alongside configuration files like `copier.yml`, README, and other repository metadata. This quickly becomes confusing, especially accidentally copying the `.git` folder from the template.

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


## Further Reading

The Copier maintainers [recommend this approach](https://github.com/orgs/copier-org/discussions/2383) for keeping templates organised. The official documentation covers [additional `_subdirectory` use cases](https://copier.readthedocs.io/en/stable/configuring/#subdirectory).
