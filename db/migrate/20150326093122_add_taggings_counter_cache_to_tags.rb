class AddTaggingsCounterCacheToTags < Rails.version < '5.1' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  def self.up
    Redmineup::Tag.reset_column_information
    Redmineup::Tag.find_each do |tag|
      Redmineup::Tag.reset_counters(tag.id, :taggings)
    rescue
      next
    end
  end

  def self.down
  end
end
