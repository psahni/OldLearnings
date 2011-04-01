create_table "actors", :force => true do |t|
t.string "address"
t.string "city"
t.string "fiscal_id_number"
t.integer "natural_person_id"
t.integer "company_id"
t.integer "non_profit_organization_id"
t.datetime "created_at"
t.datetime "updated_at"
end

create_table "natural_people", :force => true do |t|
t.string "first_name"
t.string "last_name"
t.date "date_of_birth"
t.datetime "created_at"
t.datetime "updated_at"
end


class Actor < ActiveRecord::Base
  belongs_to :company
  belongs_to :natural_person
  belongs_to :non_profit_organization
end

class NaturalPerson < Actor
  set_table_name :natural_people
  has_one :actor, :autosave => true
  accepts_nested_attributes_for :actor
  # default_scope with select option, allow to get all the desired attributes
  # in collections of instances of the current model
  # otherwise it does not work in pages as "listing natural people"
  default_scope :include => [:actor],
  :joins => :actor,
  :select => "natural_people.*, actors.address, actors.city, actors.fiscal_id_number"

  # redefining the initialize method to get the superobject attributes in the
  # current object attributes
  def initialize
  super

  if self.actor.nil? or self.new_record?
    self.build_actor
  end

  actor_attribute_names = actor.attribute_names.delete_if{|attribute_name, attribute_value| attribute_name == "id"}

  actor_attribute_names.each do |attribute_name|
    set_value_for_attribute = "#{attribute_name}="

    # adds the attributes readers from the superobject:
    # for each attribute name of the superobject (exept the id attribute)
    # the current object will have an attribute accessor with the same name,
    # which will return the value of the attribute of associated superobject
    self.class_eval do
      define_method attribute_name.to_sym do
      self.actor.attributes[attribute_name]
      end
    end # class_eval

    # the same as above, but done for the "setter" methods:
    # the current object could call the associated superobject's method to
    # set the value in the corresponding column of the superobject table
    self.class_eval do
      define_method set_value_for_attribute.to_sym do |given_value|
      self.actor.attributes = {attribute_name.to_sym => given_value}
      end
    end # class_eval

    end # each
  end # initialize

  # redefines attributes method (read) merging with superclass attributes
  # superclass attributes have priority
  def attributes
    actor_attributes = self.actor.attributes.delete_if{|attribute_name, attribute_value| attribute_name == "id"}
    actor_attributes.merge!(super)
  end

  # redefines attributes= method (write) merging with superclass attributes
  # superclass attributes still have priority
  def new_actor_attributes(new_attributes)
    new_actor_attributes = {}
    new_attributes.each do |new_attribute_name, new_attribute_value|
    if self.actor.has_attribute?(new_attribute_name) and not new_attribute_name == "id"
      new_actor_attributes[new_attribute_name] = new_attribute_value
      end
    end
    return new_actor_attributes
  end

  def new_natural_person_attributes(new_attributes)
    new_natural_person_attributes = new_attributes.delete_if do |new_attribute_name, new_attribute_value|
      self.actor.has_attribute?(new_attribute_name) and not new_attribute_name == "id"
    end
  end

  def attributes=(new_attributes)
    self.actor_attributes = new_actor_attributes(new_attributes)
    super(new_natural_person_attributes(new_attributes))
  end
end 
