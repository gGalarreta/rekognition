class SponsorStore < ApplicationRecord

  belongs_to :store
  belongs_to :smart_tv_sponsor
  
end
