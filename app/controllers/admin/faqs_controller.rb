class Admin::FaqsController < Admin::BaseController
  respond_to :html, :js

  def index
    @faqs = Faq.all
  end

  def new
    @faq= Faq.new
  end

  def create
    @faq = Faq.new(params[:faq])
    if @faq.save 
      redirect_to edit_admin_faq_path(@faq.id), notice: "Added new FAQ"
    else
      flash[:error] = "Cannot create new FAQ.  Please try again"
      render :new
    end
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])
    if @faq.update_attributes(params[:faq])
      flash[:notice] = "updated FAQ '#{@faq.question}'"
    else
      flash[:error] = "Cannot update FAQ.  Please try again"
      render :edit
    end

    respond_with(@faq) do |f|
      f.html { redirect_to edit_admin_faq_path(@faq.id), notice: "updated FAQ" }
      f.js { flash.now[:notice] = "updated FAQ '#{@faq.question}'"}
    end
  end

  def destroy
    @faq = Faq.find(params[:id])
    if @faq.destroy
      flash[:notice] = "Deleted FAQ '#{@faq.question}'"
    else
      flash[:error] = "Error deleting FAQ. Please try again."
    end
    redirect_to admin_faqs_path
  end
end
