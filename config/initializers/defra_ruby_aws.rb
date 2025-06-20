# frozen_string_literal: true

require "defra_ruby/aws"

DefraRuby::Aws.configure do |c|
  c.buckets = []

  mocks_bucket_name = ENV.fetch("AWS_DEFRA_RUBY_MOCKS_BUCKET", nil)
  if mocks_bucket_name.present?
    govpay_mocks_bucket = {
      name: ENV.fetch("AWS_DEFRA_RUBY_MOCKS_BUCKET", nil),
      region: ENV.fetch("AWS_REGION", "eu-west-1"),
      credentials: {
        access_key_id: ENV.fetch("AWS_DEFRA_RUBY_MOCKS_ACCESS_KEY_ID", nil),
        secret_access_key: ENV.fetch("AWS_DEFRA_RUBY_MOCKS_SECRET_ACCESS_KEY", nil)
      },
      encrypt_with_kms: ENV.fetch("AWS_DEFRA_RUBY_MOCKS_ENCRYPT_WITH_KMS", false)
    }

    c.buckets << govpay_mocks_bucket
  end
end
