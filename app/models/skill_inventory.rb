require 'yaml/store'
require 'sequel'

class SkillInventory
  def self.database
    if ENV['RACK_ENV'] == 'test'
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory.sqlite3")
    end
  end

  def self.create_table
    database.create_table :skills do
      primary_key :id
      String      :title
      String      :description
    end
  end

  def self.create(skill)
    @skills = database.from(:skills)
    id = @skills.insert("title" => skill[:title],
                  "description" => skill[:description])
    find(id)
  end

  def self.all
    raw_skills = database.from(:skills).all
    raw_skills.map {|data| Skill.new(data)}
  end


  def self.raw_skill(id)
    raw_skills.find {|skill| skill["id"] == id }
  end

  def self.find(id)
    raw_skill = database.from(:skills).where(id: id).first
    Skill.new(raw_skill)
  end

  def self.update(id, skill)
    database.from(:skills).where(id: id).update(title: skill[:title],
                                          description: skill[:description])
  end

  def self.delete(id)
    database.from(:skills).where(id: id).delete
  end

  def self.delete_all
    dataset.delete
  end

  def self.dataset
    database.from(:skills)
  end
  private_class_method :dataset


end
