Lesson.seed do |s|
  s.id    = 1
  s.genre = "ネットワーク機器に関する問題"
  s.introduce = "Vim中級編はテキストオブジェクトや検索などのコマンドが出題されます。初級編と同様、コマンド一覧やコマンド表示モードが使用可能です。中級編までマスターすれば、Vimでの操作が楽しくなってくるはずです！"
  s.image_name = "network.jpg"
  s.reference = "機器一覧はこちら"
  s.path = "networks"
  s.reference_url = "networks"
end
  
Lesson.seed do |s|
  s.id    = 2
  s.genre = "Zabbixに関するJSON問題編"
  s.introduce = "Vim上級編を知っていたらVimマスター間違い無し！これまでの問題よりも大幅に難易度が上がります。上級編もコマンド一覧やコマンド表示モードを使用することができます。上級編までマスターすれば、立派なVimmerの仲間入りです！"
  s.image_name = "json.jpg"
  s.reference = "まとめはこちら"
  s.path = "jsons"
  s.reference_url = "jsons"
end