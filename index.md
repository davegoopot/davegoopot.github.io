---
layout: default
title: "{{ site.posts.first.title }}"
---

<div class="articles-list">
  <ul>
    {% for post in site.posts %}
      <li>
        <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
        <p>{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt | truncatewords: 50 }}</p>
      </li>
    {% endfor %}
  </ul>
</div>
