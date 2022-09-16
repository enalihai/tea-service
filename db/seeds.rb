# Subscription.destroy_all
# Customer.destroy_all
# Tea.destroy_all

customer_1 = Customer.create(first_name: 'Luke', last_name: 'Di Pasquale', email: 'lpslps@gmail.com', address: '123 Anywhere Ave, Walla Walla, WA, 27194')
customer_2 = Customer.create(first_name: 'Bing', last_name: 'Balla', email: 'bingballa@gmail.com', address: '321 Somewhere St, Bing Balla, OK, 73013')
customer_3 = Customer.create(first_name: 'Struggling', last_name: 'Actor', email: 'highcity@gmail.com', address: '456 Some Place Ave, Los Angeles, CA, 90210')
customer_4 = Customer.create(first_name: 'Jesse', last_name: 'Hermans', email: 'guacnchips@gmail.com', address: '42174 West Court, Ovadaeo, NM, 38174')

tea_1 = Tea.create(title: "Romeo's Poison", description: "Haply some poison yet doth hang on them", temperature: 132, brew_time: 13)
tea_2 = Tea.create(title: "Might of Menethil", description: "A worthy stout tea", temperature: 143, brew_time: 8)
tea_3 = Tea.create(title: "Fel Edge of Insanity", description: "A tea not for most", temperature: 374, brew_time: 57)
tea_4 = Tea.create(title: "Kaladin's Folly", description: "One leaf leads to the last sip", temperature: 134, brew_time: 11)
tea_5 = Tea.create(title: "Sunshine Sparkle", description: "The rain leaves to it", temperature: 128, brew_time: 14)
tea_6 = Tea.create(title: "Folk Lore Gold", description: "Unknown in the big city", temperature: 117, brew_time: 23)
tea_7 = Tea.create(title: "Gypsum Desire", description: "A potent blend", temperature: 112, brew_time: 11)
tea_8 = Tea.create(title: "Mountain Rose", description: "A deep scarlett tea", temperature: 141, brew_time: 19)
tea_9 = Tea.create(title: "Sansipio Southern", description: "Fall asleep fast", temperature: 107, brew_time: 16)
tea_10 = Tea.create(title: "Adagio Teas", description: "A battle of wits to consume", temperature: 132, brew_time: 9)
tea_11 = Tea.create(title: "Foe Hammer Kick", description: "Wake up with glamdring", temperature: 111, brew_time: 14)
tea_12 = Tea.create(title: "Dysipio Dentudes", description: "A weird measure of leaf", temperature: 114, brew_time: 6)
tea_13 = Tea.create(title: "Renee's Rent Check", description: "A future promise to your tastes", temperature: 102, brew_time: 18)
tea_14 = Tea.create(title: "Focus Fast Fungi", description: "A fungus based tea... careful", temperature: 124, brew_time: 14)
tea_15 = Tea.create(title: "Apolyon, the Soul-Render", description: "Open the gates for your tastes", temperature: 133, brew_time: 13)

# sub_1 = customer_1.subscriptions.create!(
#         tea_id: tea_1.id,
#         frequency: 'yearly',
#         price: 12000,
#         title: "#{tea_1.title} = yearly sub for #{customer_1.first_name}",
#         status: 'active'
#       )
# sub_2 = customer_2.subscriptions.create!(
#         tea_id: tea_2.id,
#         frequency: 'monthly',
#         price: 1100,
#         title: "#{tea_2.title} = monthly sub for #{customer_2.first_name}",
#         status: 'active'
#       )
# sub_3 = customer_2.subscriptions.create!(
#         tea_id: tea_1.id,
#         frequency: 'weekly',
#         price: 400,
#         title: "#{tea_1.title} = weekly sub for #{customer_2.first_name}",
#         status: 'cancelled'
#       )
# sub_4 = customer_2.subscriptions.create!(
#         tea_id: tea_4.id,
#         frequency: 'yearly',
#         price: 12000,
#         title: "#{tea_4.title} = yearly sub for #{customer_2.first_name}",
#         status: 'active'
#       )
# sub_5 = customer_3.subscriptions.create!(
#         tea_id: tea_1.id,
#         frequency: 'yearly',
#         price: 12000,
#         title: "#{tea_1.title} = yearly sub for #{customer_3.first_name}",
#         status: 'active'
#       )
# sub_6 = customer_3.subscriptions.create!(
#         tea_id: tea_14.id,
#         frequency: 'yearly',
#         price: 12000,
#         title: "#{tea_14.title} = yearly sub for #{customer_3.first_name}",
#         status: 'active'
#       )
# sub_7 = customer_3.subscriptions.create!(
#         tea_id: tea_12.id,
#         frequency: 'monthly',
#         price: 1100,
#         title: "#{tea_12.title} = monthly sub for #{customer_3.first_name}",
#         status: 'active'
#       )
# sub_8 = customer_3.subscriptions.create!(
#         tea_id: tea_14.id,
#         frequency: 'weekly',
#         price: 400,
#         title: "#{tea_14.title} = weekly sub for #{customer_3.first_name}",
#         status: 'cancelled'
#       )
# sub_9 = customer_3.subscriptions.create!(
#         tea_id: tea_10.id,
#         frequency: 'yearly',
#         price: 12000,
#         title: "#{tea_10.title} = yearly sub for #{customer_3.first_name}",
#         status: 'active'
#       )
# sub_10 = customer_3.subscriptions.create!(
#         tea_id: tea_4.id,
#         frequency: 'monthly',
#         price: 1100,
#         title: "#{tea_4.title} = monthly sub for #{customer_3.first_name}",
#         status: 'active'
#       )