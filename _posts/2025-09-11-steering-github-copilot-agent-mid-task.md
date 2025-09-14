---
layout: post
title: "How To Steer GitHub Copilot Agent Mid-Task: Comment On The Pull Request, Not The Issue"
categories: development
tags: GitHub, GitHub Copilot, development, workflow
---

Here's something I learnt when working with GitHub Copilot's coding agent: if you want to provide feedback or steer the agent whilst it's working on a task, you need to comment on the **pull request** it creates, not on the original issue.

## The Problem

When Copilot starts working on an issue, it creates a pull request and begins implementing changes. Your natural instinct might be to add comments to the original issue if you want to clarify requirements, suggest a different approach, or provide additional context. 

This doesn't work. Comments added to the parent issue appear to be completely ignored by the agent.

## The Solution

Instead, navigate to the pull request that Copilot has created and add your comments there. The agent actively monitors the PR for feedback and will incorporate your guidance into its ongoing work.

Even review comments can be hit-and-miss. I've seen Copilot pick up the review comment immediately. I've seen Copilot completely ignore review comments. If you've put a review in and Copilot is ignoring it, then a `@copilot please work to correct the review comments` prompt usually gets its attention.

