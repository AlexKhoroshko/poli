ActiveAdmin.register Doctor do
  permit_params :phone_number, :password, :first_name, :last_name, category_ids: []

  show do
    attributes_table do
      row :phone_number
      row :first_name
      row :last_name
      row :category do |doctor|
        doctor.categories.pluck(:name).join(', ')
      end
    end
  end

  index do
    selectable_column
    id_column
    column :phone_number
    column :first_name
    column :last_name
    column :category do |doctor|
      doctor.categories.pluck(:name).join(', ')
    end
    actions
  end

  filter :phone_number
  filter :first_name
  filter :last_name
  filter :categories

  form do |f|
    f.inputs do
      f.input :phone_number
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :categories, collection: Category.all,
                           label: 'Category',
                           input_html: { multiple: false },
                           include_blank: true
    end
    f.actions
  end
end
