class ApplicationController < ActionController::Base
    def counting
        @inbox_count = current_user.receivers.where(read_status: 0).count
    end
end
