---
layout: post
title: "Mistral LLM Agent Works As GitHub Copilot Replacement"
categories: development
tags: Mistral, LLM, GitHub, GitHub Copilot, development, workflow, mobile
---

I have been working to find an alternative to GitHub Copilot for LLM agent coding on my mobile. With Mistral releasing their remote agents, that is now possible.

The flow I have got working for me is:

1. Create an issue in GitHub
2. Start a new Mistral coding session
3. Ask Le Chat to fix the GitHub issue, pasting in the link
4. Review the resulting PR. Either send feedback to Le Chat, or merge.
