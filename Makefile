LESS_DIR = ./static/less
LESS_FILES = main.less modals.less
LESS_TMP_FILE = tmp.less
CSS_DIR = ./static/css
CSS_FILE = style.min.css
CSS_TMP_FILE = tmp.css
current_dir = $(shell pwd)

.PHONY: clean cleancss cleanjs build buildcss buildjs demo

build: buildcss buildjs

buildcss: cleancss
	for f in $(LESS_FILES); do cat $(LESS_DIR)/$$f >> $(LESS_DIR)/$(LESS_TMP_FILE); done
	lessc $(LESS_DIR)/$(LESS_TMP_FILE) > $(CSS_DIR)/$(CSS_TMP_FILE)
	uglifycss $(CSS_DIR)/$(CSS_TMP_FILE) > $(CSS_DIR)/$(CSS_FILE)
	rm -f $(CSS_DIR)/$(CSS_TMP_FILE)
	rm -f $(LESS_DIR)/$(LESS_TMP_FILE)

buildjs: cleanjs
	echo TODO

demo: build
	mkdir -p demo/themes/osc-theme
	rsync -av exampleSite/* demo
	rsync -av --exclude='demo' --exclude='exampleSite' --exclude='.git' . demo/themes/osc-theme
	cd demo && hugo serve -D

clean: cleancss cleanjs
	rm -rf demo

cleancss:
	rm -f $(CSS_DIR)/$(CSS_TMP_FILE)
	rm -f $(LESS_DIR)/$(LESS_TMP_FILE)

cleanjs:
	echo TODO
