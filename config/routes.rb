Rails.application.routes.draw do
  scope 'api', module: 'v1' do
    get 'resources' => 'resources#index'

    scope 'schools' do
      get '/'            => 'schools#index',         as: :schools
      get '/:id'         => 'schools#show',          as: :school
      get '/:id/courses' => 'schools/courses#index', as: :school_courses
    end

    scope 'departments' do
      get '/'            => 'departments#index',         as: :departments
      get '/:id'         => 'departments#show',          as: :department
      get '/:id/courses' => 'departments/courses#index', as: :department_courses
    end

    scope 'courses' do
      get '/'                  => 'courses#index', as: :courses
      get '/:id'               => 'courses#show',  as: :course
      get '/:id/prerequisites/graph' => 'courses/prerequisites#index', as: :course_prerequisite_graph
      get '/:id/prerequisites' => 'courses/prerequisites#show', as: :course_prerequisites
    end

    scope 'admin/schools', module: 'admin' do
      post   '/'         => 'schools#create'
      post   '/schools/:id/departments' => 'departments#create', as: :new_school_department
      put    '/:id'      => 'schools#update'
      patch  '/:id'      => 'schools#update'
      delete '/:id'      => 'schools#destroy'
    end

    scope 'admin/departments', module: 'admin' do
      post   'departments/:id/course' => 'courses#create', as: :new_department_course
      put    '/:id'      => 'departments#update'
      patch  '/:id'      => 'departments#update'
      delete '/:id'      => 'departments#destroy'
    end

    scope 'admin/courses', module: 'admin' do
      put     '/:id'               => 'courses#update'
      patch   '/:id'               => 'courses#update'
      delete  '/:id'               => 'courses#destroy'
    end
  end
end
