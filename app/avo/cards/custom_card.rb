class Avo::Cards::CustomCard < Avo::Cards::PartialCard
  self.id = "custom_card"
  self.label = "Custom Card"
  self.partial = "avo/cards/custom_card"

  def query
    selected_time_range = params[:time_range]
    selected_country = params[:country]

    # Default date range setup
    from = Date.today.midnight - 7.days
    to = DateTime.current

    # Apply time filter based on selected time range
    case selected_time_range
    when "TODAY"
      from = DateTime.current.beginning_of_day
    when "7 days"
      from = DateTime.current - 7.days
    when "MTD"
      from = DateTime.current.beginning_of_month
    when "QTD"
      from = DateTime.current.beginning_of_quarter
    when "YTD"
      from = DateTime.current.beginning_of_year
    when "ALL"
      from = Time.at(0)  # For all time
    end

    # Base query to fetch users, filtered by date range and optionally by country
    users = User.where(created_at: from..to)

    # Apply country filter if a country is selected
    users = users.where(country: selected_country) if selected_country.present?

    # Return the result (count of users)
    result users.count
  end
end
