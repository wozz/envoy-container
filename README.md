# build envoy

1. set `PROJECT` env var to your google cloud project
2. setup `WORKSPACE` and/or `def.bzl` to pull the envoy commit version you want to build
3. ensure `.bazelrc`, `.bazelversion`, `bazel/get_workspace_status` are set appropriately
4. run `./scripts/remote_build.sh`
5. envoy image is pushed to gcr in your google project. tag it appropriately
