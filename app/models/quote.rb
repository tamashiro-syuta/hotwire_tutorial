class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # createのたびに、quotes ストリームを購読しているユーザーにブロードキャストし、quotes というidを持つDOMノードにプリペンドするように指示
  # broadcast_prepend_toメソッドは、Turboで定義されているメソッド
  # quotes/_quote.html.erbパーシャルを、ターゲット「quotes」によって識別された対象をTurbo Streamフォーマットでレンダリングして追加
  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  # データベースから削除されると、バックグラウンドジョブが後でデータベース内のこの引用を取得してジョブを実行することが不可能になるため、removeは非同期にできない

  # 上の3つのコールバックは下記のようにも書ける
  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
end