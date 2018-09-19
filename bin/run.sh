#ETA_VERSION=0.8.6.2
ETA_VERSION=$(etlas exec eta -- --version | cut -d, -f2 | cut -d\  -f3 | sed s/b/./g)

etlas build --enable-test --enable-uberjar-mode && java -Xss1024M -Xmx4096M -jar dist/build/eta-${ETA_VERSION}/eta-aoc-0.1.0.0/t/eta-aoc-test/build/eta-aoc-test/eta-aoc-test.jar && java -Xss1024M -Xmx4096M -jar dist/build/eta-${ETA_VERSION}/eta-aoc-0.1.0.0/x/eta-aoc-exe/build/eta-aoc-exe/eta-aoc-exe.jar
