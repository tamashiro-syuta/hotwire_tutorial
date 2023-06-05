class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # createのたびに、quotes ストリームを購読しているユーザーにブロードキャストし、quotes というidを持つDOMノードにプリペンドするように指示
  # broadcast_prepend_toメソッドは、Turboで定義されているメソッド
  # quotes/_quote.html.erbパーシャルを、ターゲット「quotes」によって識別された対象をTurbo Streamフォーマットでレンダリングして追加
  after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self } }
end