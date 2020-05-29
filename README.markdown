# Backlight

On laptops with /sys/class/backlight/intel_backlight/brightness the backlight will be adjusted by the percent given as an argument.

## Usage

````
backlight <percent>
````

## Installation

Clone this repository under ~/common-lisp/ or any other place where quicklisp will find the project.

Start up sbcl with debugging disabled to prevent security problem and with quicklisp loaded.

Load backlight:

````
(ql:quicklisp :backlight)
````

Compile binary:

````
(asdf:make :backlight)
````

Copy binary to /usr/local/bin/ and set the setuid bit:

````
cp ~/common-lisp/backlight/backlight /usr/local/bin/
chmod +s /usr/local/bin/backlight
````

## Author

* Lars Engblom

## Copyright

Copyright (c) 2020 Lars Engblom

## License

Licensed under the MIT License.
