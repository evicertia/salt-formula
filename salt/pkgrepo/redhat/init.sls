{% from "salt/map.jinja" import salt_settings with context %}

saltstack-pkgrepo:
  pkgrepo.managed:
    - humanname: SaltStack repo for RHEL/CentOS $releasever
    - baseurl: {{ salt_settings.pkgrepo }}
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: {{ salt_settings.key_url }}

#
# Remove saltstack-zeromq4 COPR repo, as it is no longer required.
#

saltstack-zeromq4:
  pkgrepo:
    - absent

saltstack-rhel:
  pkgrepo:
    - absent

