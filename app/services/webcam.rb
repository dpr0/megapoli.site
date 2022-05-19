class Webcam
  def call(_env)
    # height = 37
    # <style type='text/css'>#{style}</style>
    # { Common.links(height) }
    # <br>
    # <iframe height='200' width='350' src='https://open.ivideon.com/embed/v2/?server=100-7efd5afe1a615bb96f00b61e64e5a8ac&camera=65536'></iframe>
    # <iframe height='200' width='350' src='https://open.ivideon.com/embed/v2/?server=100-dBSwFS3qtcA76cprE3lbPz&camera=524288'></iframe>
    # <iframe height='200' width='350' src='https://rtsp.me/embed/dz3RTS64/'></iframe>
    # <script>#{}</script>
    # style = ".krsz_items {display: block; width: 200px; height: #{height}px; position: fixed; left: 10px; z-index: 99999;}
    #        body {background-color: black;}"
    video = "
      <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css' integrity='sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh' crossorigin='anonymous'>
      <style type='text/css'>body {background-color: black;}</style>
      <div class='container'>
        <div class='content'>
          <iframe height='450' width='800' src='https://rtsp.me/embed/B8FiBadk/'></iframe>
          <iframe height='450' width='800' src='https://rtsp.me/embed/NwYjsHoc/'></iframe>
        </div>
      </div>
    "
    [200, { 'Content-Type' => 'text/html' }, [video]]
  end
end
