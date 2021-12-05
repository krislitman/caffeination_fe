// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
var $ = require( "jquery" )
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'
require("stylesheets/application.scss")
require("@fortawesome/fontawesome-free/js/all")
require("slick-carousel")

import "slick-carousel/slick/slick.scss"
import "slick-carousel/slick/slick-theme.scss"

Rails.start()
ActiveStorage.start()

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
