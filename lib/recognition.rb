 class Recognition
  
  require 'recognition_processor'
  
  attr_reader :bucket, :recognition_processor

  def initialize(args = {})
    @recognition_processor = RecognitionProcessor.new(collection_id: ENV.fetch('COLLECTION_ID'))
    @bucket                = args[:bucket]
  end

  def recognize image_name
    recognition_processor.compare_faces_with_file image_name
  end

  def push_image image_name
    recognition_processor.push_image_to_collection image_name
  end

  private

  def bucket_objects
    bucket.get_objects
  end
end