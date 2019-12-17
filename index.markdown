---
author: Andrew
title: W00!
---

How exciting!  Or, mostly exciting?

### Repositories

{% assign public_repositories = site.github.public_repositories | where:'fork', false | sort: 'stargazers_count' | reverse %}
{% for repository in public_repositories limit: 9 %}
  * [{{ repository.name }}]({{ repository.html_url }}) \\
    {{ repository.description }}
{% endfor %}
