class BaseErrorsSerializer < ActiveModel::Serializer
  attributes :success,
             :error_code,
             :message

  def success
    false
  end
end
