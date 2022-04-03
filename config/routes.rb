# frozen_string_literal: true

Rails.application.routes.draw do
  telegram_webhook TelegramWebhooksController
  devise_for :players, controllers: { omniauth_callbacks: 'callbacks' }
  mount ActionCable.server => '/cable'
  default_url_options only_path: true

  root 'sports#index'

  resources :about, only: :index

  resources :players, only: [:index, :show]

  resources :sports, only: [:index, :show] do
    resources :championships, only: [:index, :show] do
      resources :seasons, only: [:index, :show] do
        resources :days do
          get :next, on: :collection
          resources :day_players
          resources :games do
            resources :goals
          end
        end
      end
    end
  end
end
