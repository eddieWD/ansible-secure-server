bt := '0'

export RUST_BACKTRACE := bt

log := "warn"

export JUST_LOG := log

reqs *FORCE:
  ansible-galaxy install -r requirements.yml {{FORCE}}

main:
  ansible-playbook -b ./main.yml

update HOST *TAGS:
  ansible-playbook -b playbooks/update.yml --limit {{HOST}} {{TAGS}}
