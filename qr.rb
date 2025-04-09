require "rqrcode"

#Use the RQRCode::QRCode class to encode some text by getting user input

puts "What kind of QR code would you like to generate?"
puts
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts
puts "Press 4 to exit"
puts

print ">"
choice = gets.chomp.downcase.strip

if choice == "1"
  # Open a URL
  puts "What is the URL you would like to encode?"
  puts
  url = gets.chomp.strip.downcase
  puts
  qrcode = RQRCode::QRCode.new("#{url}")

  puts "What would you like to call the PNG"
  puts
  name = gets.chomp.strip.downcase

  # Use the .as_png method to create a 500 pixels by 500 pixels image
  png = qrcode.as_png({ :size => 500 })

  # Write the image data to a file
  IO.binwrite("#{name}.png", png.to_s)
elsif choice == "2"
  # Join a wifi network
  puts "What is the name of the wifi network?"
  puts
  ssid = gets.chomp
  puts
  puts "What is the password?"
  puts
  password = gets.chomp
  puts
  puts "What would you like to call the PNG?"
  puts
  name = gets.chomp.strip.capitalize

  # Format Wi-Fi QR string
  wifi_string = "WIFI:T:WPA;S:#{ssid};P:#{password};;"

  #Use the RQRCode::QRCode class to encode some text
  qrcode = RQRCode::QRCode.new(wifi_string)

  # Use the .as_png method to create a 500 pixels by 500 pixels image
  png = qrcode.as_png({ :size => 500 })

  # Write the image data to a file
  IO.binwrite("#{name}.png", png.to_s)
elsif choice == "3"
  # Send a text message
  puts "What is the phone number you want the code to send a text message to?"
  puts
  number = gets.chomp.strip
  puts
  puts "What do you want to populate the message with?"
  puts
  message = gets.chomp.capitalize
  puts
  puts "What would you like to call the PNG?"
  puts
  name = gets.chomp.strip.capitalize
  
  # Format text QR string
  text_string = "SMSTO:#{number}:#{message}"

  #Use the RQRCode::QRCode class to encode some text
  qrcode = RQRCode::QRCode.new(text_string)

  # Use the .as_png method to create a 500 pixels by 500 pixels image
  png = qrcode.as_png({ :size => 500 })

  # Write the image data to a file
  IO.binwrite("#{name}.png", png.to_s)
elsif choice == "4"
  puts "Goodbye!"
  puts
else
  puts "Didn't recognize that selection. Please try again."
end
