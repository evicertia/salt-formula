{% if salt['pillar.get']('salt:copr-zeromq4', False) %}
{% if grains['os'] in ('RedHat', 'CentOS', 'Fedora') %}
  {% if grains['os'] == 'Fedora' %}
    {% set repotype = 'fedora' %}
  {% else %}
    {% set repotype = 'epel' %}
  {% endif %}
saltstack-zeromq4:
  pkgrepo.managed:
    - humanname: Copr repo for zeromq4 owned by saltstack
    - baseurl: http://copr-be.cloud.fedoraproject.org/results/saltstack/zeromq4/{{ repotype }}-$releasever-$basearch/
    - gpgcheck: 0
    - skip_if_unavailable: False
    - enabled: 1
    - require_in:
      - pkg: salt-minion
{% endif %}
{% endif %}
