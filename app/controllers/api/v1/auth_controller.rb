module Api
  module V1
    class AuthController < ApplicationController
      require "aws-sdk-iam"
      require "jwt"

      def login
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          token = generate_token(user)
          render json: { token: token, user: user.as_json(except: :password_digest) }
        else
          render json: { error: "Invalid email or password" }, status: :unauthorized
        end
      end

      def google
        # Temporarily disabled for testing
        render json: { error: "Google OAuth temporarily disabled" }, status: :service_unavailable
        # auth_url = "https://accounts.google.com/o/oauth2/v2/auth?" + {
        #   client_id: ENV["GOOGLE_CLIENT_ID"],
        #   redirect_uri: "#{request.base_url}/api/v1/auth/google/callback",
        #   response_type: "code",
        #   scope: "email profile",
        #   access_type: "offline",
        #   prompt: "consent"
        # }.to_query
        # render json: { auth_url: auth_url }
      end

      def apple
        # Temporarily disabled for testing
        render json: { error: "Apple OAuth temporarily disabled" }, status: :service_unavailable
        # auth_url = "https://appleid.apple.com/auth/authorize?" + {
        #   client_id: ENV["APPLE_CLIENT_ID"],
        #   redirect_uri: "#{request.base_url}/api/v1/auth/apple/callback",
        #   response_type: "code id_token",
        #   scope: "name email",
        #   response_mode: "form_post"
        # }.to_query
        # render json: { auth_url: auth_url }
      end

      def signup
        user = User.new(user_params)

        if user.save
          # Temporarily disabled IAM user creation
          # create_iam_user(user)

          token = generate_token(user)
          render json: { token: token, user: user.as_json(except: :password_digest) }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

      def generate_token(user)
        JWT.encode(
          {
            user_id: user.id,
            exp: 24.hours.from_now.to_i
          },
          Rails.application.credentials.secret_key_base
        )
      end

      # Temporarily disabled IAM user creation
      # def create_iam_user(user)
      #   iam = Aws::IAM::Client.new(
      #     access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      #     secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      #     region: ENV["AWS_REGION"]
      #   )

      #   # Create IAM user
      #   iam_user = iam.create_user(user_name: "user_#{user.id}")

      #   # Create access key for the user
      #   access_key = iam.create_access_key(user_name: iam_user.user.user_name)

      #   # Create policy for S3 access
      #   policy_document = {
      #     Version: "2012-10-17",
      #     Statement: [
      #       {
      #         Effect: "Allow",
      #         Action: [
      #           "s3:PutObject",
      #           "s3:GetObject",
      #           "s3:DeleteObject"
      #         ],
      #         Resource: "arn:aws:s3:::#{ENV['AWS_BUCKET']}/*"
      #       }
      #     ]
      #   }.to_json

      #   # Create and attach policy
      #   policy = iam.create_policy(
      #     policy_name: "user_#{user.id}_s3_access",
      #     policy_document: policy_document
      #   )

      #   iam.attach_user_policy(
      #     user_name: iam_user.user.user_name,
      #     policy_arn: policy.policy.arn
      #   )

      #   # Store IAM credentials in user record
      #   user.update(
      #     aws_access_key_id: access_key.access_key.access_key_id,
      #     aws_secret_access_key: access_key.access_key.secret_access_key
      #   )
      # end
    end
  end
end
