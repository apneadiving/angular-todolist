object @task

attributes :description, :priority, :id

node(:completed) { |t| t.completed? }
