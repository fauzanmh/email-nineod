class HomeController < ApplicationController
    def index
        @u = User.first
        render 'main'
    end
end
