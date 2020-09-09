class UserSponsor < ApplicationRecord

  belongs_to :smart_tv_user
  belongs_to :smart_tv_sponsor

end
