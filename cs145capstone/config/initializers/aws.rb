#AWS.config (:access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'])
#S3_BUCKET = AWS::S3.new.buckets[ENV['S3_BUCKET']]
#AWS.config (:access_key_id  -> "AKIAJYQMRNRLZFFZ2RHQ", :secret_access_key -> "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")
AWS.config(
  :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
)

S3_BUCKET =  AWS::S3.new.buckets[ENV['AWS_S3_BUCKET']]
#s3 = Aws::S3::Client.new(
#  access_key_id: ENV['ACCESS_KEY_FOR_AWS'],
#  secret_access_key: ENV['SECRET_KEY_FOR_AWS']
#)
