# -*- coding: utf-8 -*-

# Getting thumbnails from Macromedia Flashed (not only video, but games and banners).
#
# Requirements:
#
# 1. gem 'ruby-imagespec"
# 2. Gnash flash media player (http://www.gnu.org/s/gnash/)
#
# Install using this instruction: http://techblog.floorplanner.com/2010/11/02/server-side-rendering-of-swf-images-using-gnash/
#
# wget http://ftp.gnu.org/pub/gnu/gnash/0.8.8/gnash-0.8.8.tar.gz
# ./configure --enable-gui=dump --enable-renderer=agg
# make
# sudo make install
#
#
# Author: Danil Pismenny (danil@pismenny.ru)
#
# htp://github.com/dapi/
#

require 'image_spec'

module Paperclip
  
  class Geometry

    class << self

      alias_method :from_file_by_identify, :from_file
      
      def from_file file
        file = file.path if file.respond_to? "path"
        g = ImageSpec.new(file)
        Geometry.new(g.width, g.height) || from_file_by_identify
      end
    end
    
  end
  
  class FlashThumbnail < Thumbnail
    attr_accessor :screenshot
    
    def initialize(file, options = {}, attachment = nil)
      super
      @screenshot = options[:screenshot].to_i || 5
    end

    def make
      @file = flash_make
      super
    end

    def flash_make
      dst = Tempfile.new([@basename, @format ? "-image.#{@format}" : '-image'])
      dst.binmode
      
      dst_filename = File.expand_path(dst.path)
      src_filename = File.expand_path(file.path)

      # TODO
      # Some flashes playes with wrong geometry. Try to recrop image after gnash
      # ; convert -crop 160x600+89-0 1.png 2.png
      #  --width 160 --height 600
      
      max_advances = screenshot + 1
      gnash_cmd = "-1 -r agg --render-mode 1 --screenshot #{screenshot} --max-advances #{max_advances} --screenshot-file #{dst_filename} #{src_filename}"
      # convert_cmd = %Q[-resize "#{@geometry}" #{flash_dst_filename} #{dst_filename}]
      begin
        success = Paperclip.run('gnash', gnash_cmd)
        # if @geometry
        #   success = Paperclip.run('convert', convert_cmd)
        #   destination = dst
        # end
      rescue PaperclipCommandLineError
        raise PaperclipError, "There was an error processing the flash-thumbnail for #{@basename}" if whiny
      end
      dst
    end
      
  end
end
