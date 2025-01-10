class Avo::Resources::Promotion < Avo::BaseResource
  def fields
    field :id, as: :id
    field :name, as: :text
    field :code, as: :text
    field :advertised, as: :boolean
    field :active, as: :boolean
    field :starts_at, as: :date_time
    field :expires_at, as: :date_time
    field :usage_limits, as: :number
    field :created_at, as: :date_time
    field :updated_at, as: :date_time
  end
end
