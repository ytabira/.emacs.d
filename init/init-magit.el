(require 'magit)

;; cursorが載っていない状態でのaddedのface
(set-face-foreground 'magit-diff-added "#00FF00")
(set-face-background 'magit-diff-added "#000000")
;; cursorが載っている状態のaddedのface
(set-face-foreground 'magit-diff-added-highlight "#00FF00")
(set-face-background 'magit-diff-added-highlight "gray20")
;; cursor載っていない状態のremoved
(set-face-foreground 'magit-diff-removed "#FF0000")
(set-face-background 'magit-diff-removed "#000000")
;; cursor載っている状態のremoved
(set-face-foreground 'magit-diff-removed-highlight "#FF0000")
(set-face-background 'magit-diff-removed-highlight "gray20")
;; lineを選択してstageしようとするときのface
(set-face-background 'magit-diff-lines-boundary "blue")
