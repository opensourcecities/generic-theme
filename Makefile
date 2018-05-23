CSS_DIR = ./static/css
CSS_FILE = style.min.css
CSS_TMP_FILE = tmp.css
CSS_FILES = main.css modals.css
current_dir = $(shell pwd)

.PHONY: clean build buildcss buildjs

build: clean buildcss buildjs

buildcss:
	for f in $(CSS_FILES); do cat $(CSS_DIR)/$$f >> $(CSS_DIR)/$(CSS_TMP_FILE); done
	uglifycss $(CSS_DIR)/$(CSS_TMP_FILE) > $(CSS_DIR)/$(CSS_FILE)
	rm -f $(CSS_DIR)/$(CSS_TMP_FILE)

buildjs:
	echo TODO

demo: build
	mkdir -p exampleSite/themes/osc-theme
	mkdir -p exampleSite/themes/osc-theme/archetypes
	mkdir -p exampleSite/themes/osc-theme/images
	mkdir -p exampleSite/themes/osc-theme/layouts
	mkdir -p exampleSite/themes/osc-theme/static
	cp -r $(current_dir)/archetypes/* exampleSite/themes/osc-theme/archetypes/
	cp -r $(current_dir)/images/* exampleSite/themes/osc-theme/images
	cp -r $(current_dir)/layouts/* exampleSite/themes/osc-theme/layouts
	cp -r $(current_dir)/static/* exampleSite/themes/osc-theme/static
	cp -r $(current_dir)/theme.toml exampleSite/themes/osc-theme/theme.toml
	cd examplesite && hugo serve -D

clean:
	rm -f $(CSS_DIR)/$(CSS_FILE)
	rm -f $(CSS_DIR)/$(CSS_TMP_FILE)
	rm -rf exampleSite/themes/osc-theme
