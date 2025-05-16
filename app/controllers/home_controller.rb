class HomeController < ApplicationController
    def index
        Sentry.capture_message("test message from home controller")
    end
end
