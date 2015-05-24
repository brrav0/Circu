
text "Rapport d'activité de la circularisation"
move_down 10
text "Information client", :size =>12, :style => :bold
move_down 10
text "Nom : #{@client.name}"
text "Numéro et rue : #{@client.number_and_street}"
text "Code postal : #{@client.zip_code}"
text "Ville : #{@client.city}"
move_down 10
text "Signataire autorisé : #{@clientcontact.email}"
move_down 10

text "Information commissaire aux comptes"
move_down 10
text "Nom : #{@user.name}"
text "Email : #{@user.email}"
move_down 10

text "Circularisation"
move_down 10

text "Banque : #{@bank.name}"
text "Référence : #{@bankaccount.number}"
text "Devise : #{@bankaccount.currency}"
text "Solde : #{@bankaccount.balance}"
move_down 10
text "Résultat : Montant confirmé par la banque"
move_down 10


text "Suivi d'activité"
move_down 10

table([["Description","Email","Date et Heure"],["Signature","#{@clientcontact.email}","#{@bankaccount.signed}"],["Envoi","#{@user.email}","#{@bankaccount.issued}"],["Réponse","#{@bankcontact.email}","#{@bankaccount.answered}"]], :row_colors => ["ffffff","d2c6c6"])

