Rails.application.routes.draw do
  # HTTPメソッド 'URL' => 'コントローラ#アクション'
  #ブラウザから届いたリクエスト(HTTPメソッド+URL)に対してコントローラで定義してアクションを結びつける。
   #ルーティングとはブラウザやブラウザ内のフォームからの要望を受けとりその内容によりコントローラのどの処理を実行するか判断し実行
  get 'top' => 'homes#top'
  resources :lists
  #詳細画面で呼び出される投稿データは、URLの/lists/:id内の:idで判断する。このidはアクション内にparams[:id]と記述すると取得できる
  #名前付きルートとは、ルーティング自体に名前をつけておくこと。
  #asオプションを追加でlist#showの設定を,listとして利用できるの意味になる
  #as:edit_listは名前付きルート
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
