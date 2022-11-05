# frozen_string_literal: true

module ApplicationHelper
  ANIMATIONS = %w[bounceIn flyFromRight flyFromLeft].freeze

  def flash_class(level)
    alert_type = case level.to_sym
                 when :congrats then "bg-green-400 #{ANIMATIONS.sample}"
                 when :missed then 'bg-orange-400 bounceIn'
                 end

    "result-box #{alert_type} animated"
  end
end
