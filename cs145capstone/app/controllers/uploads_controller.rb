class UploadsController < ApplicationController
    def new
    end

    def create
        # Make an object in your bucket for your upload
        obj = S3_BUCKET.objects[params[:file].original_filename]

        # Upload the file
        obj.write(file: params[:file], acl: :public_read)

        # Create an object for the upload
        @upload = Upload.new(url: obj.public_url, name: obj.key)

        # Save the upload
        if @upload.save
            redirect_to uploads_index_url, success: 'File successfully uploaded.'
        else
            flash.now[:notice] = 'There was an error'
            render :new
        end
    end

    def index
        @uploads = Upload.all
        @files = S3_BUCKET.objects
        #data_files = s3.bucket(bucket_name).objects(prefix: 'prefix/', delimiter: 'delimiter').collect(&:key)
    end
end
