// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
import CarouselController from "./carousel_controller"
application.register("carousel", CarouselController)

// import DragController from "./drag_controller"
// application.register("drag", DragController)

// import EditpostController from "./editpost_controller"
// application.register("editpost", EditpostController)