---
layout: default
---
The projects and posts are mainly for my benefit: writing helps me organize my thoughts, re-reading my thoughts helps me recover knowledge, and the projects I build are mainly for my enjoyment. The work is published here on the off-chance that any of it might be useful to others (and also incase people stalk me before interviews for discussion topics).  

As such, I'm not an expert on anything here -- absolute novice -- so expect some errors and misunderstandings. Please let me know when I'm wrong @squinlan.

## Stuff

{% for project in site.projects %}
  <h3><a href="{{ project.url }}">{{ project.name }}</a></h3>
  <p>{{ project.content | markdownify }}</p>
  {% if project.category and site.categories[project.category] %}
  <ol>
    {% for post in site.categories[project.category] %}
      <li><a href="{{ site.baseurl }}{{ post.url }}">{{post.title}}</a></li>
    {% endfor %}
  </ol>
  {% endif %}
{% endfor %}
