module ApplicationHelper
  def current_user?(user)
    current_user.id == user.id
  end
  
  # # ここから下追加したよ（のと
  # def resource_name
  # :user
  # end
  
  # def resource
  #   @resource ||= User.new
  # end
  
  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[:user]
  # end
  
    # 選択中のサイドメニューのクラスを返す
  def sidebar_activate(sidebar_link_url)
    current_url = request.headers['PATH_INFO']
    if current_url.match(sidebar_link_url)
      ' class="active"'
    else
      ''
    end
  end

  # サイドメニューの項目を出力する
  def sidebar_list_items
    items = [
      {:text => 'Top',   :path => "/admin/top"},
      {:text => 'Users', :path => admin_users_path},
      {:text => 'Notes', :path => admin_notes_path},
      {:text => 'Stamps', :path => "/admin/stampimages"}
    ]

    html = ''
    items.each do |item|
      text = item[:text]
      path = item[:path]
      html = html + %Q(<li#{sidebar_activate(path)}><a href="#{path}">#{text}</a></li>)
    end

    raw(html)
  end
  
end
