import NestedForm from 'stimulus-rails-nested-form'
import FilterController from './controllers/filter_controller'

const application = window.Stimulus
application.register('nested-form', NestedForm)
application.register('filter', FilterController)
