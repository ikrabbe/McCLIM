(in-package :mcclim-fontconfig)

(cffi:define-foreign-library libfontconfig
  (:unix "libfontconfig.so"))

(cffi:use-foreign-library libfontconfig)

(cffi:defcfun ("FcInitLoadConfig" fc-init-load) :pointer)
(cffi:defcfun ("FcInitLoadConfigAndFonts" fc-init-load-config-and-fonts) :pointer)
(cffi:defcfun ("FcGetVersion" fc-get-version) :int)
(cffi:defcfun ("FcInitReinitialize" fc-init-reinitialize) fc-bool)
(cffi:defcfun ("FcInitBringUptoDate" fc-init-bring-up-to-date) fc-bool)
(cffi:defcfun ("FcConfigHome" fc-config-home) :pointer)
(cffi:defcfun ("FcConfigSubstitute" fc-config-substitute) fc-bool
  (config :pointer)
  (pattern :pointer)
  (kind fc-match-kind))

(cffi:defcfun ("FcDefaultSubstitute" fc-default-substitute) :void
  (pattern :pointer))
(cffi:defcfun ("FcNameParse" fc-name-parse) :pointer
  (name :pointer))
(cffi:defcfun ("FcNameUnparse" fc-name-unparse) :pointer
  (pattern :pointer))

(cffi:defcfun ("FcPatternCreate" fc-pattern-create) :pointer)
#+nil
(cffi:defcfun ("FcPatternAdd" fc-pattern-add) fc-bool
  (pattern :pointer)
  (object :string)
  (value (:struct fc-value))
  (append fc-bool))
(cffi:defcfun ("FcPatternAddString" fc-pattern-add-string) fc-bool
  (pattern :pointer)
  (object :string)
  (value :pointer))
(cffi:defcfun ("FcPatternAddInteger" fc-pattern-add-integer) fc-bool
  (pattern :pointer)
  (object :string)
  (value :int))
(cffi:defcfun ("FcPatternAddBool" fc-pattern-add-bool) fc-bool
  (pattern :pointer)
  (object :string)
  (value fc-bool))
(cffi:defcfun ("FcPatternDestroy" fc-pattern-destroy) :void
  (pattern :pointer))
(cffi:defcfun ("FcPatternPrint" fc-pattern-print) :void
  (pattern :pointer))
(cffi:defcfun ("FcPatternGet" fc-pattern-get) fc-result
  (pattern :pointer)
  (object :string)
  (id :int)
  (value (:pointer (:struct fc-value))))

(cffi:defcfun ("FcFontSetCreate" fc-font-set-create) :pointer)
(cffi:defcfun ("FcFontSetDestroy" fc-font-set-destroy) :void)
(cffi:defcfun ("FcFontMatch" fc-font-match) :pointer
  (config :pointer)
  (pattern :pointer)
  (result (:pointer fc-result)))
(cffi:defcfun ("FcFontSetList" fc-font-set-list) :pointer
  (config :pointer)
  (font-set :pointer)
  (num-sets :int)
  (pattern :pointer)
  (object-set :pointer))

(cffi:defcfun ("FcObjectSetCreate" fc-object-set-create) :pointer)
(cffi:defcfun ("FcObjectSetDestroy" fc-object-set-destroy) :void
  (object-set :pointer))
(cffi:defcfun ("FcObjectSetAdd" fc-object-set-add) fc-bool
  (object-set :pointer)
  (object :string))

(cffi:defcfun ("FcFontList" fc-font-list) (:pointer (:struct fc-font-set))
  (config :pointer)
  (pattern :pointer)
  (object-set :pointer))

(cffi:defcfun ("FcCharSetCreate" fc-char-set-create) :pointer)
(cffi:defcfun ("FcCharSetDestroy" fc-char-set-destroy) :void
  (char-set :pointer))
(cffi:defcfun ("FcCharSetCount" fc-char-set-count) fc-char32
  (char-set :pointer))
(cffi:defcfun ("FcCharSetFirstPage" fc-char-set-first-page) fc-char32
  (char-set :pointer)
  (map (:pointer fc-char32))
  (next (:pointer fc-char32)))
(cffi:defcfun ("FcCharSetNextPage" fc-char-set-next-page) fc-char32
  (char-set :pointer)
  (map (:pointer fc-char32))
  (next (:pointer fc-char32)))
