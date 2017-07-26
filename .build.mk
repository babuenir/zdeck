packages = 			\
	fpm-equivs 		\
	python-pip

before_install:
	sudo echo $(ZILOGIC_APT_REPO) | sudo tee /etc/apt/sources.list.d/zilogic.list
	sudo apt-get update

install:
	sudo apt-get install -y --no-install-recommends $(packages)
	sudo pip install zdrive-push

script:
	make

after_success:
	zdrive-push zdeck $(BUILD_TYPE) $(BUILD_VERSION) debian zdeck*.deb
