class Image

  def initialize(array)
    @array = array
    @row_length = array.length
    @col_length = array[0].length
  end 

  def output_image
    @array.each do |row|
      row.each do |pixel|
        print pixel, ' '
      end 
      puts    
    end 
  end 

  def blur(row_index, col_index)
    @array[row_index -1][col_index] = 1 unless row_index == 0
    @array[row_index +1][col_index] = 1 unless row_index >= @row_length-1
    @array[row_index][col_index -1] = 1 unless col_index == 0
    @array[row_index][col_index +1] = 1 unless col_index >= @col_length-1
  end

  def find_ones
    one_pixel = []

    @array.each_with_index do |row_array, row_index|
        row_array.each_with_index do |cell, col_index|
        if cell == 1
          one_pixel << [row_index, col_index]
        end
      end
    end    
    one_pixel  
  end


  def transform
    array_coords = find_ones

    array_coords.each do |x, y|
      blur(x, y)
    end  
  end
end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image
puts "----"
image.transform
image.output_image