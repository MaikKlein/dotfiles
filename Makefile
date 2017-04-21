.DEFAULT_GOAL:=install

PACKAGES=$(sort $(dir $(wildcard */)))

.PHONY: install
install:
	stow -t ~ $(PACKAGES)

.PHONY: uninstall
uninstall:
	stow -Dt ~ $(PACAKGES)

.PHONY: update
update: pull install

.PHONY: pull
pull:
	git pull

.PHONY: push
push:
	git add . && git commit -m "update" && git push origin master
