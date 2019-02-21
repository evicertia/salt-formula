{% from "salt/map.jinja" import salt_settings with context %}

saltstack-pkgrepo:
  pkgrepo.managed:
    - humanname: SaltStack repo for RHEL/CentOS $releasever
    - baseurl: {{ salt_settings.pkgrepo }}
    - enabled: 0
    - gpgcheck: 1
    - gpgkey: {{ salt_settings.key_url }}
    - require_in:
      - pkg: salt-minion

#
# Remove saltstack-zeromq4 COPR repo, as it is no longer required.
#

saltstack-zeromq4:
  pkgrepo:
    - absent

saltstack-rhel:
  pkgrepo:
    - absent

saltstack:
  pkgrepo:
    - absent

