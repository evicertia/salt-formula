{% if grains['os_family'] == 'Debian' %}
include:
  - .{{ grains['os']|lower }}
{% endif %}
{% if grains['os_family'] == 'RedHat' %}
include:
  - .redhat
{% endif %}
