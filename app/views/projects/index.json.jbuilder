json.array!(@projects) do |project|
  json.extract! project, :id, :title, :room, :location, :style, :size, :description
  json.url project_url(project, format: :json)
end
