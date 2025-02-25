YAMLLINT=@if which yamllint > /dev/null; then yamllint $@.yml; fi
ANSIBLELINT=@if which ansible-lint > /dev/null; then ansible-lint -q $@.yml; fi
OPTIONS=--diff #--check #--limit 'all:!badhost' #-vvv #--check
PLAYBOOK=ansible-playbook $(OPTIONS) $@.yml

all: main

requirements:
	$(YAMLLINT)
	$(ANSIBLELINT)
	ansible-galaxy install -r $@.yml

main reinstall: requirements
	$(YAMLLINT)
	$(ANSIBLELINT)
	$(PLAYBOOK)
