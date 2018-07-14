# LESS params
LESS_DIR = ./static-src/less
LESS_FILES = main.less modals.less
LESS_TMP_FILE = tmp.less

# CSS params
CSS_DIR = ./static/css
CSS_FILE = style.min.css
CSS_TMP_FILE = tmp.css

# JS params
JS_SRC_DIR   = ./static-src/js
JS_SRC_FILE  = main.js
JS_DEST_DIR  = ./static/js
JS_DEST_FILE = main.min.js

.PHONY: clean clean-css clean-js clean-demo build build-css build-js demo

clean: clean-css clean-js clean-demo

clean-css:
	rm -f $(CSS_DIR)/$(CSS_TMP_FILE)
	rm -f $(LESS_DIR)/$(LESS_TMP_FILE)

clean-js:
	rm -f $(JS_DEST_DIR)/$(JS_DEST_FILE)

clean-demo:
	rm -rf demo

build: build-css build-js

build-css: clean-css
	for f in $(LESS_FILES); do cat $(LESS_DIR)/$$f >> $(LESS_DIR)/$(LESS_TMP_FILE); done
	lessc $(LESS_DIR)/$(LESS_TMP_FILE) > $(CSS_DIR)/$(CSS_TMP_FILE)
	uglifycss $(CSS_DIR)/$(CSS_TMP_FILE) > $(CSS_DIR)/$(CSS_FILE)
	rm -f $(CSS_DIR)/$(CSS_TMP_FILE)
	rm -f $(LESS_DIR)/$(LESS_TMP_FILE)

build-js: clean-js
	uglifyjs $(JS_SRC_DIR)/$(JS_SRC_FILE) > $(JS_DEST_DIR)/$(JS_DEST_FILE)

demo: clean-demo build
	mkdir -p demo/themes/osc-theme
	rsync -av exampleSite/* demo
	rsync -av --exclude='demo' --exclude='exampleSite' --exclude='.git' . demo/themes/osc-theme
	cd demo && hugo serve -D
