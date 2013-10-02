class StagesController < ApplicationController

  # POST /stages
  # POST /stages.json
  def create
    @stage = Stage.new(params[:stage])

    if @stage.save
      head :no_content
    else
      format.json { render json: @stage.errors, status: :unprocessable_entity }
    end
  end

  # PUT /stages/1
  # PUT /stages/1.json
  def update
    @stage = Stage.find(params[:id])

    if @stage.update_attributes(params[:stage])
      head :no_content
    else
      format.json { render json: @stage.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /stages/1
  # DELETE /stages/1.json
  def destroy
    @stage = Stage.find(params[:id])
    @stage.destroy

    head :no_content
  end
end
