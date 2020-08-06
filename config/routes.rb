Rails.application.routes.draw do
  get 'todolists/new'
  get 'top' => 'homes#top'
  post 'todolists' => 'todolists#create'
  get 'todolists' => 'todolists#index'
  get 'todolists/:id' => 'todolists#show', as: 'todolist'
  get 'todolists/:id/edit' => 'todolists#edit', as: 'edit_todolist'
  patch 'todolists/:id' => 'todolists#update', as: 'update_todolist'
  delete 'todolists/:id' => 'todolists#destroy', as: 'destroy_todolist'
end

#　get :データの取り込みを要求
# 'top':ファイルパス（URLの後ろに表記される）
# 'homes#top' :homesコントローラのtopを実行.topはアクション名?
# →homesコントローラはdefの記述しかないが、viewsのhomesに"top"のhtmlファイルがあるからそれを読み込んでいる
# コントローラ名はファイル名とも一致させる

# postは指定したリソースに実体を送信　送信・投稿機能用？

# アクションの数だけhtmlmファイルも存在する？
# コントローラ内のアクションを実行しつつ、アクション名のつくhtmlファイルを表示？	

# ３行目：url:/topに行くため（get）にhomesコントローラのアクション（topメソッド）を実行する
# ４行目：url:/todolistsに投稿するため（post）にtodolistsコントローラのcreateメソッドを実行する
# ２行目はhtmlの表示だけでコントローラでの処理はないため、urlの指定のみとなっている

# ６行目のasはコード上でのURLの記載をわかりやすくするため？
# index.html.erb見ればわかる	
# URLを変数に入れているようなイメージ