object @task

attributes :description, :priority, :id

node(:completed) { |t| t.completed? }
node(:priority)  { |t| t.priority.to_i }
