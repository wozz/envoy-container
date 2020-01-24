load("@io_bazel_rules_docker//container:container.bzl", "container_image", "container_layer")

container_layer(
    name = "entry_script",
    files = [
        ":docker-entrypoint.sh",
    ],
)

container_layer(
    name = "envoy_binary",
    files = [
        "//:envoy",
    ],
    directory = "/usr/local/bin",
)

container_layer(
    name = "default_config",
    files = [
        ":envoy.yaml",
    ],
    directory = "/etc/envoy",
)

container_image(
    name = "envoy",
    base = "@alpine_linux_amd64//image",
    cmd = ["envoy", "-c", "/etc/envoy/envoy.yaml"],
    entrypoint = ["/docker-entrypoint.sh"],
    layers = [
        ":entry_script",
        ":envoy_binary",
        ":default_config",
    ],
    ports = [
        "10000/tcp",
    ],
)
