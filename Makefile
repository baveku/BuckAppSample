
.PHONY : log install_buck build watch message targets audit debug test xcode_tests clean project audit

# Use local version of Buck
BUCK=buck
AppName=MyStartApp

BUCK_OPTIONS=\
	--config custom.appName="${AppName}"

log:
	echo "Make"

update_cocoapods:
	pod repo update
	pod install

build:
	$(BUCK) build //App:$(AppName)

build_release:
	$(BUCK) build //App:$(AppName) --config-file ./BuildConfigurations/Release.buckconfig

debug:
	$(BUCK) install //App:$(AppName) --run --simulator-name 'iPhone 8'

module:
	scripts/submodule.sh $(MODULE_NAME)

debug_release:
	$(BUCK) install //App:$(AppName) --run --simulator-name 'iPhone XS' --config-file ./BuildConfigurations/Release.buckconfig

targets:
	$(BUCK) targets //...

ci: install_buck targets build
	echo "Done"


audit:
	$(BUCK) audit rules App/BUCK > Config/Gen/App-BUCK.py
	$(BUCK) audit rules Pods/BUCK > Config/Gen/Pods-BUCK.py

clean:
	rm -rf **/*.xcworkspace
	rm -rf **/*.xcodeproj
	rm -rf buck-out

kill_xcode:
	killall Xcode || true
	killall Simulator || true

project: kill_xcode clean
	$(BUCK) project //App:workspace ${BUCK_OPTIONS}
	open App/$(AppName).xcworkspace
