# As Yet Unnamed Void-based Operating System

- Personal (and thus opinionated) minimal (but batteries included) custom Void Linux build
    - Use AYUVOS or just use this repository to see how to do this yourself :)
- Built using [void-linux/void-mklive](https://github.com/void-linux/void-mklive)
    - That repo is pulled in using a git subtree @ [`906652a4945feccd0be85ecfaf3b6d02be5d49b8`](https://github.com/void-linux/void-mklive/tree/906652a4945feccd0be85ecfaf3b6d02be5d49b8)
- Currently, builds **MUST** be done on an existing Void installation
    - I do plan on trying to get containerised builds working, but that's not a priority, just use a VM if you need to
- **HUGE WIP, PROBABLY NOT CURRENTLY DAILY-DRIVABLE OR EASILY INSTALLABLE**

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

2. Boot into the live environment, then either:
    1. Follow the [Void Linux Installation Guide](https://docs.voidlinux.org/installation/live-images/guide.html)
    2. Run `void-installer` for a guided TUI-based install

## Changes/the "opinionated" stuff

- Number of extra packages/CLI utilities pre-installed which can be seen in [build.sh](./build.sh)
- Swap out `wpa_supplicant` for `NetworkManager`
- SwayWM as default DE

## Resources/Docs/References that I've used while building this

- General Void-related stuff
    - [Void Linux Handbook](https://docs.voidlinux.org/)
    - [florintanasa/brgvos-void](https://github.com/florintanasa/brgvos-void)
- Getting Incus/LXC working
    - [LXC - Void Linux Handbook](https://docs.voidlinux.org/config/containers-and-vms/lxc.html#incus)
    - [Problems setting up incus : r/voidlinux](https://www.reddit.com/r/voidlinux/comments/1aqw7ou/problems_setting_up_incus/)
    - [void-packages/srcpkgs/incus/files/README.voidlinux at master](https://github.com/void-linux/void-packages/blob/master/srcpkgs/incus/files/README.voidlinux)
