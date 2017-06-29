;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)

;; バックアップファイルを作成させない
(setq make-backup-files nil)

;; 終了時にオートセーブファイルを削除する
(setq delete-auto-save-files t)

;; "yes or no" の選択を "y or n" にする
(fset 'yes-or-no-p 'y-or-n-p)


;;日本語入力関連
;(require 'skk-setup)
;; これは必要？いらないっぽい？skk-setupだけで良いっぽいぞ
;;(require 'skk-autoloads)
;; この入力に慣れる感じで頑張れば良いのかねぇ
;; これはこれで入力しやすいのかもしれないなぁ
;; C-jの機能を別のキーに割当
;(global-set-key (kbd "C-m") 'newline-and-indent)
;; C-\でもSKKに切り替えられるように設定
(setq default-input-method "japanese-skk")
;; 送り仮名が厳密に正しい候補を優先して表示
;(setq skk-henkan-strict-okuri-precedence t)
;; 漢字登録時、送り仮名が厳密に正しいかをチェック
;(setq skk-check-okurigana-on-toroku t)
;; テーマ設定
(require 'color-theme)
(color-theme-initialize)
(color-theme-hober)

(require 'elscreen)


;; 背景透過
(set-frame-parameter nil 'alpha 80)

;; 現在行に色をつける
(global-hl-line-mode 1)

;; 履歴を次回Emacs起動時にも保存する
(savehist-mode 1)


;;(define-key global-map (kbd "C-t") 'yas/expand)
;(define-key global-map (kbd "C-t") 'yas/insert-snippet)


;; 矩形選択変更 (terminalでは利かない？)
;;(require 'sense-region)
;;(sense-region-on)
;(cua-mode t)
;(setq cua-enable-cua-keys nil)
;(define-key global-map (kbd "C-q") 'cua-set-rectangle-mark)

;; snippet展開はC-t c
;(define-key global-map (kbd "C-t") 'ac-complete-yasnippet)
 
;; 行番号・桁番号を表示する
(global-linum-mode 1)
(column-number-mode 1)



;; 日本語infoの文字化け防止
;(auto-compression-mode t)
;;(setq coding-system-for-read 'euc-jp)

;;(add-to-list 'Info-directory "~/.emacs.d/info")


;; 範囲指定に色付け
(setq transient-mark-mode t)


;; 桁ハイライト設定
(require 'col-highlight)
;; 1,2どちらか選ぶ
;; 1,常にハイライト
; (column-highlight-mode 1)
;; 2,放置するとハイライト
(toggle-highlight-column-when-idle 1)
(col-highlight-set-interval 6)		; ハイライトの秒数

;; フォント設定
(set-face-attribute 'default nil
                    :family "Ricty"
                    :height 140)


;; タブ設定
(setq-default tab-width 4 indent-tabs-mode nil)

;; 対応する括弧を光らせる
(setq show-parent-mode 1)
(show-paren-mode 1)

;; 全角スペースとタブを可視化
(defface my-face-b-1 '((t (:background "gray"))) nil)
(defface my-face-b-2 '((t (:background "gray26"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     ;;("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; モードラインに時刻を表示する
(display-time)

;; メニューバーを消す
(menu-bar-mode -1)

;; スペース、タブなどを可視化する
;(global-whitespace-mode 1)

;; recentf-ext
(setq recentf-max-saved-items 3000)
(require 'recentf-ext)


;; color-moccur 設定
(when (require 'color-moccur nil t)
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  (setq moccur-split-word t)
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  (require 'moccur-edit nil t)
  (when (and (executable-find "cmigemo")
	     (require 'migemo nil t))
    (setq moccur-use-migeo t)))

;; grep-edit 設定
(require 'grep-edit)
