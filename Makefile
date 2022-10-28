build:
	podman build -t runner-test .

test: SIZE?=100
test:
	-podman rm -f test-$(SIZE)
	podman run -d --name test-$(SIZE) runner-test $(SIZE)
	podman logs test-$(SIZE) | grep finished
	podman rm -f test-$(SIZE)
