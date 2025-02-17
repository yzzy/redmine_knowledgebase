module RedmineKnowledgebase
  def self.to_prepare
    Redmine::Activity.register :kb_articles
    Redmine::Search.available_search_types << 'kb_articles'
  end
end

if Rails.try(:autoloaders).try(:zeitwerk_enabled?)
  RedmineKnowledgebase::Macros
  RedmineKnowledgebase::Hooks::BaseHtmlHook
  RedmineKnowledgebase.to_prepare
else
  require 'redmine'
  require 'redmine_knowledgebase/macros'
  require 'redmine_knowledgebase/concerns/knowledgebase_project_extension'
  require 'redmine_knowledgebase/helpers/knowledgebase_link_helper'
  require 'redmine_knowledgebase/helpers/knowledgebase_settings_helper'
  require 'redmine_knowledgebase/hooks/base_html_hook'
  Rails.configuration.to_prepare do
    RedmineKnowledgebase.to_prepare
  end
end

Project.send :include, RedmineKnowledgebase::Concerns::KnowledgebaseProjectExtension
SettingsHelper.send :include, RedmineKnowledgebase::Helpers::KnowledgebaseSettingsHelper
ApplicationHelper.send :include, Redmineup::TagsHelper
