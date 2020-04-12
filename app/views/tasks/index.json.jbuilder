json.array!(@tasks) do |task|
  json.id "#{task.id}"
  json.title "#{task.title}"
  json.content "#{task.content}"
  json.start task.start_date   
  json.end task.end_date   
  json.url task_url(task, format: :html) 
end