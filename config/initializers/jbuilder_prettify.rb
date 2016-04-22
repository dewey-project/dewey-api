#Idea came from https://github.com/rails/jbuilder/issues/195

require 'jbuilder'

class Jbuilder
  attr_accessor :prettify
  alias_method :_original_target, :target!

  def prettify!
    @prettify = true
  end

  def target!
    @prettify ? ::JSON.pretty_generate(@attributes) : _original_target
  end
end
