class UsersDatatable < Effective::Datatable

  collection do
    scope = User.all
  end

  filters do

  end
  datatable do
    order :id, :desc

    col :id,                 visible: false
    col :email,              visible: true
    col :first_name,         visible: true
    col :last_name,          visible: true
    col :is_admin,           visible: true
    col :active,             visible: true

    col :created_at,         visible: true
    col :updated_at,         visible: true
    col :deleted_at,         visible: true

    col :sign_in_count,      visible: false
    col :current_sign_in_at, visible: false
    col :last_sign_in_at,    visible: false
    col :current_sign_in_ip, visible: false
    col :last_sign_in_ip,    visible: false
    col :failed_attempts,    visible: false
    col :unlock_token,       visible: false
    col :locked_at,          visible: false

    actions_col
  end
end
