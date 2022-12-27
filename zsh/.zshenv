export GOPATH=$HOME/.go
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/ldc/bin:$HOME/src/DCD/bin:$HOME/src/dfmt/bin:$HOME/.cargo/bin:$HOME/Qt/5.8/gcc_64/lib:$HOME/teamspeak:$HOME/.local/bin:$HOME/Downloads/android-ndk-r15b:$HOME/Downloads/android-ndk-r15b/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin:$GOPATH/bin:/usr/bin/core_perl/:/opt/miniconda3/bin:/opt/android-sdk-linux/platform-tools"
# export MANPATH="/usr/local/man:$MANPATH"
#
# export RUST_SRC_PATH=$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/

export LD_LIBRARY_PATH="$HOME/VulkanSDK/newest/x86_64/lib:$HOME/Qt/5.8/gcc_64/lib"
# export VK_LAYER_PATH=$HOME/VulkanSDK/newest/x86_64/etc/explicit_layer.d

export CARGO_HOME=$HOME/.cargo
#export TERM=xterm-256color
export CARGO_INCREMENTAL=1
export RUSTC_FORCE_INCREMENTAL=1

export _JAVA_AWT_WM_NONREPARENTING=1
export WAYLAND_DISPLAY=alacritty

export BROWSER=firefox
export XDG_CONFIG_HOME="$HOME/.config"
export DISABLE_AUTO_UPDATE="true"
# export WINIT_HIDPI_FACTOR=1
# export TERM=tmux-256color
# export TERM=xterm-256color
source "$HOME/.cargo/env"
source "/etc/profile.d/flatpak.sh"

export ANDROID_SDK_ROOT=/opt/android-sdk-linux
export ANDROID_NDK_ROOT=/opt/android-ndk-r21d
