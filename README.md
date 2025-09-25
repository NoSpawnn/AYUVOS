# As Yet Unnamed Void-based Operating System

- Personal (and thus opinionated) custom Void Linux build
    - Use AYUVOS or just use this repository to see how to do this yourself :)
- Built using [void-linux/void-mklive](https://github.com/void-linux/void-mklive)
- Currently, builds **MUST** be done on an existing Void installation
    - I do plan on trying to get containerised builds working, but that's not a priority, just use a VM if you need to

## Building

1. Clone this repo

    ```sh
    $ git clone https://github.com/NoSpawnn/AYUVOS.git
    $ cd AYUVOS
    ```

2. Run `build.sh`

    ```sh
    $ ./build.sh
    ```

    - `.iso` is spit out to the project root

## Installation

1. Burn the `.iso` to a USB

    ```sh
    $ dd bs=4M if=<path/to/iso> of=/dev/<your_usb>
    ```

2. Boot into the live environment, and follow the [Void Linux Installation Guide](https://docs.voidlinux.org/installation/live-images/guide.html)
