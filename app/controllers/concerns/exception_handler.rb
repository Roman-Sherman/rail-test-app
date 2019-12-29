module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      index = 0

      # 連装配列を定義
      hash = {}
      # 連装配列にメッセージをマージ(コピー)する
      hash.merge!(e.record.errors.messages)

      # キーだけ残し、メッセージをフルメッセージに置き換える
      hash.each{ |key, value| 
        hash.store(key, e.record.errors.full_messages[index])
        index += 1
      }

      # JSON形式で返却する
      json_response(hash, :unprocessable_entity)
    end

    rescue_from ActionController::ActionControllerError do |e|
      json_response({ message: e.message }, :forbidden)
    end

    rescue_from ActionController::RoutingError do |e|
      json_response({ message: e.message }, :not_found)
    end
  end
end