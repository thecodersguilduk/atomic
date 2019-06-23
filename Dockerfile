FROM node:lts
USER node

ARG repo=https://github.com/FabbDev/edition-node-gulp
ARG tag=v1.5.0
ARG starter_kit=@pattern-lab/starterkit-mustache-demo

RUN cd /home/node \
  && git clone --depth 1 -b $tag $repo pattern-lab \
  && cd pattern-lab \
  && npm install \
  && npm install $starter_kit \
  && npx gulp patternlab:loadstarterkit --kit=$starter_kit

WORKDIR /home/node/pattern-lab

CMD ["npx", "gulp", "patternlab:serve"]
