#!/usr/bin/ruby

require 'fileutils'
require 'mini_magick'
include FileUtils
include MiniMagick


module ImageProcess

  def ImageProcess.reduce(options)
    @image_repository = options[:image_repository] || "_img"
    @image_directory = options[:image_directory] || "img"
    @width = options[:width] || "200"
    if !(options[:height].nil?)
      @height = options[:height]
    end
    self.resize_all()
  end
  
  def self.put_name(i)
     puts i
  end
  def self.resize_and_crop(image, width, height)       
    
    single_ratio = height / ((width - height)/2)

    if image[:width] < image[:height]   
      remove = ((image[:height] - image[:width])/2).round 
      image.shave("0x#{remove}") 
    elsif image[:width] > image[:height]
      remove = ((image[:width] - image[:height])/2).round
      image.shave("#{remove}x0")
    end
    image.resize("#{width}x#{height}")
    return image
  end
  def self.resize_width(image, width)
    image.resize("#{width}x")
    return image
  end
  def self.resize(file)
    image = MiniMagick::Image.open(file)
    name = File.basename(file)
    newfilename = "" + @image_directory + @width + "_" + name
    if !(defined?(@height).nil?)
      image = resize_and_crop(image, @width, @height)
    else
      image = self.resize_width(image, @width)
    end
    image.write newfilename
  end
  def self.resize_all()
    Dir.glob(@image_repository+"/*") do |img_file|
      if (img_file != "." && img_file != "..") then
        abspath = File.expand_path(img_file)
        self.put_name(abspath)
        self.resize(abspath)
      end
    end
    puts "Complete"
  end
end