module BankaccountsHelper

def show_action_depending_on_bankaccount_status(bankaccount)

#@bankaccountid = bankaccount.id
@id = bankaccount.id

if current_user.clientcontact?

  if bankaccount.signed.nil?
    render '/bankaccounts/signed'
  elsif bankaccount.answered.nil?
    render '/bankaccounts/nabank'
      else
        render '/bankaccounts/answered'
  end

    elsif current_user.bankcontact?
      if bankaccount.answered.nil?
        render '/bankaccounts/answer'
          else
        render '/bankaccounts/nafinal'
      end

    else

  if bankaccount.shared.nil? 
  #  bankaccount = bankaccount.id
         render '/bankaccounts/shared'
           elsif bankaccount.signed.nil?
             render'/bankaccounts/naclient'

          elsif bankaccount.issued.nil?
            render '/bankaccounts/issued'
              elsif bankaccount.answered.nil?
                render '/bankaccounts/nabank'
                  else
                    render '/bankaccounts/answered'

  end

  end

end

end
