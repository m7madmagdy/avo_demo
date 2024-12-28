import NestedForm from 'stimulus-rails-nested-form'
import DashboardCardController from './controllers/dashboard_card_controller'

const application = window.Stimulus
application.register('nested-form', NestedForm)
application.register('dashboard-card-controller', DashboardCardController)
