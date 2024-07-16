import Config

## Site
config :site,
  name: "Chestnut🌰",
  subname: nil,
  description: "个人网站",
  lang: "zh-CN",  # same as default_locale in Chestnut.Gettext
  timezone: "Asia/Shanghai",
  url: "https://chestnut.moe",
  repo: "https://github.com/GES233/ChestnutSite"

## TODO

## Content

# Article
config :site, :article,
  # Writing
  default_status: :draft,
  default_tags: [],
  default_id: :name
  # Showing
  # TODO
  # :visit_count
  # :toc
  # :comment
  # :footnote
  # :bib

# Organise(tag and category)
# TODO

# Index(link, page and search)
# TODO

## Some sentitive settings should be set in envvars.
if config_env() == :prod do
  # ...
end
