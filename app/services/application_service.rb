class ApplicationService
  class << self
    def call(*args, &block)
      new.call(*args, &block)
    end
  end
end
