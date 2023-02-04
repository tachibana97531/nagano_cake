Rails.application.routes.draw do
  devise_for :customers,skip:[:passwords],controllers:{
  registrations:"public/registrations",
  sessions:"public/sessions"
  }
  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions: "admin/sessions"
  }
  namespace :admin do
    get 'orders/:id'=>"orders#show"
    patch 'orders/:id'=>"orders#update"
  end
  namespace :admin do
    patch 'order_details/:id'=>"order_details#update",as: :detail
  end
  namespace :admin do
    resources:customers,except:[:new,:create,:destroy]
  end
  namespace :admin do
    resources:genres,except:[:new,:show,:destroy]
  end
  namespace :admin do
    resources:items,except:[:destroy]
  end
  namespace :admin do
    get '/'=>"homes#top",as: :homes
  end
  scope module:"public" do
    resources:addresses,except:[:new,:show]
  end
  scope module:"public" do
    post 'orders/confirm'=>"orders#confirm"
    get 'orders/complete'=>"orders#complete"
    resources:orders,only:[:new,:create,:index,:show]
  end
  scope module:"public" do
    delete 'cart_items/destroy_all'=>"cart_items#destroy_all"
    resources:cart_items,only:[:create,:index,:update,:destroy]
  end
  scope module:"public" do
    get 'customers/my_page'=>"customers#show"
    get 'customers/information/edit'=>"customers#edit"
    patch 'customers/information'=>"customers#update"
    get 'customers/unsubscribe'=>"customers#unsubscribe"
    patch 'customers/withdraw'=>"customers#withdraw"
  end
  scope module:"public" do
    resources:items,only:[:index,:show]
  end
  scope module:"public" do
    root to:"homes#top"
    get '/about'=>"homes#about"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
