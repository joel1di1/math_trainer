# frozen_string_literal: true

json.array! @multiplications, partial: 'multiplications/multiplication', as: :multiplication
