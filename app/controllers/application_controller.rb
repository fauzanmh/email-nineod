class ApplicationController < ActionController::Base
    before_action :is_trash
    before_action :is_drafts

    def counting
        @inbox_count = current_user.receivers.where(read_status: 0).count
    end

    def is_trash
        @is_trash = request.path.include? "/trash"
    end

    def is_drafts
        @is_drafts = request.path.include? "/drafts"
    end
end
