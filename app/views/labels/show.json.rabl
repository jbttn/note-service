object @label
attributes :id, :name

node :notes do
  partial('notes/show', :object => @notes)
end