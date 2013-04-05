module Wherever

  class Builder

    instance_methods.each do |m|
      undef_method m unless m =~ /^(__|respond_to|inspect|object_id)/
    end

    def initialize
      @messages = []
    end

    def to_proc
      proc { |x| __replay_all_messages__(x) }
    end

    private

    def method_missing(*message)
      @messages << message        # record the message
      self                        # return self so we can keep recording
    end

    def __replay_all_messages__(obj)
      @messages.inject(obj) do |obj, message|
        obj.__send__(*message)
      end
    end

  end

  def where
    Builder.new
  end

end
