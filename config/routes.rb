Rails.application.routes.draw do
  scope 'api', module: 'v1' do
    scope 'schools' do
      get '/'            => 'schools#index',         as: :schools
      get '/:id'         => 'schools#show',          as: :school
      get '/:id/courses' => 'schools/courses#index', as: :school_courses

      post   '/'         => 'schools#create'
      put    '/:id'      => 'schools#update'
      patch  '/:id'      => 'schools#update'
      delete '/:id'      => 'schools#destroy'
    end

    scope 'departments' do
      get '/'            => 'departments#index',         as: :departments
      get '/:id'         => 'departments#show',          as: :department
      get '/:id/courses' => 'departments/courses#index', as: :department_courses

      post   '/'         => 'departments#create'
      put    '/:id'      => 'departments#update'
      patch  '/:id'      => 'departments#update'
      delete '/:id'      => 'departments#destroy'
    end

    scope 'courses' do
      get     '/'                  => 'courses#index', as: :courses
      get     '/:id'               => 'courses#show',  as: :course
      get     '/:id/prerequisites/graph' => 'courses/prerequisites#index', as: :course_prerequisite_graph
      get     '/:id/prerequisites' => 'courses/prerequisites#show', as: :course_prerequisites

      post    '/'                  => 'courses#create'
      put     '/:id'               => 'courses#update'
      patch   '/:id'               => 'courses#update'
      delete  '/:id'               => 'courses#destroy'
    end
  end
end
