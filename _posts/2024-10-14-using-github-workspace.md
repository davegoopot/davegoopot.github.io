---
layout: post
title: "Finally I Can Code on My Mobile Phone - GitHub Copilot Workspace"
categories: development
tags: GitHub, development
---

I've been trying to find a satisfactory way to write code using my mobile phone for years. In [GitHub Copilot Workspaces](https://github.blog/news-insights/product-news/github-copilot-workspace/), I've finally found something that works. Of course, the problems with using the phone for development are the lack of screenspace and the difficulty typing the funky characters needed. The solution provided by GitHub Workspaces is that you type the changes that you want in natural language, and then the AI takes a shot at writing the code for you.

The critical insight is that everything starts with an issue raised in GitHub. From the issue, you press the "Open in Workspace" button. The flow is then:

1. The AI describes its plan for fixing the problem.
2. You refine it in natural language to point it in the right direction.
3. The AI generates the code.
4. You fix the code (first attempts are very hit-and-miss in my experience), either with natural language by going to step 2 or directly using the code editor in the browser.
5. You fire up a Codespace directly in the Workspace UI and use that to test your changes.
6. When happy, still in the Workspace, you merge into your GitHub repo.
7. Repeat. Start with a new issue.


Here's a [GitHub video on developing using a mobile](https://www.youtube.com/watch?v=Zv6TuVzcRdY).
