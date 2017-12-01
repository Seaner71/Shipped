module ApplicationHelper
    def boat_avatar_select(boat)
      return image_tag boat.avatar.url(:medium),
                 id: 'image-preview',
                 class: 'img-responsive img-circle boat-image' if boat.avatar.exists? image_tag 'default-avatar.jpg', id: 'image-preview',
                 class: 'img-responsive img-circle boat-image'
    end
  

    def profile_avatar_select(user)
      return image_tag user.avatar.url(:medium),
                   id: 'image-preview',
                   class: 'img-responsive img-circle profile-image' if user.avatar.exists? image_tag 'default-avatar.jpg', id: 'image-preview',
                   class: 'img-responsive img-circle profile-image'
    end

end
