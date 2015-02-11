class ContactsController < ApplicationController

	def home
    	render 'home'
  	end

  	def new
  		@person = Contact.new
  		render 'new'
  	end

  	def create
  		@person = Contact.new contact_params
  		if @person.save
  			flash[:alert] = "Contact was created"
  			redirect_to(contacts_id_path(@person))
  		else
  			flash[:error] = "Contact was not created"
  			render 'new'
  		end
  	end

  	def show
      @contact = Contact.find(params[:id])

		# unless @contact = Contact.find_by(id: params[:id])
  #     render 'no'
  #   end

    # if @contact = Contact.find_by(id: params[:id])
    #   render 'show'
    # else
    #   render 'no'
    # end      
	end

	def index
		@contacts = Contact.all
	end

	def sort
		@contacts = Contact.order_contacts()
		render :index
	end

  def sort_letter
    @letter = params[:letter].slice!(0)
    @contacts = Contact.all
    @contact_letter = @contacts.sort_letter(@letter)
    # redirect_to(letter_sort_path(@letter))
    render 'sort_letter'
  end

	# def update
	# 	@contacts = Contact.order_contacts()
	# 	render :index
	# end

  	private
		def contact_params
			params.require(:contact).permit(:name, :address, :phone_number, :phone_number_alt, :email_address, :email_address_alt)
		end

end
