---
layout: default
title: "Archive - Dave Potts Software"
permalink: /archive/index.html
---

<h1>Archive</h1>

<ul class="archive-list">
    {% for post in site.posts %}
        <li>
            <span class="post-date">{{ post.date | date: "%B %d, %Y" }}</span> - 
            <a href="{{ post.url }}">{{ post.title }}</a>
        </li>
    {% endfor %}
</ul>
