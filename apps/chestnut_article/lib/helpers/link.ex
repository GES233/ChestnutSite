defmodule Helpers.Link do
  @moduledoc """
  This helper provides a simpler syntax for representing
  links, optimised for links to commonly used websites.
  Inspired by Wikipedia's link syntax, like
  `[[bla bla| horem]]`.

  ### Format of link

  The format of the link like this:

  `[[shortname_of_the_page | Lorem ipsum dolor sit amet]]`

  or simply:

  `[[page_link]]`

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

  `[[{sitename_or_identifire}:{resource_id}|{description}]]`

  where `resource_id` is the identifier of the resource
  on the site if the part before comma is only a site,
  and `description` is the description of the link.

  where `extra_info` is optional.

  Websites we can currently parse include:

  - Acfun[WIP]
    - `[[ac41|Nihilum公会全1-球FD伊利丹视频]]`
  - Bilibili
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
          # like acfun or bili
          site: String.t() | nil,
          segment: String.t() | nil,
          identifier: String.t(),
          description: String.t()
        }
  defstruct [:site, :segment, :identifier, :description]

  @link_regex ~r/^\[\[(?<link>.*)\|(?<description>.*)\]\]$/
  # e.g. ...就是大名鼎鼎的 [[av10492]] （视频已经被删除）。
  @link_regex2 ~r/^\[\[(?<link>.*)\]\]$/

  @doc """
  Return true if the link is valid.
  """
  def valid?(link) when is_binary(link) do
    link =~ @link_regex || link =~ @link_regex2
  end

  def valid?(_), do: false

  def getdescription(link) when is_binary(link) do
    # TODO: remove double quotes if has.
    Regex.named_captures(@link_regex, link)["description"]
    || Regex.named_captures(@link_regex2, link)["link"]
  end

  def getdescription(_), do: nil

  def getlink(link) when is_binary(link) do
    Regex.named_captures(@link_regex, link)["link"]
    || Regex.named_captures(@link_regex2, link)["link"]
  end

  def getlink(_), do: nil

  # TODO: Add properties
  # - loc: china/oversea
  # - accessable: ok/disrupted/blocked
  # - status: ok/bad
  @allowed_sites [
    ## This site
    self: %{loc: :oversea, acc: :ok, status: :ok},

    ## Extra site
    acfun: %{loc: :china, acc: :ok, status: :ok},
    bilibili: %{loc: :china, acc: :ok, status: :ok},
    deviantart: %{loc: :oversea, acc: :blocked, status: :ok},
    douyin: %{loc: :china, acc: :ok, status: :ok},
    facebook: %{loc: :oversea, acc: :blocked, status: :ok},
    github: %{loc: :oversea, acc: :disrupted, status: :ok},
    gitlab: %{loc: :oversea, acc: :disrupted, status: :ok},
    instagram: %{loc: :oversea, acc: :blocked, status: :ok},
    kuaishou: %{loc: :china, acc: :ok, status: :ok},
    niconico: %{loc: :oversea, acc: :blocked, status: :bad},
    pixiv: %{loc: :oversea, acc: :blocked, status: :ok},
    tieba: %{loc: :china, acc: :ok, status: :ok},
    tiktok: %{loc: :oversea, acc: :blocked, status: :ok},
    twitter: %{loc: :oversea, acc: :blocked, status: :ok},
    x: %{loc: :oversea, acc: :blocked, status: :ok},
    xiaohongshu: %{loc: :china, acc: :ok, status: :ok},
    youtube: %{loc: :oversea, acc: :blocked, status: :ok},
    zhihu: %{loc: :china, acc: :ok, status: :ok}

    # May append in future.
    # :douban,
    # :qzone,
    # :discord,
    # :steam,
    # ...
  ]

  @spec returnallsites() :: list(atom())
  def returnallsites(),
    do:
      @allowed_sites
      |> Enum.map(fn {site, _} -> site end)
end

defmodule Helpers.Link.Parser do
  # Parse prev part of link.

  # 1. content -> links

  # 2. valid check

  # Pattern
end

defmodule Helpers.Link.Site do
  @moduledoc """
  ...
  """
  alias Helpers.Link

  @callback parse_site_identifire(link :: String.t()) ::
              {segment :: String.t(), identifier :: String.t()} |
              {:error, reason :: atom()}

  @callback sitename() :: atom()

  @doc """
  ...
  """
  @callback tolink(link_body :: %Helpers.Link{}) ::
              {:ok, link :: String.t()} | {:error, reason :: atom()}

  @doc """
  Enables the parsed string to be processed to the appropriate object.
  """
  @spec tomap(raw_content :: String.t(), module :: module()) ::
              {:ok, %Helpers.Link{}} | {:error, reason :: atom()}
  def tomap(raw_content, module) do
    case Link.valid?(raw_content) do
      false ->
        {:error, :invalid_link}

      true ->
        link = Link.getlink(raw_content)
        description = Link.getdescription(raw_content)

        res = apply(module, :parse_site_identifire, [link])
        sitename = apply(module, :sitename, [])

        case res do
          {:error, reason} ->
            {:error, reason}

          {segment, identifier} ->
            {:ok,
             %Link{
               site: sitename,
               segment: segment,
               identifier: identifier,
               description: description
             }}
        end
    end
  end

  @spec valid_site?(link :: String.t(), module :: module()) :: boolean()
  def valid_site?(link, module) do
    res = apply(module, :parse_site_identifire, [link])
    case res do
      {:error, _} -> false
      _ -> true
    end
  end
end

defmodule Helpers.Link.Site.ChestnutSite do
  @moduledoc """
  To local site.

  e.g.
  [[:HH-Model-story|"从膜片钳到诺贝尔奖： Hodgkin-Huxley 模型的故事"]]
  """
  alias Helpers.Link
end

defmodule Helpers.Link.Site.Bilibili do
  @moduledoc """
  Bilibili is a video website in China.
  """

  alias Helpers.Link
  @behaviour Link.Site

  @impl true
  def sitename(), do: :bilibili

  # av number
  @bili_avid_regex ~r/av(\d+)/
  # bv number
  @bili_bvid_regex ~r/BV(\w+)/
  # ep number
  # @bili_epid_regex ~r/ep(\d+)/
  # ss number
  # @bili_ssid_regex ~r/ss(\d+)/

  @impl true
  def parse_site_identifire(link) do
    cond do
      Regex.match?(@bili_avid_regex, link) -> {:av, link}
      Regex.match?(@bili_bvid_regex, link) -> {:bv, link}
      # Regex.match?(@bili_epid_regex, link) -> {:ep, link}
      # Regex.match?(@bili_ssid_regex, link) -> {:ss, link}
      true -> {:error, :invalid_link}
    end
  end

  @impl true
  def tolink(
        _link_body = %Link{
          site: :bilibili,
          segment: segment,
          identifier: identifier,
          description: description
        }
      ) do
    case segment do
      :av -> {:ok, "[#{description}](https://www.bilibili.com/video/#{identifier})"}
      :bv -> {:ok, "[#{description}](https://www.bilibili.com/video/#{identifier})"}
      _ -> {:error, :invalid_bilibili_link}
    end
  end

  def tolink(_), do: {:error, :site_not_match}

  def tomap(raw_content) do
    Link.Site.tomap(raw_content, __MODULE__)
  end
end

defmodule Helpers.Link.Site.Douyin do
end

defmodule Helpers.Link.Site.YouTube do
  @moduledoc """
  YouTube is a video website.

  ## Format of link

  `[[youtube:{video_id}]]` or `[[watch?v={video_id}]]`
  """

  #alias Helpers.Link
  #@behaviour Link.Site

  #@impl true
  def sitename(), do: :youtube

  # @youtube_regex ~r/youtube:(.*)/

  #@impl true
  def parse_site_identifire(_link) do
    # ...
  end
end
