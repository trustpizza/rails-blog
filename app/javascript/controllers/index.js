// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"
// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)

import CarouselController from "./carousel_controller"
application.register("carousel", CarouselController)

import ImageModalController from "./image_modal_controller"
application.register("image-modal", ImageModalController)