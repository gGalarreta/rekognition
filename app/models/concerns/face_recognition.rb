module FaceRecognition

  require 'bucket'
  require 'recognition'

  extend ActiveSupport::Concern


  class_methods do 

    def recognize_user image_name
      response = Recognition.new(bucket: Bucket.new()).recognize(image_name)
      user_avatar_file_name = ""
      if response.face_matches.present?
        greatest_precision_recognition = response.face_matches.as_json.max_by{|k| k["similarity"] }
        user_avatar_file_name = greatest_precision_recognition["face"]["external_image_id"]
      end
    end
  end

  def push_image_to_recognition_collection
    Recognition.new(bucket: Bucket.new()).push_image(self.avatar_file_name)
  end

end