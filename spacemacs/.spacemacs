;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.

;; It must be stored in your home directory.

(defun grep-whole-git (not-all)
  (interactive "P")
  (helm-grep-git-1 default-directory
                   (null not-all)))

(defun grep-whole-git-struct (not-all)
  (defun struct ()
    (insert "struct "))
  (add-hook 'minibuffer-setup-hook 'struct)
  (interactive "P")
  (helm-grep-git-1 default-directory
                   (null not-all))
  (remove-hook 'minibuffer-setup-hook 'struct))

(defun grep-whole-git-fn (not-all)
  (defun struct ()
    (insert "fn "))
  (add-hook 'minibuffer-setup-hook 'struct)
  (interactive "P")
  (helm-grep-git-1 default-directory
                   (null not-all))
  (remove-hook 'minibuffer-setup-hook 'struct))


(defun helm-git-grep-struct ()
  (defun struct ()
    (insert "struct "))
  (add-hook 'minibuffer-setup-hook 'struct)
  (interactive)
  (helm-git-grep)
  (remove-hook 'minibuffer-setup-hook 'struct))

(defun helm-git-grep-fn ()
  (defun struct ()
    (insert "fn "))
  (add-hook 'minibuffer-setup-hook 'struct)
  (interactive)
  (helm-git-grep)
  (remove-hook 'minibuffer-setup-hook 'struct))

