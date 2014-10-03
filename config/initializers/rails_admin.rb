Date::DATE_FORMATS[:default] = "%d-%m-%Y"

RailsAdmin.config do |config|
  # Set the main administration panel tittle
  config.main_app_name = Proc.new { |controller| [ "MedicalPet", "History" ] }

  class RailsAdmin::Config::Fields::Types::Inet < RailsAdmin::Config::Fields::Base
    RailsAdmin::Config::Fields::Types::register(self)
  end

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    # Root actions
    dashboard                     # mandatory
    # Collection actions
    index                         # mandatory
    new
    export
    bulk_delete
    # Member actions
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.included_models = ['User']

  RailsAdmin.config {|c| c.label_methods << :description }

end
