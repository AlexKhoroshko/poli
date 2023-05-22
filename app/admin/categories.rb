ActiveAdmin.register Category do
  permit_params :name

  filter :name
  filter :created_at
  filter :updated_at
end
