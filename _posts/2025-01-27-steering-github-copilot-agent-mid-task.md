---
layout: post
title: "How To Steer GitHub Copilot Agent Mid-Task: Comment On The Pull Request, Not The Issue"
categories: development
tags: GitHub, GitHub Copilot, development, workflow
---

Here's something I learnt the hard way when working with GitHub Copilot's coding agent: if you want to provide feedback or steer the agent whilst it's working on a task, you need to comment on the **pull request** it creates, not on the original issue.

## The Problem

When Copilot starts working on an issue, it creates a pull request and begins implementing changes. Your natural instinct might be to add comments to the original issue if you want to clarify requirements, suggest a different approach, or provide additional context. 

This doesn't work. Comments added to the parent issue appear to be completely ignored by the agent.

## The Solution

Instead, navigate to the pull request that Copilot has created and add your comments there. The agent actively monitors the PR for feedback and will incorporate your guidance into its ongoing work.

## Why This Matters

This distinction is crucial for effective collaboration with the agent:

- **Issue comments**: Treated as historical context, not active feedback
- **PR comments**: Actively monitored and responded to during development
- **Review comments**: Even better for specific code suggestions

## Practical Tips

1. **Bookmark the PR**: As soon as Copilot creates the pull request, bookmark it for easy access
2. **Use specific comments**: Reference line numbers or specific functions when providing feedback
3. **Be direct**: The agent responds better to clear, actionable instructions than vague suggestions
4. **Check the PR regularly**: The agent may ask questions or request clarification in the PR comments

## Example Workflow

1. Raise an issue describing the problem
2. Wait for Copilot to create a pull request
3. **Navigate to the PR** (not back to the issue)
4. Add comments with feedback, corrections, or additional requirements
5. Watch the agent incorporate your suggestions

This simple shift in where you place your comments can dramatically improve your collaboration with GitHub Copilot's coding agent.

---

*Found this tip useful? Share your own GitHub Copilot workflow discoveries—I'd love to hear what's worked for you.*