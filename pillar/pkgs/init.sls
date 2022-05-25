default_packages:
    - vim-common
    - net-tools
    - zip
    - unzip
    - curl
    - wget
    - python3-pip
  {% if grains['os_family'] == 'RedHat' %}
    - python3-inotify
  {% elif grains['os_family'] == 'Debian' %}
    - python3-pyinotify
  {% endif %}
