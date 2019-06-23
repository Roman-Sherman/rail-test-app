module MasterService
  class FindAllCategory < ApplicationService
    def initialize()
    end

    def call
      getCategories()
    end

    private
    def getCategories
      @categories ||= Category.all
    end
  end
end
