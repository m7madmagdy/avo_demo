class Avo::Cards::CustomCard < Avo::Cards::PartialCard
  self.id = "custom_card"
  self.label = "Custom Card"
  self.partial = "avo/cards/custom_card"

  def query
    from = params[:start_date].present? ? Date.parse(params[:start_date]) : nil
    to = params[:end_date].present? ? Date.parse(params[:end_date]) : nil

    users = if from && to
              User.where(created_at: from.beginning_of_day..to.end_of_day)
            else
              User.all
            end

    result users.count
  end
end
