ActiveAdmin.register Post do
  menu label: "Blog Posts"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :body, :category_id, :admin_user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :category_id, :author_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column "Author", :admin_user
    column :title
    column :body
    column :category
    column :created_at
    actions
  end
end
