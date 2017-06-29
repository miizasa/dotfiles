;; eww設定

;; 検索エンジンをGoogleに変更
(setq eww-search-prefix "http://www.google.co.jp/search?q=")

;; キーバインド追加
;N (eww-next-url)
;P (eww-previous-url)
;l (eww-back-url)
;r (eww-forward-url)
;H (eww-list-histories)
;& (eww-browse-with-external-browser)
;b (eww-add-bookmark)
;B (eww-list-bookmarks)
;q (quit-window)
(define-key eww-mode-map "r" 'eww-reload)
(define-key eww-mode-map "c 0" 'eww-copy-page-url)
(define-key eww-mode-map "p" 'scroll-down)
(define-key eww-mode-map "n" 'scroll-up)
