Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'quizz', to: 'quizz#question', as: 'quizz'
  post 'answer', to: 'quizz#answer', as: 'answer'
  get 'result', to: 'quizz#result', as: 'result'

  get 'prequizz', to: 'pages#prequizz', as: 'prequizz'

  get 'klx', to: "quizz#users"
end
