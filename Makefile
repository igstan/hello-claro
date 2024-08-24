all:
	bazel build //example:hello_bin

run: all
	bazel run //example:hello_bin
