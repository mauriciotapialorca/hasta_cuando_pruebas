require "uri"
require "net/http"
require "json"

def request(url)
  url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=K6j0PyEOPtrGodgBdrx5qr6Detq9L7d7Ffoi02pQ") 

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request["Postman-Token"]= '2178e596-b98d-4395-bfa7-e0ac0e2df059'
    
    response = https.request(request)
    response.read_body
    
    JSON.parse(response.read_body)
    
    
end

auxiliar = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=K6j0PyEOPtrGodgBdrx5qr6Detq9L7d7Ffoi02pQ")

def build_web_page(auxiliar)


info_datos = auxiliar["photos"].map {|llave| llave['img_src']}

nasa = "<!doctype html>/n <html lang ='es-cl'>\n\t <head>\n\t <body>\n\t\t <ul>"

  info_datos.each do|info|
     nasa += "pwd"
     alt= 'Logotipo de HTML5' "width='400' height='453'>"
  end
nasa += "\n\t\t</ul>\n\t<body>\n</html>"
File.write('nasa_web_alumno.html', nasa)

end


build_web_page(auxiliar)

