module Api
  module V1
    class ChallengesController < ApplicationController
      before_action :set_challenge, only: %i[show update destroy]

      def index
        @challenges = Challenge.all
        render json: @challenges
      end

      def create
        @challenge = Challenge.new(challenge_params)
        if @challenge.save
          render json:{message: "Challenge created successfully", data: @challenge}
        else
          render json:{message: "Failed to create challenge", data: @challenge.errors}
        end
      end

      def show
        if @challenge
          render json:{ message: "Challenge found", data: @challenge}
        else
          render json:{message: "Challenge not found", data: @challenge.errors}
        end
      end

      def update
        if @challenge.update(challenge_params)
          render json: {message: "Challenge updated successfully", data: @challenge}
        else
          render json: {message: "Challenge not updated successfully", data: @challenge.errors}
        end
      end

      def destroy
        if @challenge.destroy
          render json: {message: "Challenge deleted successfully", data: @challenge}
        else
          render json: {data: @challenge.errors}
        end
      end

      private

      def set_challenge
        @challenge = Challenge.find(params[:id])
      end

      def challenge_params
        @challenge = params.require(:challenge).permit(:title, :description, :start_date, :end_date)
      end
    end
  end
end
