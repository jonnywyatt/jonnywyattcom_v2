JonnywyattcomV2::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # articles GET    /articles(.:format)          articles#index
  #            POST   /articles(.:format)          articles#create
  # new_article GET    /articles/new(.:format)      articles#new
  # edit_article GET    /articles/:id/edit(.:format) articles#edit
  # article GET    /articles/:id(.:format)      articles#show
  # PATCH  /articles/:id(.:format)      articles#update
  # PUT    /articles/:id(.:format)      articles#update
  # DELETE /articles/:id(.:format)      articles#destroy
  resources :articles

  # You can have the root of your site routed with "root"
  root 'articles#index'


  # LEGACY URLS FROM WORDPRESS SITE
  get '/2014/10/16/pension-calculator-from-the-money-advice-service/', to: redirect("/articles/1", status: 302)
  get '/2014/07/19/talk-bdd-style-testing-in-javascript/', to: redirect("/articles/2", status: 302)
  get '/2014/06/16/portfolio-which-home-entertainment/', to: redirect("/articles/3", status: 302)
  get '/2014/04/08/an-event-hub-using-promises/', to: redirect("/articles/4", status: 302)
  get '/2014/01/12/bdd/', to: redirect("/articles/5", status: 302)
  get '/2013/01/11/testing-a-requirejs-backbone-component-with-jasmine-and-jstestdriver/', to: redirect("/articles/6", status: 302)
  get '/2012/12/21/marionette-using-nested-views/', to: redirect("/articles/7", status: 302)
  get '/2012/12/18/front-end-architecture-and-page-load-speed/', to: redirect("/articles/8", status: 302)
  get '/2012/05/02/portfolio-news-video-hub-for-associated-press/', to: redirect("/articles/10", status: 302)
  get '/2012/01/08/portfolio-betfair-com-rebuilt-for-speed/', to: redirect("/articles/9", status: 302)
  get '/2011/10/30/portfolio-interactive-pie-and-bar-charts-for-internet-banking/', to: redirect("/articles/11", status: 302)
  get '/2011/09/17/front-end-development-principles/', to: redirect("/articles/12", status: 302)
  get '/2011/05/10/running-javascript-unit-tests-in-your-build-with-jasmine-and-maven/', to: redirect("/articles/12", status: 302)
  get '/2010/12/01/portfolio-dashboard-visualisations-using-vector-graphics/', to: redirect("/articles/13", status: 302)
  get '/2010/07/04/portfolio-android-app-created-using-phonegap/', to: redirect("/articles/14", status: 302)
  get '/2010/02/20/ajax/', to: redirect("/articles/15", status: 302)


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
