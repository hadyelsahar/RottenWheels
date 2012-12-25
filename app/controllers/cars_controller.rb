class CarsController < ApplicationController
  # GET /cars
  # GET /cars.json
  def index
   
    nameattr = {:mark => @mark , :model => @model}
    minattr = {:ccmin => @ccmin , :kmpassedmin => @kmpassedmin , :pricemin => @pricemin }
    maxattr = {:ccmax => @ccmax , :kmpassedmax => @kmpassedmax , :pricemax => @pricemax }
    booleanattr = {:automatic => @automatic , :centerlock => @centerlock , :abs => @abs , :airbag =>@airbag, :electricwindow => @electicwindow ,:automatic => @autimatic ,:powersteering => @powersteering }

    
    
    # allkeys.concat(nameattr.keys).concat(minattr.keys).concat(maxattr.keys).concat(booleanattr.keys)
    
    nameattr.keys.each do |attr|
      if params[attr] != nil && params[attr] != "" 
        #logger.debug "\n\n\n\n >>>> the params are " + attr.to_s + "\t"  + params[attr]     
        nameattr[attr] = params[attr]   
      end
    end
    
    minattr.keys.each do |attr|
      if params[attr] != nil && params[attr] != "" 
        #logger.debug "\n\n\n\n >>>> the params are " + attr.to_s + "\t"  + params[attr]     
        minattr[attr] = params[attr]   
      end
    end
    
    maxattr.keys.each do |attr|
      if params[attr] != nil && params[attr] != ""
        #logger.debug "\n\n\n\n >>>> the params are " + attr.to_s + "\t"  + params[attr]     
        maxattr[attr] = params[attr]   
      end
    end
    
    booleanattr.keys.each do |attr|
      if params[attr] != nil      
        booleanattr[attr] = (params[attr] == "on")   
      end
    end
    
    @searchparams = nameattr.merge(minattr).merge(maxattr).merge(booleanattr)
    
#     
#      
    # nameattr = {:mark => @mark , :model => @model}
    # minattr = {:ccmin => @ccmin , :kmpassedmin => @kmpassedmin , :pricemin => @pricemin }
    # maxattr = {:ccmax => @ccmax , :kmpassedmax => @kmpassedmax , :pricemax => @pricemax }
    # booleanattr = {:automatic => @automatic , :centerlock => @centerlock , :abs => @abs , :electricwindow => @electicwindow ,:automatic => @autimatic ,:powersteering => @powersteering }
# 

    if nameattr.values.any?{|d| d != nil } || minattr.values.any?{|d| d != nil } || maxattr.values.any?{|d| d != nil } || booleanattr.values.any? {|d| d == true }
      @cars = Car
      nameattr.keys.each do |i|
        @cars = @cars.where(i.to_s+" like \""+ nameattr[i]+"\"") unless nameattr[i] == nil 
      end 
      minattr.keys.each do |i|
        attr = i.to_s.sub("min","")
        @cars = @cars.where(attr+" > "+ minattr[i]) unless minattr[i] == nil
        
      end 
       maxattr.keys.each do |i|
        attr = i.to_s.sub("max","")
        @cars = @cars.where(attr+" < "+ maxattr[i]) unless maxattr[i] == nil
      end 
      
      booleanattr.keys.each do |i|
        @cars = @cars.where(i.to_s+" = ?",booleanattr[i]) unless booleanattr[i] == nil
      end
      
           
    else   
      @cars = Car.all
    end     

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cars }
    end
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @car = Car.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @car }
    end
  end

  # GET /cars/new
  # GET /cars/new.json
  def new
    @car = Car.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @car }
    end
  end

  # GET /cars/1/edit
  def edit
    @car = Car.find(params[:id])
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(params[:car])

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render json: @car, status: :created, location: @car }
      else
        format.html { render action: "new" }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cars/1
  # PUT /cars/1.json
  def update
    @car = Car.find(params[:id])

    respond_to do |format|
      if @car.update_attributes(params[:car])
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url }
      format.json { head :ok }
    end
  end
end
