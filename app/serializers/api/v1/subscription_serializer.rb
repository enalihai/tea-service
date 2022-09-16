class Api::V1::SubscriptionSerializer
  def self.sub_data(new_sub)
    {
      data: {
        id: new_sub.id.to_s,
        type: 'subscription',
        attributes: {
          title: new_sub.title,
          price: new_sub.price,
          frequency: new_sub.frequency,
          status: new_sub.status
        }
      }
    }
  end

  def self.list_all(subs)
    {
      data: subs.map do |subscribe|
        {
          id: subscribe.id.to_s,
          type: 'subscription',
          attributes: {
            title: subscribe.title,
            price: subscribe.price,
            frequency: subscribe.frequency,
            status: subscribe.status
          }
        }
      end
    }
  end
end