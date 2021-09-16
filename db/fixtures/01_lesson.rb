Lesson.seed do |s|
  s.id    = 1
  s.genre = "ネットワーク機器に関する問題"
  s.introduce = "ネットワーク機器に関する問題が出題されます。ネットワーク図や、実際の現場で出てくる機器を中心に問題を作成しました。ネットワークエンジニアとして働く前にぜひ一度挑戦してほしいです！"
  s.image_name = "network.jpg"
  s.reference = "機器一覧はこちら"
  s.path = "networks"
  s.reference_url = "networks"
end
  
Lesson.seed do |s|
  s.id    = 2
  s.genre = "Zabbixに関するJSON問題編"
  s.introduce = "ネットワークの監視・運用業務でよく使われるツールである「Zabbix」のパラメーターに関する問題になっています。Zabbixに関する理解がより深まるためトライしてみてください！"
  s.image_name = "json.jpg"
  s.reference = "まとめはこちら"
  s.path = "jsons"
  s.reference_url = "jsons"
end