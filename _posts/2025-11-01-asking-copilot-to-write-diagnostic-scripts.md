---
layout: post
title: "Asking Copilot To Write Diagnostic Scripts When Stuck"
categories: development
tags: GitHub Copilot, debugging, development, workflow
---

When Copilot gets stuck trying to directly fix a problem, asking it to write a diagnostic script can help get unstuck.

## The Pattern

Instead of repeatedly asking Copilot to fix the issue directly, request a standalone diagnostic script. The script should:

- Test different configurations to isolate the problem
- Output detailed information about what works and what doesn't
- Be independent and easy to run

## Example

Whilst fixing a web scraper that was getting 403 errors, direct attempts to fix the issue went in circles. Asking Copilot to write a diagnostic script revealed that the issue was missing HTTP headers.

The diagnostic script tested multiple header combinations and logged the results, making the root cause obvious. See [diagnose_403.py](https://github.com/davegoopot/mcr_fit_sniper/blob/main/diagnose_403.py) for the implementation.

## Why This Works

- Diagnostic scripts gather facts rather than making assumptions
- The output provides concrete data for subsequent fixes
- The script becomes documentation of the investigation process
- It's faster than iterative trial-and-error
