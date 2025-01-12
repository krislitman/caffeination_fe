# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  erb_template <<-ERB
    <span text="<%= @text %>"><%= content %></span>
  ERB

  def initialize(text:)
    @text = text
  end
end
