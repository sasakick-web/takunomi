module PostsHelper
  def matarial_placeholder
  <<-"EOS".strip_heredoc
（例）
・きゅうり
・梅干し
・ごま油
・塩
  EOS
end
  def body_placeholder
  <<-"EOS".strip_heredoc
（例）
1.きゅうりは一口大に切り、塩をまぶし５分置いて、水気をギュッと絞る。
2.刻んだ梅干し、ごま油を和えて出来上がり。
  EOS
end
  def text_placeholder
  <<-"EOS".strip_heredoc
    （例）とっても簡単でビールによく合います♪(´ε｀ )
  EOS
end
end
