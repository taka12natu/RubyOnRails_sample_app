class TodolistsController < ApplicationController
  def new
  	# Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end

  def create
  	# データを新規登録するためのインスタンスの作成
  	list = List.new(list_params)
  	# データをデータベースに保存するためのsaveメソッド実行
  	list.save
  	# トップ画面へリダイレクト
  	redirect_to todolist_path(list.id)
  end

  def index
  	@lists = List.all
  end

  def show
  	@list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to todolists_path
  end

  private
  # ストロングパロメータ
  def list_params
  	params.require(:list).permit(:title, :body, :image)
  end
end

# def create内のlistに＠がついていないが、
# これはインスタンス変数でなく、ローカル変数を用いている。
# ローカル変数にするとviewファイルへの受け渡しができないが、
# ここに関しては受け渡しの必要がないため。
# そういうデータはローカル変数にした方がエラー要因を減らせる。