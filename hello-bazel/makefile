default:

build:
	bazel build //:app

run:
	bazel run //:app

test:
	bazel test //:hello_test

# https://bazel.build/install/ubuntu?hl=ja
setup:
	sudo apt install apt-transport-https curl gnupg -y
	curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
	sudo mv bazel-archive-keyring.gpg /usr/share/keyrings
	echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
	sudo apt update && sudo apt install bazel


.PHONY: default build run test setup
