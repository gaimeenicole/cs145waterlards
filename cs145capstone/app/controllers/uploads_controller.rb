class UploadsController < ApplicationController
    def new
    end

    #def create
        # Make an object in your bucket for your upload
    #    obj = S3_BUCKET.objects[params[:file].original_filename]

        # Upload the file
    #    obj.write(file: params[:file], acl: :public_read)

        # Create an object for the upload
    #    @upload = Upload.new(url: obj.public_url, name: obj.key)

        # Save the upload
    #    if @upload.save
    #        redirect_to uploads_index_url, success: 'File successfully uploaded.'
    #    else
    #        flash.now[:notice] = 'There was an error'
    #        render :new
    #    end
    #end

    def index
        @bucket = S3_BUCKET.objects
        @objectArray = []
        @bucket.each do |obj|
            @objectArray << obj.key.split('-').map(&:to_i)
        end
        @objectArray.each do |data|
            @sensorReading = Sensor.new(locationNo: data[0], dateUploaded: data[1], timeUploaded: data[2], s1Flowrate: data[3], s1ML: data[4], s2Flowrate: data[5], s2ML: data[6], delta: (data[5]-data[3]).abs)
            if (Sensor.where(:locationNo => data[0], :dateUploaded => data[1], :timeUploaded => data[2], :s1Flowrate => data[3], :s1ML => data[4], :s2Flowrate => data[5], :s2ML => data[6], :delta => (data[5]-data[3]).abs).any?) == false
                @sensorReading.save
            end
        end
        @sensors = Sensor.all
        #@objectArray.each do |data|
        #    @sensorReading =
        #end
        #@uploads = Upload.all
        #@files = S3_BUCKET.objects
        #s3 = AWS::S3::Resource::new(region: 'us-west-2')
        #@bucket = s3.bucket('esp8266-sensordata')
        #@object = s3.buckets[S3_BUCKET].objects['key']
        #data_files = s3.bucket(bucket_name).objects(prefix: 'prefix/', delimiter: 'delimiter').collect(&:key)
    end
end
