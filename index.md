---
layout: default
title: "Dave Potts - Software"
---

<div class="articles-list">
    {% for post in site.posts %}
        <h1 class="entry-title"><a href="{{ post.url }}">{{ post.title }}</a></h1>
        <p>{{ post.date | date: "%B %d, %Y" }}</p>
        <div>{{ post.content | truncatewords_html: 150 }}</div>
    {% endfor %}

