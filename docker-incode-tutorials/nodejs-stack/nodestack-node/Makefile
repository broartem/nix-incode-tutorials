install:
    npm install

build:
    docker build -t broartem/nodestack-node .

run:
    node index.js

run-container:
    docker run -d broartem/nodestack-node

test:
    curl localhost

clean:
    rm -rf node_modules


.PHONY: install build run test clean