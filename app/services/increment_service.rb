# Plain Old Ruby Objects (PORO) that are designed to execute one single action
# in your domain logic and do it well

class IncrementService
  # @param [Post] resource
  def initialize(resource)
    @resource = resource
  end

  def call
    increment_views
  end

  private

  def increment_views
    @resource.increment!(:views)
  end
end

