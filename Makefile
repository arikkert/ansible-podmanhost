# adapt the path to the python script to you site
PYTHON_SCRIPT=../roles/role_nrpe_check_podman/files/check_podman

YAMLLINT=@if which yamllint > /dev/null; then yamllint $@.yml; fi
ANSIBLELINT=@if which ansible-lint > /dev/null; then ansible-lint $@.yml; fi
PYLINT=@if which pylint > /dev/null; then if test -f $(PYTHON_SCRIPT); then pylint -d C0103 $(PYTHON_SCRIPT); fi; fi
PLAYBOOK=ansible-playbook $(OPTIONS) $@.yml

main reinstall:
	$(YAMLLINT)
	$(ANSIBLELINT)
	$(PYLINT)
	$(PLAYBOOK) --check #-vvv
