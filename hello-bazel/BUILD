# load("@bazel_skylib//:rules.bzl", "strings")  # 例: 将来拡張用

cc_library(
    name = "hello",
    hdrs = ["include/hello/hello.h"],
    srcs = ["src/hello.cc"],
    includes = ["include"],
    visibility = ["//visibility:public"],
)

cc_binary(
    name = "app",
    srcs = ["src/main.cc"],
    deps = [":hello"],
)

cc_binary(
    name = "talker",
    srcs = ["src/talker.cc"],
    deps = [
        "@rclcpp_pkg//:rclcpp",
        "@rcutils_pkg//:rcutils",
        "@rcl_pkg//:rcl",
    ],
)

cc_test(
    name = "hello_test",
    srcs = ["tests/hello_test.cc"],
    deps = [
        ":hello",
        "@googletest//:gtest_main",
    ],
)
