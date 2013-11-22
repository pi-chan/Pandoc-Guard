class F
  attr_reader :name, :path, :level
  def initialize(name, level=0)
    @name = File.basename(name)
    @path = File.expand_path(name)
    @level = level
  end
 
  def to_s
    "F: #{name}"
  end
end
 
class D < F
  attr_reader :entries
  def initialize(name, filter=nil, level=0, depth=Float::MAX.to_i)
    super(name, level)
    @entries = []
    @filter = filter
    build(depth) if depth >= 1
    self
  end
 
  def <<(file)
    @entries << file
  end
 
  def each(&blk)
    entries.each do |e|
      blk.call(e)
      e.each(&blk) if e.is_a?(D)
    end
  end
 
  def to_s
    "D: #{name} => [#{entries.join(', ')}]"
  end
  
  private
  def build(depth)
    entries = Dir[File.join(path, '*')]
    entries.each do |ent|
      if @filter and File.file?(ent)
        next if not ent.match(Regexp.new("#{@filter}"))
      end
      
      self << begin
        File.directory?(ent) ? D.new(ent, @filter, level+1, depth-1) : F.new(ent, level+1)
      end
    end
  end
end