(defun save-buffer-always ()
  "Save the buffer even if it is not modified."
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

(defun save-switch-normal ()
  "Save the buffer and switches to the normal state"
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer)
  (evil-normal-state))

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs) dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation
   'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation
   t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path
   '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(javascript
     lua
     html
     vimscript (
                csharp
                html
                php
                phpshell :variables shell-default-term-shell
                      "/bin/zsh" shell-default-shell 'eshell)
               ;; (rustrls :location (recipe
               ;;                          :fetcher github
               ;;                          :repo "MaikKlein/rustrls"))
               rust
               ranger
               ivy
               ;;rustrls
               yaml
               markdown
               latex
               spell-checking
               shaders
               semantic
               asm
               emacs-lisp
               (c-c++ :variables c-c++-enable-clang-support
                      t)
                                        ;rust
                                        ;emacs-lsp
               ;; ----------------------------------------------------------------
               ;; Example of useful layers you may want to use right away.
               ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
               ;; <M-m f e R> (Emacs style) to install them.
               ;; ----------------------------------------------------------------
               helm
               ;; (auto-completion :variables
               ;;                  auto-completion-tab-key-behavior 'complete
               ;;                  auto-completion-enable-snippets-in-popup
               ;;                  nil auto-completion-complete-with-key-sequence
               ;;                  nil auto-completion-enable-sort-by-usage nil
               ;;                  auto-completion-enable-help-tooltip
               ;;                  nil)
               auto-completion
               ;; better-defaults
               emacs-lisp
               git
               github
               ;; markdown
               (org :variables org-enable-reveal-js-support t)
               ;; (shell :variables
               ;;        shell-default-height 30
               ;;        shell-default-position 'bottom)
               ;; spell-checking
               themes-megapack
               (syntax-checking :variables syntax-checking-enable-tooltips
                                nil)
               ;; version-control
               )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(evil-numbers doom-themes material-theme dracula-theme
                  gruvbox-theme color-theme-sanityinc-tomorrow
                  monokai-theme helm-git-grep ivy swiper )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages
   '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(vi-tilde-fringe eldoc evil-escape firebelly-theme
                     niflheim-theme
                     pastels-on-dark-theme
                     tronesque-theme
                     zonokai-theme)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages
   'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no"
                ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
                ;; possible. Set it to nil if you have no way to use HTTPS in your
                ;; environment, otherwise it is strongly recommended to let it set to t.
                ;; This variable has no effect if Emacs is launched with the parameter
                ;; `--insecure' which forces the value of this variable to nil.
                ;; (default t)
                dotspacemacs-elpa-https
                t
                ;; Maximum allowed time in seconds to contact an ELPA repository.
                dotspacemacs-elpa-timeout
                5
                ;; If non nil then spacemacs will check for updates at startup
                ;; when the current branch is not `develop'. Note that checking for
                ;; new versions works via git commands, thus it calls GitHub services
                ;; whenever you start Emacs. (default nil)
                dotspacemacs-check-for-update
                nil
                ;; If non-nil, a form that evaluates to a package directory. For example, to
                ;; use different package directories for different Emacs versions, set this
                ;; to `emacs-version'.
                dotspacemacs-elpa-subdirectory
                nil
                ;; One of `vim', `emacs' or `hybrid'.
                ;; `hybrid' is like `vim' except that `insert state' is replaced by the
                ;; `hybrid state' with `emacs' key bindings. The value can also be a list
                ;; with `:variables' keyword (similar to layers). Check the editing styles
                ;; section of the documentation for details on available variables.
                ;; (default 'vim)
                dotspacemacs-editing-style
                'vim
                ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
                dotspacemacs-verbose-loading
                nil
                ;; Specify the startup banner. Default value is `official', it displays
                ;; the official spacemacs logo. An integer value is the index of text
                ;; banner, `random' chooses a random text banner in `core/banners'
                ;; directory. A string value must be a path to an image format supported
                ;; by your Emacs build.
                ;; If the value is nil then no banner is displayed. (default 'official)
                dotspacemacs-startup-banner
                'official
                ;; List of items to show in startup buffer or an association list of
                ;; the form `(list-type . list-size)`. If nil then it is disabled.
                ;; Possible values for list-type are:
                ;; `recents' `bookmarks' `projects' `agenda' `todos'."
                ;; List sizes may be nil, in which case
                ;; `spacemacs-buffer-startup-lists-length' takes effect.
                dotspacemacs-startup-lists
                '((recents . 5)
                  (projects . 7))
                ;; True if the home buffer should respond to resize events.
                dotspacemacs-startup-buffer-responsive
                t
                ;; Default major mode of the scratch buffer (default `text-mode')
                dotspacemacs-scratch-mode
                'text-mode
                ;; List of themes, the first of the list is loaded when spacemacs starts.
                ;; Press <SPC> T n to cycle to the next theme in the list (works great
                ;; with 2 themes variants, one dark and one light)
                dotspacemacs-themes
                '(solarized-light solarized-dark doom-one spacemacs-light)
                ;; If non nil the cursor color matches the state color in GUI Emacs.
                dotspacemacs-colorize-cursor-according-to-state
                t
                ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
                ;; quickly tweak the mode-line size to make separators look not too crappy.
                dotspacemacs-default-font
                '("Source Code Pro" :size 15
                  :weight semi-bold
                  :width normal
                  :powerline-scale 1.2)
                dotspacemacs-leader-key
                "SPC"
                ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
                ;; (default "SPC")
                dotspacemacs-emacs-command-key
                "SPC"
                ;; The key used for Vim Ex commands (default ":")
                dotspacemacs-ex-command-key
                ":"
                ;; The leader key accessible in `emacs state' and `insert state'
                ;; (default "M-m")
                dotspacemacs-emacs-leader-key
                "M-m"
                ;; Major mode leader key is a shortcut key which is the equivalent of
                ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
                dotspacemacs-major-mode-leader-key
                ","
                ;; Major mode leader key accessible in `emacs state' and `insert state'.
                ;; (default "C-M-m")
                dotspacemacs-major-mode-emacs-leader-key
                "C-M-m"
                ;; These variables control whether separate commands are bound in the GUI to
                ;; the key pairs C-i, TAB and C-m, RET.
                ;; Setting it to a non-nil value, allows for separate commands under <C-i>
                ;; and TAB or <C-m> and RET.
                ;; In the terminal, these pairs are generally indistinguishable, so this only
                ;; works in the GUI. (default nil)
                dotspacemacs-distinguish-gui-tab
                nil
                ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
                dotspacemacs-remap-Y-to-y$
                nil
                ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
                ;; there. (default t)
                dotspacemacs-retain-visual-state-on-shift
                t
                ;; If non-nil, J and K move lines up and down when in visual mode.
                ;; (default nil)
                dotspacemacs-visual-line-move-text
                nil
                ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
                ;; (default nil)
                dotspacemacs-ex-substitute-global
                nil
                ;; Name of the default layout (default "Default")
                dotspacemacs-default-layout-name
                "Default"
                ;; If non nil the default layout name is displayed in the mode-line.
                ;; (default nil)
                dotspacemacs-display-default-layout
                nil
                ;; If non nil then the last auto saved layouts are resume automatically upon
                ;; start. (default nil)
                dotspacemacs-auto-resume-layouts
                t
                ;; Size (in MB) above which spacemacs will prompt to open the large file
                ;; literally to avoid performance issues. Opening a file literally means that
                ;; no major mode or minor modes are active. (default is 1)
                dotspacemacs-large-file-size
                1
                ;; Location where to auto-save files. Possible values are `original' to
                ;; auto-save the file in-place, `cache' to auto-save the file to another
                ;; file stored in the cache directory and `nil' to disable auto-saving.
                ;; (default 'cache)
                dotspacemacs-auto-save-file-location
                'cache
                ;; Maximum number of rollback slots to keep in the cache. (default 5)
                dotspacemacs-max-rollback-slots
                5
                ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
                dotspacemacs-helm-resize
                nil
                ;; if non nil, the helm header is hidden when there is only one source.
                ;; (default nil)
                dotspacemacs-helm-no-header
                nil
                ;; define the position to display `helm', options are `bottom', `top',
                ;; `left', or `right'. (default 'bottom)
                dotspacemacs-helm-position
                'bottom
                ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
                ;; in all non-asynchronous sources. If set to `source', preserve individual
                ;; source settings. Else, disable fuzzy matching in all sources.
                ;; (default 'always)
                dotspacemacs-helm-use-fuzzy
                'always
                ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
                ;; several times cycle between the kill ring content. (default nil)
                dotspacemacs-enable-paste-transient-state
                nil
                ;; Which-key delay in seconds. The which-key buffer is the popup listing
                ;; the commands bound to the current keystroke sequence. (default 0.4)
                dotspacemacs-which-key-delay
                0.4
                ;; Which-key frame position. Possible values are `right', `bottom' and
                ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
                ;; right; if there is insufficient space it displays it at the bottom.
                ;; (default 'bottom)
                dotspacemacs-which-key-position
                'bottom
                ;; If non nil a progress bar is displayed when spacemacs is loading. This
                ;; may increase the boot time on some systems and emacs builds, set it to
                ;; nil to boost the loading time. (default t)
                dotspacemacs-loading-progress-bar
                t
                ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
                ;; (Emacs 24.4+ only)
                dotspacemacs-fullscreen-at-startup
                nil
                ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
                ;; Use to disable fullscreen animations in OSX. (default nil)
                dotspacemacs-fullscreen-use-non-native
                nil
                ;; If non nil the frame is maximized when Emacs starts up.
                ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
                ;; (default nil) (Emacs 24.4+ only)
                dotspacemacs-maximized-at-startup
                nil
                ;; A value from the range (0..100), in increasing opacity, which describes
                ;; the transparency level of a frame when it's active or selected.
                ;; Transparency can be toggled through `toggle-transparency'. (default 90)
                dotspacemacs-active-transparency
                90
                ;; A value from the range (0..100), in increasing opacity, which describes
                ;; the transparency level of a frame when it's inactive or deselected.
                ;; Transparency can be toggled through `toggle-transparency'. (default 90)
                dotspacemacs-inactive-transparency
                90
                ;; If non nil show the titles of transient states. (default t)
                dotspacemacs-show-transient-state-title
                t
                ;; If non nil show the color guide hint for transient state keys. (default t)
                dotspacemacs-show-transient-state-color-guide
                t
                ;; If non nil unicode symbols are displayed in the mode line. (default t)
                dotspacemacs-mode-line-unicode-symbols
                t
                ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
                ;; scrolling overrides the default behavior of Emacs which recenters point
                ;; when it reaches the top or bottom of the screen. (default t)
                dotspacemacs-smooth-scrolling
                t
                ;; Control line numbers activation.
                ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
                ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
                ;; This variable can also be set to a property list for finer control:
                ;; '(:relative nil
                ;;   :disabled-for-modes dired-mode
                ;;                       doc-view-mode
                ;;                       markdown-mode
                ;;                       org-mode
                ;;                       pdf-view-mode
                ;;                       text-mode
                ;;   :size-limit-kb 1000)
                ;; (default nil)
                dotspacemacs-line-numbers
                nil
                ;; Code folding method. Possible values are `evil' and `origami'.
                ;; (default 'evil)
                dotspacemacs-folding-method
                'evil
                ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
                ;; (default nil)
                dotspacemacs-smartparens-strict-mode
                nil
                ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
                ;; over any automatically added closing parenthesis, bracket, quote, etc…
                ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
                dotspacemacs-smart-closing-parenthesis
                nil
                ;; Select a scope to highlight delimiters. Possible values are `any',
                ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
                ;; emphasis the current one). (default 'all)
                dotspacemacs-highlight-delimiters
                'all
                ;; If non nil, advise quit functions to keep server open when quitting.
                ;; (default nil)
                dotspacemacs-persistent-server
                nil
                ;; List of search tool executable names. Spacemacs uses the first installed
                ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
                ;; (default '("ag" "pt" "ack" "grep"))
                dotspacemacs-search-tools
                '("ag" "pt" "ack" "grep")
                ;; The default package repository used if no explicit repository has been
                ;; specified with an installed package.
                ;; Not used for now. (default nil)
                dotspacemacs-default-package-repository
                nil
                ;; Delete whitespace while saving buffer. Possible values are `all'
                ;; to aggressively delete empty line and long sequences of whitespace,
                ;; `trailing' to delete only the whitespace at end of lines, `changed'to
                ;; delete only whitespace for changed lines or `nil' to disable cleanup.
                ;; (default nil)
                dotspacemacs-whitespace-cleanup
                nil))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq use-dialog-box nil))

(defun open-workspace ()
  (interactive)
  (spacemacs/layouts-transient-state/spacemacs/workspaces-transient-state/body-and-exit))
(defun rep ()
  (interactive)
  (evil-repeat 1))

(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
(defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "d" 'ediff-copy-both-to-C))

(defun better-exit ()
  (interactive)
  (persp-save-state-to-file)
  (spacemacs/frame-killer))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; (mapc #'evil-declare-change-repeat
  ;;       '(company-complete-mouse
  ;;         company-capf
  ;;         company-complete-number
  ;;         company-complete-selection
  ;;         company-complete-common
  ;;         ))

  ;; (mapc #'evil-declare-ignore-repeat
  ;;       '(company-abort
  ;;         company-select-next
  ;;         company-select-previous
  ;;         company-select-next-or-abort
  ;;         company-select-previous-or-abort
  ;;         company-select-mouse
  ;;         company-show-doc-buffer
  ;;         company-show-location
  ;;         company-search-candidates
  ;;         company-filter-candidates
  ;;         counsel-projectile-find-file
  ;;         ))
  (add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)
  (spacemacs/set-leader-keys "pg" nil)
  (spacemacs/set-leader-keys "qq" nil)
  (spacemacs/set-leader-keys "qq" 'better-exit)
  (setq-default c-basic-offset 4)
  (spacemacs/declare-prefix "pg" "git grep")
  (spacemacs/set-leader-keys "pgg" 'grep-whole-git
    "pgs" 'grep-whole-git-struct "pgf" 'grep-whole-git-fn)
  (spacemacs/set-leader-keys "fs" 'save-buffer-always
    "o" 'open-workspace)
  (global-eldoc-mode -1)
  ;; (with-eval-after-load 'rust
  ;; (remove-hook 'rust-mode-hook '(racer-mode eldoc-mode))
  ;; )
  (setq helm-grep-ag-command "rg --smart-case --no-heading --line-number %s %s %s --color=always")
  (setq-default projectile-enable-caching t)
  (setq-default global-auto-revert-mode t)
  (setq-default evil-surround-pairs-alist (cons '(?\( . ("(" . ")"))
                                                evil-surround-pairs-alist))
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  ;;(setq flycheck-navigation-minimum-level "Errors")
  (setq x86-lookup-pdf "~/asm-ref.pdf")
  (setq auto-save-default nil)
  (setq-default x86-lookup-pdf "~/asm-ref.pdf"
                tab-always-indent nil browse-url-browser-function
                'browse-url-generic browse-url-generic-program
                "firefox" company-idle-delay nil powerline-default-separator
                'arrow)
  (mapc #'evil-declare-abort-repeat
        '(save-buffer-always save-switch-buffer helm-M-x counsel-M-x next-error flycheck-next-error swiper
                             rep))
  ;; (define-key evil-insert-state-map (kbd "TAB") nil)
  ;;(define-key evil-insert-state-map (kbd "C-SPC") 'company-capf)
  (define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
  ;;(define-key helm-command (kbd "TAB") nil)
  ;; (define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
  ;;(define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
  (define-key evil-insert-state-map (kbd "C-s") #'save-switch-normal)
  ;;(define-key evil-insert-state-map (kbd "<escape>") 'evil-escape)
  ;(define-key evil-insert-state-map (kbd "RET") 'evil-ret)
  (define-key evil-normal-state-map (kbd "C-s") 'save-buffer-always)
  ;;(define-key evil-normal-state-map (kbd ".") 'rep)
  ;; (define-key evil-normal-state-map (kbd "<tab>") 'next-buffer)
  ;; (define-key evil-normal-state-map (kbd "<C-tab>") 'previous-buffer)
  (define-key evil-normal-state-map (kbd "<dead-circumflex>") 'evil-first-non-blank))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5310b88333fc64c0cb34a27f42fa55ce371438a55f02ac7a4b93519d148bd03d" default)))
 '(org-agenda-files (quote ("~/projects/breeze/TODOs.org")))
 '(package-selected-packages
   (quote
    (ghub let-alist web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode lua-mode omnisharp shut-up csharp-mode powerline ranger spinner ox-reveal org-category-capture hydra parent-mode request gitignore-mode gh marshal logito pcache ht flyspell-correct seq pos-tip flx git-commit iedit anzu goto-chg undo-tree f s memoize font-lock+ diminish autothemer projectile pkg-info epl bind-map bind-key packed auctex async auto-complete popup web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data lsp-rust phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode all-the-icons smartparens highlight evil flycheck yasnippet company helm helm-core avy markdown-mode org-plus-contrib magit magit-popup with-editor rust-mode lsp-mode x86-lookup nasm-mode stickyfunc-enhance srefactor disaster company-c-headers cmake-mode clang-format org-projectile org-present org-pomodoro alert log4e gntp org-download htmlize gnuplot glsl-mode company-glsl helm-git-grep wgrep smex ivy-hydra flyspell-correct-ivy counsel-projectile counsel swiper ivy zonokai-theme zenburn-theme zen-and-art-theme yaml-mode xterm-color ws-butler winum which-key volatile-highlights vimrc-mode uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toml-mode toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle shell-pop seti-theme reverse-theme restart-emacs rainbow-delimiters railscasts-theme racer purple-haze-theme professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox orgit organic-green-theme org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow magit-gh-pulls madhat2r-theme macrostep lush-theme lorem-ipsum linum-relative link-hint light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md gandalf-theme fuzzy flyspell-correct-helm flycheck-rust flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump dracula-theme doom-themes django-theme define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cyberpunk-theme company-statistics company-auctex column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode cherry-blossom-theme cargo busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(projectile-project-root-files-bottom-up
   (quote
    (".projectile" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" "Cargo.toml")))
 '(projectile-project-root-files-top-down-recurring (quote (".svn" "CVS" "Makefile" ".git" "Cargo.toml"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5310b88333fc64c0cb34a27f42fa55ce371438a55f02ac7a4b93519d148bd03d" default)))
 '(org-agenda-files (quote ("~/projects/breeze/TODOs.org")))
 '(package-selected-packages
   (quote
    (overseer nameless google-c-style lua-mode omnisharp shut-up csharp-mode powerline ranger spinner ox-reveal org-category-capture hydra parent-mode request gitignore-mode gh marshal logito pcache ht flyspell-correct seq pos-tip flx git-commit iedit anzu goto-chg undo-tree f s memoize font-lock+ diminish autothemer projectile pkg-info epl bind-map bind-key packed auctex async auto-complete popup web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data lsp-rust phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode all-the-icons smartparens highlight evil flycheck yasnippet company helm helm-core avy markdown-mode org-plus-contrib magit magit-popup with-editor rust-mode lsp-mode x86-lookup nasm-mode stickyfunc-enhance srefactor disaster company-c-headers cmake-mode clang-format org-projectile org-present org-pomodoro alert log4e gntp org-download htmlize gnuplot glsl-mode company-glsl helm-git-grep wgrep smex ivy-hydra flyspell-correct-ivy counsel-projectile counsel swiper ivy zonokai-theme zenburn-theme zen-and-art-theme yaml-mode xterm-color ws-butler winum which-key volatile-highlights vimrc-mode uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toml-mode toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle shell-pop seti-theme reverse-theme restart-emacs rainbow-delimiters railscasts-theme racer purple-haze-theme professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox orgit organic-green-theme org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow magit-gh-pulls madhat2r-theme macrostep lush-theme lorem-ipsum linum-relative link-hint light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md gandalf-theme fuzzy flyspell-correct-helm flycheck-rust flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump dracula-theme doom-themes django-theme define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cyberpunk-theme company-statistics company-auctex column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode cherry-blossom-theme cargo busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(projectile-project-root-files-bottom-up
   (quote
    (".projectile" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" "Cargo.toml")))
 '(projectile-project-root-files-top-down-recurring (quote (".svn" "CVS" "Makefile" ".git" "Cargo.toml"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
