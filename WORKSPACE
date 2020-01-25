workspace(name = "envoy_container")


load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load(":def.bzl", "project")

http_file(
    name = "eds_patch",
    urls = ["https://github.com/envoyproxy/envoy/commit/3271f34b419482729f62f9d7931a67d8517de8e1.patch"],
    sha256 = "37960acec670eb9d74273de6eabe40aecd6a271cb8fd239bc21b99dfc14b0f1b",
)

# setup envoy and dependencies
http_archive(
    name = "envoy",
    sha256 = project.envoy.sha256,
    url = project.envoy.url,
    strip_prefix = project.envoy.prefix,
    patches = ["@eds_patch//file:downloaded"],
    patch_args = ["-p1"],
)
load("@envoy//bazel:api_binding.bzl", "envoy_api_binding")
envoy_api_binding()
load("@envoy//bazel:api_repositories.bzl", "envoy_api_dependencies")
envoy_api_dependencies()
load("@envoy//bazel:repositories.bzl", "envoy_dependencies")
envoy_dependencies()
load("@envoy//bazel:dependency_imports.bzl", "envoy_dependency_imports")
envoy_dependency_imports()

# Download the rules_docker repository at release v0.14.1
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "dc97fccceacd4c6be14e800b2a00693d5e8d07f69ee187babfd04a80a9f8e250",
    strip_prefix = "rules_docker-0.14.1",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.14.1/rules_docker-v0.14.1.tar.gz"],
)
load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)
container_repositories()
load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")
container_deps()

load("@io_bazel_rules_docker//container:pull.bzl", "container_pull")

container_pull(
    name = "alpine_linux_amd64",
    registry = "index.docker.io",
    repository = "frolvlad/alpine-glibc",
    tag = "alpine-3.10",
    digest = "sha256:83ddab910021257190027b837ba52c8a9d4d47c1d5aa01a307048619293d129c"
)
