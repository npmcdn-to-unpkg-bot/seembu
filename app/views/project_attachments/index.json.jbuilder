json.array!(@project_attachments) do |project_attachment|
  json.extract! project_attachment, :id, :project_id, :picture
  json.url project_attachment_url(project_attachment, format: :json)
end
