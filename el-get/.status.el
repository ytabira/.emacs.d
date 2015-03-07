((Enhanced-Ruby-Mode status "installed" recipe
		     (:name Enhanced-Ruby-Mode :description "Major mode for editing Ruby files" :type github :pkgname "zenspider/enhanced-ruby-mode"))
 (anything-rurima status "installed" recipe
		  (:name anything-rurima :after nil :auto-generated t :type emacswiki :description "Look up Japanese Ruby Reference Manual with anything.el" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/anything-rurima.el"))
 (auto-complete status "installed" recipe
		(:name auto-complete :after nil :features
		       (auto-complete-config)
		       :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)
		       :post-init
		       (progn
			 (add-to-list 'ac-dictionary-directories
				      (expand-file-name "dict" default-directory))
			 (ac-config-default))))
 (auto-complete-ruby status "installed" recipe
		     (:name auto-complete-ruby :after nil :description "Auto-complete sources for Ruby" :type http :url "http://www.cx4a.org/pub/auto-complete-ruby.el" :depends
			    (auto-complete)))
 (cl-lib status "installed" recipe
	 (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (dired-xattr status "installed" recipe
	      (:name dired-xattr :after nil :type github :description "Handle MacOSX Finder color label in dired." :pkgname "renard/dired-xattr" :depends htmlize))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:features el-get :post-init
		(when
		    (memq 'el-get
			  (bound-and-true-p package-activated-list))
		  (message "Deleting melpa bootstrap el-get")
		  (unless package--initialized
		    (package-initialize t))
		  (when
		      (package-installed-p 'el-get)
		    (let
			((feats
			  (delete-dups
			   (el-get-package-features
			    (el-get-elpa-package-directory 'el-get)))))
		      (el-get-elpa-delete-package 'el-get)
		      (dolist
			  (feat feats)
			(unload-feature feat t))))
		  (require 'el-get))))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (git-modes status "installed" recipe
	    (:name git-modes :description "GNU Emacs modes for various Git-related files" :type github :pkgname "magit/git-modes"))
 (htmlize status "installed" recipe
	  (:type github :pkgname "emacsmirror/htmlize" :name htmlize :website "http://www.emacswiki.org/emacs/Htmlize" :description "Convert buffer text and decorations to HTML." :type emacsmirror :localname "htmlize.el"))
 (inf-ruby status "installed" recipe
	   (:name inf-ruby :description "Inferior Ruby Mode - ruby process in a buffer." :type github :pkgname "nonsequitur/inf-ruby"))
 (japanese-holidays status "installed" recipe
		    (:name japanese-holidays :after nil :description "calendar functions for the Japanese calendar" :website "https://github.com/emacs-jp/japanese-holidays" :type github :pkgname "emacs-jp/japanese-holidays"))
 (magit status "installed" recipe
	(:name magit :after nil :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :depends
	       (cl-lib git-modes)
	       :info "." :compile "magit.*.el\\'" :build
	       `(("make" "docs"))
	       :build/berkeley-unix
	       (("gmake" "docs"))
	       :build/windows-nt
	       (progn nil)))
 (magit-gitflow status "installed" recipe
		(:name magit-gitflow :after nil :description "GitFlow plugin for magit.el" :type github :depends
		       (magit)
		       :pkgname "jtatarik/magit-gitflow"))
 (maxframe status "installed" recipe
	   (:name maxframe :after nil :description "Maxframe provides the ability to maximize the emacs frame and stay within the display resolution." :type github :pkgname "rmm5t/maxframe.el" :prepare
		  (progn
		    (autoload 'maximize-frame "maxframe" "Maximizes the frame to fit the display if under a windowing\nsystem." t)
		    (autoload 'restore-frame "maxframe" "Restores a maximized frame.  See `maximize-frame'." t))))
 (mew status "installed" recipe
      (:name mew :after nil :description "Mew is a mail reader for Emacs" :type git :url "https://github.com/kazu-yamamoto/Mew.git" :prepare
	     (progn
	       (setq mew-prog-mewl
		     (concat default-directory "bin/mewl"))
	       (setq mew-prog-mime-encode
		     (concat default-directory "bin/mewencode"))
	       (setq mew-prog-mime-decode
		     (concat default-directory "bin/mewencode"))
	       (setq mew-prog-cmew
		     (concat default-directory "bin/cmew"))
	       (setq mew-prog-est-update
		     (concat default-directory "bin/mewest"))
	       (setq mew-prog-smew
		     (concat default-directory "bin/smew"))
	       (setq mew-mbox-command
		     (concat default-directory "bin/incm")))
	     :build
	     `(("./configure" ,(concat "--with-emacs=" el-get-emacs))
	       "make")))
 (popup status "installed" recipe
	(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (rbenv status "installed" recipe
	(:name rbenv :description "Emacs integration for rbenv" :type github :pkgname "senny/rbenv.el" :compile "rbenv.el"))
 (robe-mode status "installed" recipe
	    (:name robe-mode :after nil :type github :description "Code navigation, documentation lookup and completion for Ruby" :pkgname "dgutov/robe" :website "https://github.com/dgutov/robe" :depends
		   (inf-ruby)
		   :post-init
		   (add-hook 'ruby-mode-hook 'robe-mode)))
 (rspec-mode status "installed" recipe
	     (:name rspec-mode :after nil :features
		    (rspec-mode)
		    :description "Enhance ruby-mode for RSpec" :type github :pkgname "pezra/rspec-mode"))
 (ruby-block status "installed" recipe
	     (:name ruby-block :after nil :type http :url "https://raw.github.com/emacsmirror/emacswiki.org/master/ruby-block.el" :description "highlight matching block"))
 (ruby-end status "installed" recipe
	   (:name ruby-end :after nil :features
		  (ruby-end)
		  :description "Emacs minor mode for automatic insertion of end blocks for Ruby" :type http :url "https://github.com/rejeep/ruby-end/raw/master/ruby-end.el"))
 (ruby-mode status "installed" recipe
	    (:name ruby-mode :after nil :builtin "24" :type http :description "Major mode for editing Ruby files." :url "http://bugs.ruby-lang.org/projects/ruby-trunk/repository/raw/misc/ruby-mode.el"))
 (skype status "installed" recipe
	(:name skype :description "Skype UI for emacs users." :type github :pkgname "buzztaiki/emacs-skype" :features skype))
 (smart-newline status "installed" recipe
		(:name smart-newline :after nil :description "The smart-newline.el provide a stress-less newline command for programmer." :type github :pkgname "ainame/smart-newline.el"))
 (yasnippet status "installed" recipe
	    (:name yasnippet :after nil :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
		   (("git" "submodule" "update" "--init" "--" "snippets")))))
