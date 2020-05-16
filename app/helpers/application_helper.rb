# frozen_string_literal: true

module ApplicationHelper
  ANIMATIONS = %w[bounceIn flyFromRight flyFromLeft].freeze

  def flash_class(level)
    alert_type = case level.to_sym
                 when :congrats then "#{ANIMATIONS.sample} animated"
                 when :missed then 'bounceIn animated'
                 end

    "alert #{alert_type}"
  end
end
