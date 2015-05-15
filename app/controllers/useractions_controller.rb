class UseractionsController < ApplicationController

def share
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attribute(:shared, Time.new)
    flash[:info]="le compte #{params[:id]} a été partagé."
    redirect_to bankaccounts_url
  else
    flash[:info]="le compte #{params[:id]} n'a pas été partagé. Veuillez nous contacter."
    redirect_to bankaccounts_url
  end
end

def sign
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attribute(:signed, Time.new)
    flash[:info]="le compte #{params[:id]} a été signé."
    redirect_to indexclientcontact_url
  else
    flash[:info]="le compte #{params[:id]} n'a pas été signé. Veuillez nous contacter."
    redirect_to indexclientcontact_url
  end
end

def issue
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attribute(:issued, Time.new)
    flash[:info]="le compte #{params[:id]} a été envoyé."
    redirect_to bankaccounts_url
  else
    flash[:info]="le compte #{params[:id]} n'a pas été envoyé. Veuillez nous contacter."
    redirect_to bankaccounts_url
  end
end

def answer
  @bankaccount = Bankaccount.find(params[:id])
  if @bankaccount.update_attribute(:answered, Time.new)
    flash[:info]="le compte #{params[:id]} a fait l'objet d'une réponse."
    redirect_to indexbankcontact_url
  else
    flash[:info]="le compte #{params[:id]} n'a pas fait l'objet d'une réponse. Veuillez nous contacter."
    redirect_to indexbankcontact_url
  end
end

def reset
  @bankaccount = Bankaccount.find(params[:id])
  @bankaccount.update_attribute(:shared, nil)
  @bankaccount.update_attribute(:signed, nil)
  @bankaccount.update_attribute(:issued, nil)
  @bankaccount.update_attribute(:answered, nil)
  flash[:info]="Ok reset"
  redirect_to bankaccounts_url
end

end
