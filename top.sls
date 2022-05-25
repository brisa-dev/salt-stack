base:
  '*':
    - states.schedules
    - states.dns
    - states.ntp
    - states.pkgs
    - states.pip_packages
  'G@is_master:True':
    - states.master