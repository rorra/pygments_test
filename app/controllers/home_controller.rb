class HomeController < ApplicationController
  def index
    @data = <<EOF
Here is a piece of C++ code that shows some very peculiar performance. For some strange reason, sorting the data miraculously speeds up the code by almost 6x:

<!-- language: lang-cpp -->

    #include <algorithm>
    #include <ctime>
    #include <iostream>

    int main()
    {
        // Generate data
        const unsigned arraySize = 32768;
        int data[arraySize];

        for (unsigned c = 0; c < arraySize; ++c)
            data[c] = std::rand() % 256;

        // !!! With this, the next loop runs faster
        std::sort(data, data + arraySize);

        // Test
        clock_t start = clock();
        long long sum = 0;

        for (unsigned i = 0; i < 100000; ++i)
        {
            // Primary loop
            for (unsigned c = 0; c < arraySize; ++c)
            {
                if (data[c] >= 128)
                    sum += data[c];
            }
        }

        double elapsedTime = static_cast<double>(clock() - start) / CLOCKS_PER_SEC;

        std::cout << elapsedTime << std::endl;
        std::cout << "sum = " << sum << std::endl;
    }

 - Without `std::sort(data, data + arraySize);`, the code runs in **11.54** seconds.
 - With the sorted data, the code runs in **1.93** seconds.

----------

Initially I thought this might be just a language or compiler anomaly. So I tried it in Java:

<!-- language: lang-java -->

    import java.util.Arrays;
    import java.util.Random;

    public class Main
    {
        public static void main(String[] args)
        {
            // Generate data
            int arraySize = 32768;
            int data[] = new int[arraySize];

            Random rnd = new Random(0);
            for (int c = 0; c < arraySize; ++c)
                data[c] = rnd.nextInt() % 256;

            // !!! With this, the next loop runs faster
            Arrays.sort(data);

            // Test
            long start = System.nanoTime();
            long sum = 0;

            for (int i = 0; i < 100000; ++i)
            {
                // Primary loop
                for (int c = 0; c < arraySize; ++c)
                {
                    if (data[c] >= 128)
                        sum += data[c];
                }
            }

            System.out.println((System.nanoTime() - start) / 1000000000.0);
            System.out.println("sum = " + sum);
        }
    }

with a similar but less extreme result.

----------

My first thought was that sorting brings the data into cache, but my next thought was how silly that is because the array was just generated.

What is going on? Why is a sorted array faster than an unsorted array? The code is summing up some independent terms, the order should not matter.

EOF
  end

  def options
    render text: {"Result" => "Worked"}.to_json
  end
end
