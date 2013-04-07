class HomeController < ApplicationController
  def index
    @data = <<EOF
~~~ cpp
#include <fstream.h>

int main (int argc, char *argv[]) {
return(0);
}
~~~
EOF
  end

  def options
    render text: {"Result" => "Worked"}.to_json
  end
end
