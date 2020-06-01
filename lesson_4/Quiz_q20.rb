mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

counter = 0 # counter for leads array

loop do
  break if counter == mailing_campaign_leads.size 
  full_name = mailing_campaign_leads[counter][:name] # get name from user hash
  names = full_name.split # split first and last

  names_counter = 0 # counter for names array
  loop do
    break if names_counter == names.size
    name = names[names_counter] # get first and last names separately
    names[names_counter] = name.capitalize # capitalize and reassign each in names array

    names_counter += 1
  end

  capitalized_full_name = names.join(' ') # stringify
  mailing_campaign_leads[counter][:name] = capitalized_full_name # put back in user hash

  counter += 1
end

p mailing_campaign_leads
p "------------------------------"

usable_leads = []
counter = 0 # reset counter for leads array

loop do
  break if counter == mailing_campaign_leads.size
  last_login = mailing_campaign_leads[counter][:days_since_login]
  subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]

  if last_login < 60 && subscribed_to_list
    usable_leads << mailing_campaign_leads[counter] # add entire user hash into usable_leads array
  end

  counter += 1
end

p usable_leads
p "------------------------------"
p mailing_campaign_leads # leads array should not be modified by the second  part of the program