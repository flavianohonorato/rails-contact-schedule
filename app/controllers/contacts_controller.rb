class ContactsController < ApplicationController

  before_action :find_contact, only: [:edit, :update, :destroy]

  def index
    # @contacts = Contact.all
  	@contacts = Contact.paginate(:page => params[:page], :per_page => 10)
  end

  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
  		flash[:success] = "Successfully"
  		redirect_to contacts_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      flash[:success] = "Successfully update"
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  def destroy
    @contact.destroy
    flash[:success] = "Successfully delete"
    redirect_to contacts_path
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end

  private 

  def contact_params
  	params.require(:contact).permit(:name, :email, :company, :address, :phone, :avatar)
  end
end
