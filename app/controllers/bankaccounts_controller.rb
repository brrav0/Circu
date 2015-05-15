class BankaccountsController < ApplicationController

def index
#  for real application before deletion
#  @bankaccounts = current_user.bankaccounts
# for deletion
  @bankaccounts = Bankaccount.all
end
 
def indexclientcontact #metho for the client to see his/her related account

  email = current_user.email
  clientcontact = Clientcontact.find_by(email: email)
  @id = clientcontact.client_id
  @client = clientcontact.client.name
  @bankaccounts = Bankaccount.where("client_id = ?", @id)
  #bankaccounts = Bankaccount.all

end

def indexbankcontact#method for the bank contact to see his/her related account

  email = current_user.email
  bankcontact = Bankcontact.find_by(email: email)
  @id = bankcontact.bank_id
  @bank = bankcontact.bank.name
  @bankaccounts = Bankaccount.where("bank_id = ?", @id).where.not(issued: nil)

end

def index_admin#method for everyone
  @bankaccount = Bankaccount.all
end


def new
  @bankaccount= Bankaccount.new
end

def create

  client_id = params[:client_id]
  bank_id = params[:bank_id]
  @bankaccount = Bankaccount.new(bankaccount_params)
  if @bankaccount.save
    flash[:info]="Le compte bancaire a été sauvegardé"
  else
    render '/bankaccount/new'
  end
end

def destroy
  Bankaccount.find(params[:id]).destroy
flash[:success] = "Compte supprimé."
redirect_to bankaccounts_url || root_url
end

private

def bankaccount_params
  params.require(:bankaccount).permit(:number, :currency, :balance, :client_id, :bank_id)
end

end
