class Avo::Dashboards::Dashy < Avo::Dashboards::BaseDashboard
  self.id = "dashy"
  self.name = "Dashy"
  self.description = "The first dashbaord"
  self.grid_cols = 3

  def cards
    card Avo::Cards::UsersMetric
    card Avo::Cards::CustomCard
  end
end
