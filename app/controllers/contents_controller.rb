class ContentsController < ApplicationController
    def index
    @contents = Content.all.order('created_at DESC')
    end
    def new
      @content = Content.new
    end
    def create
      @content = Content.new(content_params)
      if @content.save
        redirect_to root_path
      else
        @content = Content.new(content_params)
        render :new
      end
    end
    
    private
    def content_params
      params.require(:content).permit(:image,:title,:explain).merge(user_id:current_user.id)
    end

end