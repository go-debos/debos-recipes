# debos-recipes
Collection of recipes for ['debos' tool](https://github.com/go-debos/debos).

* `rpi3` contains a recipe for building an image for `stretch`.
* `rpi64` contains a recipe for building an unified image for Raspberry Pi 3 and 4.
  It has been tested with `bullseye` and `sid` by using additional parameters:
  debos -t suite:sid -t kernel:linux-image-5.8.0-1-arm64-unsigned rpi64/debimage-rpi64.yaml
  Use login 'user' with password 'user' to log in.

Initial recipes for Debian are based on previous work located at https://git.apertis.org/cgit/apertis-workshop.git
