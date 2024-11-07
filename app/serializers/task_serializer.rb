
class TaskSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :completed, :created_at, :updated_at
  end
  