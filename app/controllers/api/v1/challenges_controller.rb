module Api
  module V1
    class ChallengesController < ApplicationController

      def index
        @challenges = Challenge.all
        render json: @challenges
      end

      def create
      end

      def show
      end

      def update
      end

      def destroy
      end

    end
  end
end
