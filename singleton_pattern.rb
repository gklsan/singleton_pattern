require 'singleton'
require 'pry'

class SingletonPattern
  include Singleton
  attr_accessor :file_type, :content

  def _dump(depth)
    puts "Dumping the file content...."
    Marshal.dump(@content, depth)
  end

  def self._load(str)
    puts "Loading the dumped content...."
    instance.content = Marshal.load(str)
    instance
  end

  def read_file(file_type)
    puts "Reading #{file_type} file...."
    @content = File.read("test.#{file_type}")
  end
end

boro = Boro.instance

# Process JSON data
boro.read_file('json')
stored_state = Marshal.dump(boro)
boro_json = Marshal.load(stored_state)
puts boro_json.content

# Process XML
boro_json.read_file('xml')
stored_state = Marshal.dump(boro)
boro_xml = Marshal.load(stored_state)
puts boro_xml.content


# Process XML
boro_xml.read_file('yml')
stored_state = Marshal.dump(boro)
boro_yml = Marshal.load(stored_state)
puts boro_yml.content

