resources :projects do

  resources :issues , :as => :issue do
    collection do
      match 'bulk_edit', :via => [:get, :post]
      post 'bulk_update'
    end
    resources :time_entries, :controller => 'timelog' do
      collection do
        get 'report'
      end
    end
    resources :relations, :shallow => true, :controller => 'issue_relations', :only => [:index, :show, :create, :destroy]
  end
  match '/issues', :controller => 'issues', :action => 'destroy', :via => :delete

end
