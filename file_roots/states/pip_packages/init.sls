{% set packages = salt['pillar.get']('pip_packages') %}
{% set packages_to_remove = salt['pillar.get']('pip_packages_to_remove') %}

install_pip_packages:
  pip.installed:
    - pkgs: {{ packages }}
{% for pkg in packages_to_remove %}
remove_pip_packages:
  pip.removed:
    - name: {{ pkg }}
{% endfor %}
  