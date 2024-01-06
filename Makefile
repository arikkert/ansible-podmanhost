YAMLLINT=@if which yamllint > /dev/null; then yamllint $@.yml; fi
ANSIBLELINT=@if which ansible-lint > /dev/null; then ansible-lint -q $@.yml; fi
OPTIONS=--diff #--check #--limit 'all:!badhost' #-vvv #--check
PLAYBOOK=ansible-playbook $(OPTIONS) $@.yml

all: main

install_roles:
	ansible-galaxy install -r requirements.yml

main reinstall: install_roles
	$(YAMLLINT)
	$(ANSIBLELINT)
	$(PLAYBOOK)
