module ArticlesHelper

  def article_format_date (datetime)
    raw datetime.to_date.to_formatted_s(:long)
  end
end
