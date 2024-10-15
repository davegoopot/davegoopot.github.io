---
layout: default
title: "Home"
---

<h1>Recent Posts</h1>
<div class="articles-list">
  <ul>
    {% for post in site.posts %}
      <li>
        <a href="{{ post.url }}">{{ post.title }}</a>
        <span>{{ post.date | date: "%B %d, %Y" }}</span>
      </li>
    {% endfor %}
  </ul>
</div>
