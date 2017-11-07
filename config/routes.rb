Testapi::Engine.routes.draw do
  resource  :database,                              only: %i(destroy)
  resources :factories, path: "factories/:factory", only: %i(create)
  resources :models,    path: "models/:model",      only: %i(index create show update destroy)
end
