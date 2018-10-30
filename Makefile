# run docker build command with given ev3 dockerfile
define docker_build
	docker build -t 7hal32/ev3dev-robolab-$(1) -f ./ev3dev-jessie/ev3-$(1).dockerfile ./ev3dev-jessie
endef

# assemble complete image of OS
define assemble_image
	$(call create_tar,$(1))
	$(call create_img,$(1))
endef

define create_tar
	./brickstrap/src/brickstrap.sh create-tar 7hal32/ev3dev-robolab-$(1) ev3dev-robolab-$(1).tar
endef

define create_img
	BRICKSTRAP_IMAGE_FILE_SIZE=1000M ./brickstrap/src/brickstrap.sh create-image ev3dev-robolab-$(1).tar ev3dev-robolab-$(1).img
endef

prepare: prepare-tools prepare-brickstrap

# dependencies
prepare-tools:
	sudo apt-get install docker-engine libguestfs-tools qemu-user-static

# fix permissions on /boot/vmlinuz*
prepare-brickstrap:
	sudo chmod +r /boot/vmlinuz*

docker-run-robolab:
	docker run -it 7hal32/ev3dev-robolab-full bash

docker-base:
	$(call docker_build,base)

docker-robolab-full:
	$(call docker_build,robolab)

docker-robolab-debug:
	$(call docker_build,debug)

image-robolab-base:
	$(call assemble_image,base)
	rm ev3dev-robolab-base.tar

image-robolab-full:
	$(call assemble_image,robolab)
	rm ev3dev-robolab-robolab.tar

image-robolab-debug:
	$(call assemble_image,debug)

full: docker-base docker-robolab-full image-robolab-full
