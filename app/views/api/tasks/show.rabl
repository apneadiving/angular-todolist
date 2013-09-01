attributes :description, :priority

node(:completed) { |t| t.completed? }
