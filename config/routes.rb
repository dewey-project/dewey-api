Rails.application.routes.draw do
  scope 'api', module: 'v1' do
    get 'resources' => 'resources#index'

    post 'register'  => 'registrations#create'
    post 'getToken'  => 'tokens#create'

    resources :schools, only: [:index, :show] do
      scope module: 'schools' do
        member do
          get 'courses' => 'courses#index', as: :courses
        end

        collection do
          post 'search' => 'search#index', as: :search
        end
      end
    end

    resources :departments, only: [:index, :show] do
      scope module: 'departments' do
        member do
          get 'courses' => 'courses#index', as: :courses
        end

        collection do
          post 'search' => 'search#index', as: :search
        end
      end
    end

    resources :courses, only: [:index, :show] do
      scope module: 'courses' do
        member do
          get 'prerequisites/graph' => 'prerequisites#index', as: :prerequisite_graph
          get 'prerequisites'  => 'prerequisites#show', as: :prerequisites
        end

        collection do
          post 'search' => 'search#index', as: :search
        end
      end
    end

    scope 'admin', module: 'admin' do
      resources :schools, only: [:create, :update, :destroy] do
        member do
          post 'departments'  => 'departments#create', as: :new_department
        end
      end

      resources :departments, only: [:create, :update, :destroy] do
        member do
          post 'courses' => 'courses#create', as: :new_course
        end
      end

      resources :courses, only: [:update, :destroy] do
        scope module: 'courses' do
          member do
            post   'prerequisites/:course_id' => 'prerequisites#create'
            delete 'prerequisites/:course_id' => 'prerequisites#destroy'
          end
        end
      end
    end
  end
end
