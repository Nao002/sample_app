class ListsController < ApplicationController
  #以下アクション
  def new
    #Listはモデル名, List.newはListというモデル名のモデルオブジェクトを生成 ,@をつけるとインスタンス変数になる。
    #コントローラでインスタンス変数を指定して折っくことでviewファイルでインスタンス変数に格納された情報を表示させることができる。
    #モデルはデータベースとやり取りをする役割を持つ
    #List.newと定義することで、Listモデルの情報をもとに新しくオブジェクトが作成され、Listモデルに存在するtitle・bodyが格納できるようになる
    @list = List.new
  end

  # 以下を追加
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    #paramsで値を受け取っている　一番下のやつ
    # 3. データをデータベースに保存するためのsaveメソッド実行
    # 4. トップ画面へリダイレクト
    #redirect_to 指定したURLに遷移することができるメソッド , _path 今回はルーティングで設定したlistパスを呼び出している。名前付きルート(パスヘルパー)
    list = List.new(list_params)
    list.save
    flash[:notice] = "投稿が成功しました"
redirect_to list_path(list.id)
  end
  def index
    @lists = List.all
  end

  def show
    #今回レコードを1件だけ取得するため、インスタンス変数名は単数形の@list
    #レコードとはdbに格納済みのデータ
    #ex: List.find(1)
    #listsテーブルの中にあるidが1のレコード取得
    
    @list = List.find(params[:id])
    
    
  end

  def edit
    #find モデル、find(件数)　idを指定してレコードを取得
    #アクション内にparams[:id]と記述するとURLが/lists/1の場合、id=1を取り出せる
    @list = List.find(params[:id])
  end
  def update
    list = List.find(params[:id])
    list.update(list_params)
     #redirect_to 指定したURLに遷移することができるメソッド , _path 今回はルーティングで設定したlistパスを呼び出している。名前付きルート(パスヘルパー)
    redirect_to list_path(list.id)
  end
  def destroy　
    #データ(レコードを1件取得)
    list = List.find(params[:id])
    #データ(レコード)を削除
    list.y
    #投稿一覧画面へリダイレクト
    redirect_to  '/lists'
  end
   private
  # ストロングパラメータ
  
   def list_params
     #params フォームから送られてくるデータはparamsの中に入っている。
     #require 送られてきたデータの中からモデル名を(ここでは:list)を指定し、データを絞り込む
     #permit requireで絞り込んだデータの名から、保存を許可するカラムを指定する。
     params.require(:list).permit(:title, :body, :image)
   end
end
