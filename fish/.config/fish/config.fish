alias l="exa -l -a"
alias ls="exa"
alias ...="cd .. & cd .."

set PATH $PATH /usr/local/sbin /usr/local/bin $HOME/.cargo/bin $HOME/VulkanSDK/newest/x86_64/bin $HOME/.fzf/bin $HOME/miniconda3/bin $HOME/VulkanSDK/newest/source/shaderc/src/build/third_party/spirv-tools/tools
set -Ux LD_LIBRARY_PATH $HOME/VulkanSDK/newest/x86_64/lib:$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib:$HOME/.rlsl/compiler/lib/rustlib/x86_64-unknown-linux-gnu/lib

set -Ux CARGO_HOME $HOME/.cargo
set -Ux CARGO_INCREMENTAL 1

set -Ux _JAVA_AWT_WM_NONREPARENTING 1
set -Ux VK_LAYER_PATH $HOME/VulkanSDK/newest/x86_64/etc/explicit_layer.d

set -U FZF_LEGACY_KEYBINDINGS 0

set fish_greeting ""
#export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/ldc/bin:$HOME/src/DCD/bin:$HOME/src/dfmt/bin:$HOME/VulkanSDK/newest/x86_64/bin:$HOME/.cargo/bin:$HOME/Qt/5.8/gcc_64/lib:$HOME/teamspeak:$HOME/.local/bin:$HOME/Downloads/android-ndk-r15b:$HOME/Downloads/android-ndk-r15b/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin:$GOPATH/bin"
