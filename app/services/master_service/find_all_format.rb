module MasterService
  class FindAllFormat < ApplicationService
    def initialize()
    end

    def call
      getFormats()
    end

    private
    def getFormats
      @formats ||= Format.all
    end
  end
end
