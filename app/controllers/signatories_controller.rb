class SignatoriesController < ApplicationController

def index
  @signatory = Signatory.all
end

def new
  @signatory = Signatory.new
end

def create
  @signatory = Signatory.new(signatory_params)
    if @signatory.save
      flash[:info]="Signataire ajouté(e)"
      redirect_to root_url
    else
      render '/signatories/new'
  end
end

private

def signatory_params
  params.require(:signatory).permit(:first_name, :last_name, :email)
end

end
