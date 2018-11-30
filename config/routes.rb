Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'quizz', to: 'quizz#question', as: 'quizz'
  post 'answer', to: 'quizz#answer', as: 'answer'
end
