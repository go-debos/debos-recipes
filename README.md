# debos-recipes

Sample recipes for [debos](https://github.com/go-debos/debos). Feel free to modify
the recipes. Merge Requests are welcome!

## Legacy recipes

The recipes below are legacy and need reworking to use the new recipe format. They
may be removed from the repository in the near future.

* `debian/armhf/image-wb` contains a recipe for building an image for iMX 6 Wandboard.
* `pine-a64-plus` contains a recipe for building an image for the Pine A64.
* `rpi3` contains a recipe for building an image for `stretch`.
* `rpi64` contains a recipe for building an unified image for Raspberry Pi 3 and 4.
  It has been tested with `bullseye` and `sid` by using additional parameters:
  `debos -t suite:sid -t kernel:linux-image-5.8.0-1-arm64-unsigned rpi64/debimage-rpi64.yaml`
  Use login 'user' with password 'user' to log in.

Initial recipes for Debian are based on previous work located at https://git.apertis.org/cgit/apertis-workshop.git
