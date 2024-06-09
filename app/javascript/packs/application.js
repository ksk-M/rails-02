import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"  //Turbolinks無効化
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
// Turbolinks.start()  //Turbolinks無効化
ActiveStorage.start()

import "./nav_menu"
require("jquery")
