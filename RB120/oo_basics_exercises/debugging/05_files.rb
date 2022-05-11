# The use of self.class::FORMAT on line 21 allows us to access the CONSTANTS
# that are set in each file type.

# We could also define specific #format reader methods to return the file
# format values.

# We could also set local instance variables (this was my initial approach,
# changing CONSTANT assignments to initialization methods that extended the 
# File superclass' initialization method with a specific @instance definition
# for each file type) however the use of an instance variable to solve this 
# problem would not alert a programmer that these values are meant to be fixed.
# The use of CONSTANTS communicates this intention of the design.

class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post