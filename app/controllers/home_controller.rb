class HomeController < ApplicationController
  def index
    @data = <<EOF
    <pre class="lang-cpp prettyprint-override">    
~~~ cpp
#include <fstream.h>

int main (int argc, char *argv[]) {
return(0);
}
~~~
    </pre>
EOF
  end

  def options
    render text: {"Result" => "Worked"}.to_json
  end
end
