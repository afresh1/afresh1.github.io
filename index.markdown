---
author: Andrew
title: W00!
order: 1
---

How exciting!  Or, mostly exciting?

### Repositories

{% assign public_repositories = site.github.public_repositories | where:'fork', false | sort: 'stargazers_count' | reverse %}
{% for repository in public_repositories limit: 9 %}
  * [{{ repository.name }}]({{ repository.html_url }}) \\
    {{ repository.description }}
{% endfor %}

<table>
{% tablerow repo in public_repositories cols:3 %}
    {% include repo.html %}
{% endtablerow %}
</table>
