defmodule Helpers.Gibberish do
  @moduledoc """
  generate gibberish content
  """
end

defmodule Helpers.Gibberish.CJK do
  @moduledoc """
  generate chinese content.
  """

  @default_opts %{
    number_embed: true,
    ascii_embed: true,
    space_between_cjk_and_non: true,
    space_between_sentences: false,
    blank_between_paragraphs: true,
    source: %{
      chinese: [
        Helpers.Gibberish.Container.SpaghettiMixedConcrete42,
        Helpers.Gibberish.Container.MechineIntoChina
      ],
      # ascii: [Helpers.Gibberish.Container.LoremIpsum]
    },
    length: %{
      paragraphs: 3,
      sentences: 20,
      characters_and_words: 400
    }
  }

  def generate(opts \\ []) do
    _opts = parse_opts(opts)
    # ...
  end

  defp parse_opts(_opts) do
    _default_opts = @default_opts
  end

  # defp generate_map(), do: nil

  # defp do_generate(prev, opt), do: nil
  # TODO: implement
  # defp do_generate(prev, []), do: prev

end

defmodule Helpers.Gibberish.Container do
  @callback get_source_content() :: list(String.t())
end

defmodule Helpers.Gibberish.Container.LoremIpsum do
  @moduledoc """
  generate lorem ipsum content
  """
  @behaviour Helpers.Gibberish.Container

  @source_content [
    "Lorem ipsum",
    "dolor sit amet",
    "consectetur adipiscing elit",
    "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
    "ut enim ad minim veniam",
    "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
    "duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur",
    "excepteur sint occaecat cupidatat non proident",
    "sunt in culpa qui officia deserunt mollit anim id est laborum",
    "Etiam sagittis",
    "elit in eleifend malesuada",
    "orci mauris venenatis nisl",
    "auctor tempor quam nulla vel metus",
    "Sed vitae eros eget ipsum luctus convallis vitae non elit",
    "Proin viverra fermentum magna",
    "quis faucibus lacus euismod facilisis",
    "Vivamus tincidunt egestas nisl",
    "sit amet pellentesque enim rhoncus quis",
    "Suspendisse tincidunt nulla at libero congue",
    "ac viverra dui aliquet",
    "Duis tortor leo",
    "posuere vel pharetra nec",
    "venenatis id urna",
    "Duis sapien enim",
    "vehicula id quam et",
    "malesuada auctor eros",
    "Integer in justo imperdiet",
    "molestie nisi at",
    "vulputate nisl",
    "Suspendisse laoreet sodales arcu",
    "et viverra quam vulputate sollicitudin",
    "Pellentesque pharetra felis dolor",
    "vitae laoreet sem sodales eget"
  ]

  @impl true
  def get_source_content(), do: @source_content
end

defmodule Helpers.Gibberish.Container.SpaghettiMixedConcrete42 do
  @moduledoc """
  generate gibberish content in chinese with meme
  `意大利面混合42号混凝土`.
  """
  @behaviour Helpers.Gibberish.Container

  @source_content [
    "我个人认为",
    "这个意大利面就应该拌42号混凝土",
    "因为这个螺丝钉的长度",
    "它很容易会直接影响到挖掘机的扭矩你知道吧",
    "你往里砸的时候",
    "一瞬间它就会产生大量的高能蛋白",
    "俗称UFO",
    "会严重影响经济的发展",
    "甚至对整个太平洋以及充电器都会造成一定的核污染",
    "你知道啊",
    "再者说",
    "根据这个勾股定理",
    "你可以很容易地推断出人工饲养的东条英鸡",
    "它是可以捕获野生的三角函数的",
    "所以说这个秦始皇的切面是否具有放射性啊",
    "特朗普的N次方是否含有沉淀物",
    "都不影响这个沃尔玛跟维尔康在南极会合",
    "啊"
  ]

  @impl true
  def get_source_content(), do: @source_content
end

defmodule Helpers.Gibberish.Container.MechineIntoChina do
  @moduledoc """
  generate gibberish content in chinese with meme
  `高速运转的机械进入中国`.
  """
  @behaviour Helpers.Gibberish.Container

  @source_content [
    "你有这么高速运转的机械进入中国",
    "记住我给出的原理",
    "小的时候",
    "就是研发人",
    "就研发这个东西的原理是阴间政权管",
    "知道为什么有生灵给他运转先位",
    "还有还有",
    "专门饲养这个",
    "为什么地下产这种东西",
    "它管着它说是",
    "五世同堂旗下子孙",
    "你以为我跟你闹着玩呢",
    "你不你不你不警察吗",
    "黄龙江一派全都带蓝牙",
    "王龙江我告我告诉你",
    "在阴间是是那个化名",
    "化名小舅",
    "亲小舅",
    "赵金兰的那个嫡子嫡孙",
    "咋你跟王守义玩的",
    "那是我儿子",
    "他都管我叫太祖奶",
    "爱因斯姐叶赫那拉",
    "我是施瓦辛格",
    "我告诉你他不听命于杜康",
    "我跟你说句肝儿上的事",
    "你不刑警队的吗",
    "他不听命于杜康",
    "为什么",
    "他是韩国人",
    "他属于合合作方",
    "合伙人自有",
    "自己有自己的政权",
    "但是你进入亚洲了",
    "这这块儿牡丹江号称小联合国",
    "你触犯了军权你就可以抓他",
    "但是你们为了什么你",
    "为了是碎银几两啊",
    "还是限制你的数字啊",
    "还是你你定格不了你没有主权",
    "你这兵不硬啊你理论不强",
    "你说不明白",
    "你人情世故",
    "你为了几个数字导致你的方向啊"
  ]

  @impl true
  def get_source_content(), do: @source_content
end
