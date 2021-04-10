class ContentsController < ApplicationController
  before_action :set_content,only:[:show,:edit,:update,:destroy]
  before_action :authenticate_user!, except: [:index, :show, :about]
  before_action :move_to_index, only: [:edit, :update, :destroy]

    def index
      @contents = Content.all.order('created_at DESC')
    end
    def new
      @content = Content.new
    end
    def create
       @content = Content.new(content_params)
       if @content.valid?
        @content.save
        redirect_to root_path
      else
        render :new
      end
    end

    def show
      @comment = Comment.new
      @comments = @content.comments.includes(:user)
    end

    def edit
    end

    def update
      if @content.update(content_params)
        redirect_to root_path
      else
        set_content
        render :edit
      end
    end

    def destroy
      if @content.destroy
        redirect_to root_path
      else
        render :show
      end
    end

    def about
    end

    private
    def content_params
      params.require(:content).permit(:image,:title,:explain).merge(user_id:current_user.id)
    end
    def set_content
      @content = Content.find(params[:id])
    end

    def move_to_index
      content = Content.find(params[:id])
      if content.user_id != current_user.id
        redirect_to root_path
      end
    end
end