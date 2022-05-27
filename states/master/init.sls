config_autosign:
  file.managed:
    - source: salt://master/etc/autosign.conf
    - name: /etc/salt/autosign.conf
    - user: root
    - group: root
    - mode: 640
config_master:
  file.managed:
    - source: salt://master/etc/master
    - name: /etc/salt/master
    - user: root
    - group: root
    - mode: 640
config_returner:
  file.managed:
    - source: salt://master/etc/master.d/returners.conf
    - name: /etc/salt/master.d/returners.conf
    - user: root
    - group: root
    - mode: 640
config_file_roots:
  file.managed:
    - source: salt://master/etc/master.d/file_roots.conf
    - name: /etc/salt/master.d/file_roots.conf
    - user: root
    - group: root
    - mode: 640
    - makedirs: True
config_rest_api:
  file.managed:
    - source: salt://master/etc/master.d/rest_api.conf
    - name: /etc/salt/master.d/rest_api.conf
    - user: root
    - group: root
    - mode: 640
    - makedirs: True
config_salt_auth:
  file.managed:
    - source: salt://master/etc/master.d/auth.conf
    - name: /etc/salt/master.d/auth.conf
    - user: root
    - group: root
    - mode: 640
    - makedirs: True
restart_salt_master:
  service.running:
    - name: salt-master
    - enable: True
    - restart: True
    - watch:
      - file: /etc/salt/master.d/file_roots.conf
      - file: /etc/salt/master
      - file: /etc/salt/autosign.conf
      - file: /etc/salt/master.d/returners.conf
      - file: /etc/salt/master.d/rest_api.conf
      - file: /etc/salt/master.d/auth.conf
restart_salt_api:
  service.running:
    - name: salt-api
    - enable: True
    - restart: True
    - watch:
      - file: /etc/salt/master.d/rest_api.conf
      - file: /etc/salt/master.d/auth.conf