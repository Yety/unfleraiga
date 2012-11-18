class PicturesController < ApplicationController
  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = Picture.new
    @redirect_back_to_album_id = nil
    if(params.has_key? :album_id)
      @album = Album.find(params[:album_id])
      @picture.album_id = @album.id	
      @redirect_back_to_album_id =  @picture.album_id
    end
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])

  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(params[:picture])
    @picture = Picture.create(params[:picture])

    saving_successful = @picture.save
    respond_to do |format|
      if saving_successful
	if params.has_key? :redirect
	  @album = Album.find(params[:redirect])
	  format.html { redirect_to @album, notice: 'Picture was successfully updated.' }
	  format.json { head :no_content }
	elsif
	  format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
	  format.json { render json: @picture, status: :created, location: @picture }
	end
      else
        format.html { render action: "new" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = Picture.find(params[:id])
  
    
    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end
  
  def import_from_folder
    @files = []
    unless params.has_key? :album_id
	redirect_to albums_url, notice: "Bitte ein Album auswaehlen!"
	return
    end
    @album = Album.find params[:album_id]
     unless @album
	redirect_to albums_url, notice: "Album existiert nicht!"
	return
    end
    
    base_path_for_import = "c:/temp/picture_import"

    @files.concat Dir.glob(base_path_for_import + "/*.jpg")
    @files.concat Dir.glob(base_path_for_import + "/*.JPG")
    @files = @files.uniq
    
    if not File.exists?(base_path_for_import + "/processed")
      Dir.mkdir(base_path_for_import + "/processed")
    end
      
    @target_path = []
    @files.each do |file|
      new_picture = Picture.new
      new_picture.album_id =@album.id
      attachment_file = File.new(file)
      new_picture.picture_attachment = attachment_file 
      new_picture.save
      attachment_file.close
      @target_path << base_path_for_import + "/processed/" + File.basename(file)
      File.rename(file, @target_path.last)
    end
    
    respond_to do |format|
      if params.has_key? :redirect
        format.html { redirect_to @album, notice: 'Picture successfully imported.' }
	format.json { head :no_content }
     else
	format.html
	format.json { head :no_content }
     end
    end
  end
end
