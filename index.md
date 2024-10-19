---
layout: default
title: "{{ site.posts.first.title }}"
---

<div class="articles-list">
    {% for post in site.posts %}
      <div>
        <h1 class="entry-title"><a href="{{ post.url }}">{{ post.title }}</a></h1>
        <p>{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt | truncatewords: 50 }}</p>
      </div>
    {% endfor %}
</div>
