Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/", { :controller => "dashboards", :action => "index"})
  get("/forex", {:controller => "dashboards", :action=> "forex"})
  get("/forex/:first_pair", {:controller => "dashboards", :action=>"currency_pairs"})
  get("/forex/:first_pair/:second_pair", {:controller => "dashboards", :action=>"results_pairs"})
end
