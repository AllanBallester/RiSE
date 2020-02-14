class ApplicationMailer < ActionMailer::Base
  default from: 'Rise<hi@risehomeless.com>'
  layout 'mailer'

 def default_url_options(options = {})
   options.tap do |o|
     locale = o[:locale] || I18n.locale
     o[:locale] = locale_params(locale)
     o[:host] = ActionMailer::Base.default_url_options[:host]
   end
 end

 def locale_params(locale)
   locale == I18n.default_locale ? nil : locale
 end

end
