
def _pkg_config_repo_impl(rctx):
    pkg = rctx.attr.package
    # cflags
    res_c = rctx.execute(["pkg-config", "--cflags", pkg])
    if res_c.return_code != 0:
        fail("pkg-config cflags failed for %s: %s" % (pkg, res_c.stderr))
    cflags = res_c.stdout.strip().split()

    # libs
    res_l = rctx.execute(["pkg-config", "--libs", pkg])
    if res_l.return_code != 0:
        fail("pkg-config libs failed for %s: %s" % (pkg, res_l.stderr))
    libs = res_l.stdout.strip().split()

    build = """
cc_library(
    name = "{pkg}",
    srcs = [],
    hdrs = [],
    copts = {cflags},
    linkopts = {libs},
    visibility = ["//visibility:public"],
)
""".format(pkg=pkg, cflags=repr(cflags), libs=repr(libs))

    rctx.file("BUILD.bazel", build)

pkg_config_repo = repository_rule(
    implementation = _pkg_config_repo_impl,
    attrs = {"package": attr.string(mandatory=True)},
    environ = ["PKG_CONFIG_PATH"],
)
