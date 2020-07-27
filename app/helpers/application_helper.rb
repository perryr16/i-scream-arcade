module ApplicationHelper
  def cache_key_for(model_class, label = "")
    prefix = model_class.to_s.downcase
    count = model_class.count
    max_updated = model_class.maximum(:updated_at)
    [prefix, label, count, max_updated].join("_")
  end
end
