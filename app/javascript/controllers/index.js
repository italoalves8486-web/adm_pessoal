import { Application } from "@hotwired/stimulus"
const application = Application.start()

import ConfirmDeleteController from "./confirm_delete_controller"
application.register("confirm-delete", ConfirmDeleteController)
