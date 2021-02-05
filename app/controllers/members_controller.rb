# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]

  # response.headers["X-AUTH-TOKEN"] = authenticity_token
  # GET /members
  # GET /members.json

  def index
    if role_check == 1
      @members = Member.all
    else
      redirect_to blogs_path
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show; end

  # GET /members/new
  def new
    if role_check == 1
      @member = Member.new
    else
      redirect_to blogs_path
    end
  end

  # GET /members/1/edit
  def edit; end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: member_params }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    if role_check == 1
      @member = Member.find(params[:id])
    else
      redirect_to blogs_path
    end
  end

  # Only allow a list of trusted parameters through.
  def member_params
    params.require(:member).permit(:name, :password, :email, :age, :role_id, :address, :contact)
  end
end
