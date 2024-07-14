defmodule Helpers.Link do
  @moduledoc """
  This helper provides a simpler syntax for representing
  links, optimised for links to commonly used websites.
  Inspired by Wikipedia's link syntax, like
  `[[bla bla| horem]]`.

  ### Grammer of link

  The format of the link like this:

  `[[shortname_of_the_page | Lorem ipsum dolor sit amet]]`

  where `|` is preceded by an identifier pointing to the
  corresponding link and followed by your description of
  the link, where the latter part can be included in double
  quotes (it is better to add `\\` before it to escaping
  if the description contains double quotes).

  Unlike Markdown's syntax, double square brackets are
  chosen for link identifiers in my website. Though first
  sourced from the wiki, I learnt it from Obsidian's
  bi-directional links.

  ### Sites

  It applies to two scenarios, one of which is a link to a
  page or resource within the site.

  For this case, the generally applicable syntax is:

  `[[:{resource_id}|{description}]]`

  It can be found that the previous part starts with a
  colon in the link. If it was any other site it wouldn't
  be like this at all.

  If it's pointing to another site, then the link will be
  more varied, but it will still generally fit the format
  at previous, with the only difference being that it starts
  with a letter (usually the name of the site).

  The whole syntax is:

  `[[{sitename_site_with_id}:{extra_info}|{description}]]`

  where `extra_info` is optional.

  Websites we can currently parse include:

  - Acfun[WIP]
    - `[[ac41|Nihilum公会全1-球FD伊利丹视频]]`
  - Bilibili[WIP]
    - AV-format `[[av170001|【MV】保加利亚妖王AZIS视频合辑]]`
    - BV-format `[[BV17x411w7KC|【MV】保加利亚妖王AZIS视频合辑]]`
  - Niconico[WIP]
    - `[[sm666|N站上某经典猎奇向内容]]`
  - YouTube[WIP]
    - `[[youtube:watch=jNQXAC9IVRw|Me at the zoo]]`
  - Douyin[WIP]
    - `[[douyin:7368339612520942911|有好看的小姐姐捏]]`
  - Tiktok[WIP]
  - XHS[WIP]
  - Tieba[WIP]
  - Zhihu[WIP]
    - Question
    - Answer
    - Essay
  - Github[WIP]
  - Gitlab[WIP]
  - Twitter(X)[WIP]
  - ...

  ### Convert

  In brief, it will did
  `fn site, desp -> "[\#{desp}](\#{site})" end`.
  """

  @type t :: %__MODULE__{
    site: String.t(),
    segment: String.t() | nil,
    identifier: String.t(),
    description: String.t()
  }
  defstruct [:site, :segment, :identifier, :description]

  # TODO: Add properties
  # - loc: china/oversea
  # - accessable: ok/disrupted/blocked
  # - status: ok/in_problem
  # - regex_pattern: ~r/.../
  @allowed_sites [
    ## This site
    # e.g.
    # [[:HH-Model-story|"从膜片钳到诺贝尔奖： Hodgkin-Huxley 模型的故事"]]
    self: %{loc: :oversea, acc: :ok, status: :ok, r: ~r/^:+$/},

    ## Extra site
    #:acfun,
    #:bilibili,
    #:deviantart,
    #:douyin,
    #:facebook,
    #:github,
    #:gitlab,
    #:instagram,
    #:kuaishou,
    #:niconico,
    #:pixiv,
    #:tieba,
    #:tiktok,
    #:twitter,
    #:x,
    #:xiaohongshu,
    #:youtube,
    #:zhihu

    # :douban,
    # :qzone,
    # :discord,
    # :steam,
    # ...
  ]

  @spec returnallsites() :: atom()
  def returnallsites(), do:
    @allowed_sites
    |> Enum.map(fn {site, _} -> site end)
end

defmodule Helpers.Link.Parser do
  # Parse prev part of link.

  # Pattern
end

defmodule Helpers.Link.Site do
  @callback tolink(raw_content :: %Helpers.Link{}) ::
              {:ok, link :: String.t()} | {:error, reason :: String.t()}
end
