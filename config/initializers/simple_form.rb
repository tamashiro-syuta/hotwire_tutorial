SimpleForm.setup do |config|
  # Wrappers configration (formで:defaultを指定した際の設定)
  config.wrappers :default, class: "form__group" do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: "visually-hidden"
    b.use :input, class: "form__input", error_class: "form__input--invalid"
  end
  # Quoteで f.input :name を指定した場合、以下のHTMLが生成される
  # <div class="form__group">
  #   <label class="visually-hidden" for="quote_name">
  #     Name
  #   </label>
  #   <input class="form__input" type="text" name="quote[name]" id="quote_name">
  # </div>

  # Default configuration
  config.generate_additional_classes_for = []
  # ラッパーを指定しなかった場合は、:default が適用される
  config.default_wrapper                 = :default
  config.button_class                    = "btn"
  config.label_text                      = lambda { |label, _, _| label }
  config.error_notification_tag          = :div
  config.error_notification_class        = "error_notification"
  config.browser_validations             = false
  config.boolean_style                   = :nested
  config.boolean_label_class             = "form__checkbox-label"
end