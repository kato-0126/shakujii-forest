class ContentsController < ApplicationController
  def index
    @contents = Content.all.order('created_at DESC')
    end
    def create
      @content = Content.new
    end
end