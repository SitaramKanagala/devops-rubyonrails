# spec/requests/api/v1/tasks_spec.rb

require 'rails_helper'

RSpec.describe "Tasks API", type: :request do
  describe "GET /api/v1/tasks" do
    it "returns all tasks" do
      create_list(:task, 5)
      get '/api/v1/tasks'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  describe "POST /api/v1/tasks" do
    it "creates a new task" do
      task_params = { task: { title: "New Task", description: "Task description", completed: false } }
      post '/api/v1/tasks', params: task_params

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["title"]).to eq("New Task")
    end
  end

  # Additional tests for show, update, and destroy actions
end
