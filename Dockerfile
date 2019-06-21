FROM node:lts
USER node

ARG node_grunt_tag=v1.2.0
ARG starter_kit=@pattern-lab/starterkit-mustache-demo

RUN cd /home/node \
  && git clone --depth 1 -b $node_grunt_tag https://github.com/pattern-lab/edition-node-grunt pattern-lab \
  && cd pattern-lab \
  && npm install \
  && npm install $starter_kit \
  && npx grunt patternlab:loadstarterkit --kit=$starter_kit

WORKDIR /home/node/pattern-lab

CMD ["npx", "grunt", "patternlab:serve"]
