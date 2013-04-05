module Wherever

  class Builder < BasicObject

    instance_methods.each do |m|
      unless m =~ /^__/
        undef_method m
      end
    end

    def initialize
      @messages = []
    end

    def to_proc
      ::Proc.new { |x| __replay_all_messages__(x) }
    end

    def respond_to?(*args)
      true
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
