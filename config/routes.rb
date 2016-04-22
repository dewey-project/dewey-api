Rails.application.routes.draw do
  scope 'api', module: 'v1' do
    root 'resources#index'

    post 'register'  => 'registrations#create'
    post 'getToken'  => 'tokens#create'

    # School Routes
    scope 'schools', module: 'schools' do
      get 'search' => 'search#index', as: :schools_search
      get '/:id/departments' => 'departments#index', as: :school_departments
      get '/:id/courses' => 'courses#index', as: :school_courses
    end

    get 'schools' => 'schools#index', as: :schools
    get 'schools/:id' => 'schools#show', as: :school

    # Department Routes
    scope 'departments', module: 'departments' do
      get 'search' => 'search#index', as: :departments_search
      get '/:id/courses' => 'courses#index', as: :department_courses
    end

    get 'departments/:id' => 'departments#show', as: :department

    # Course Routes
    scope 'courses', module: 'courses' do
      get 'search' => 'search#index', as: :courses_search
      get '/:id/prerequisites/graph' => 'prerequisites#index', as: :course_prerequisite_graph
      get '/:id/prerequisites' => 'prerequisites#show', as: :course_prerequisites
    end

    get 'courses/:id' => 'courses#show', as: :course

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
          collection do
            post 'prerequisites' => 'prerequisites#create'
          end

          member do
            delete 'prerequisites/:course_id' => 'prerequisites#destroy'
          end
        end
      end
    end
  end
end
