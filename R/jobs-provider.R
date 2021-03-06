#' JobProvider
#'
#' @export
#' @keywords internal
#' @param locale (character) the locale to use. See
#' `job_provider_locales` for locales supported (default: en_US)
#' @details
#' **Methods**
#'
#' - `render()` - Make a job
#'
#' @format NULL
#' @usage NULL
#' @examples
#' z <- JobProvider$new()
#' z$render()
#'
#' z <- JobProvider$new(locale = "fr_FR")
#' z$locale
#' z$render()
#'
#' z <- JobProvider$new(locale = "hr_HR")
#' z$locale
#' z$render()
#'
#' z <- JobProvider$new(locale = "fa_IR")
#' z$locale
#' z$render()
JobProvider <- R6::R6Class(
  inherit = BaseProvider,
  'JobProvider',
  public = list(
    locale = NULL,
    formats = NULL,

    initialize = function(locale = NULL) {
      if (!is.null(locale)) {
        # check locale globally supported
        super$check_locale(locale)
        # check job provider locales
        check_locale_(locale, job_provider_locales)
        self$locale <- locale
      } else {
        self$locale <- 'en_US'
      }
      self$formats <- parse_eval("job_formats_", self$locale)
    },

    render = function() {
      super$random_element(self$formats)
    }
  )
)

#' @export
#' @rdname JobProvider
job_provider_locales <- c(
  "da_DK", "fa_IR", "fr_CH", "uk_UA", "ru_RU", "pl_PL",
  "en_US", "fr_FR", "hr_HR", "zh_TW", "fi_FI"
)
