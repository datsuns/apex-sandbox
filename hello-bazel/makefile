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

setup_bazelisk:
	wget https://github.com/bazelbuild/bazelisk/releases/download/v1.27.0/bazelisk-linux-amd64
	sudo mv bazelisk-linux-amd64 /usr/local/bin/bazelisk
	sudo chmod +x /usr/local/bin/bazelisk

ros2:
	bash -c "\
	  source /opt/ros/humble/setup.bash \
	"

.PHONY: default build run test setup setup_bazelisk ros2
