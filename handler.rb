#!/usr/local/bin/ruby
#
# # docker exec -i -t 9c5c88dc5141 bash

class Container
  attr_accessor :instance_id
  def initialize(image_name)
    build(image_name)
    @instance_id = run(image_name)
  end

  def exec(cmd)
    puts `docker exec #{@instance_id} #{cmd}`
  end

  private
    def build(image_name)
      puts `docker build -t #{image_name} .`
    end

    def run(image_name)
      raw_id = `docker run -d #{image_name} tail -f /dev/null`.tap { |x| puts x }
      raw_id[0..11]
    end
end

c = Container.new("localhost:5000/chebyshev/rails-app")
c.exec("ls")

`docker build -t localhost:5000/chebyshev/ruby-app .`
