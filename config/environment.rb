# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# 記号（ < と > ）も入るので不要なら消す。
WillPaginate::ViewHelpers.pagination_options[:previous_label] = '&lt 前へ'
WillPaginate::ViewHelpers.pagination_options[:next_label] = '次へ &gt'
