build:
	podman build -t runner-test .

test: SIZE?=100
test:
	-podman rm -f test-$(SIZE)
	podman run -d --log-driver json-file --name test-$(SIZE) runner-test $(SIZE)
	while [ ! `podman logs test-$(SIZE) | grep finished` ]; do sleep 1; done
	podman logs test-$(SIZE) | grep finished
	podman rm -f test-$(SIZE)
