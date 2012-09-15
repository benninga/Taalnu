
class Browse
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :id, :name, :content, :doc

  def initialize(params = nil)
    @attributes = params
    @id, @name, @content = nil, "", ""
    @doc = nil
    update_attributes(params)
  end

  def update_attributes(params = nil)
    if params == nil
      return
    end

    @name = params["name"]
    @content = params["content"]
    @id = params["_id"] if params["_id"]
    @id = BSON::ObjectId(params["id"]) if params["id"]
    @doc = params

    save
  end

  def save
    col = MongoMapper.database.collection("browses")
    @doc[:name] = @name
    @doc[:content] = @content
    col.update({:_id => @id}, @doc)
  end

  def to_s
    @doc.to_s
  end

  def persisted?
    !@id.nil?
  end

  def self.all
    col = MongoMapper.database.collection("browses")
    all_b = []
    col.find.each do |doc|
      b = Browse.new(doc)
      all_b << b
    end
    all_b
  end
  #
  # Loads on Browse object based on its ID.
  # * *Args*    :
  #   - +id+ -> the string id of the object to load
  # * *Returns* :
  #   - nil if cannot find an object or a Browse object for the given id.
  #
  def self.find(id)
    col = MongoMapper.database.collection("browses")
    row = col.find_one("_id" => BSON::ObjectId("#{id}"))
    Browse.new(row)
  end

end
