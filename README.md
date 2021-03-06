## Rule Based MatchMaker (Node.js) Dockerfile


This repository is used to build [RuleBased MatchMaker](https://github.com/NickKaklanis/RuleBased_MatchMaker) Docker images.


### Environment Variables

The following environment variables can be used to affect the container's behaviour:

* `NODE_ENV` - this should most likely be set to `production` unless you would like to test more customized deployments

* `RBMM_JAVA_HOST_ADDRESS` - this is the host address to [RuleBased MatchMaker (Web service)](https://github.com/NickKaklanis/RuleBasedMatchMaker_RESTful_WS_Maven). By default this variable points to `rbmm-java:8080`.


### Port(s) Exposed

* `8078 TCP`


### Base Docker Image

* [inclusivedesign/nodejs](https://github.com/idi-ops/docker-nodejs/)


### Download

    docker pull gpii/rbmm-nodejs


#### Run `rbmm-nodejs` (RuleBased MatchMaker NodeJS)

This example assumes that [rbmm-java](https://github.com/gpii-ops/docker-rbmm-java) container is running and is accessible using a link connection:

```
docker run \
-d \
-p 8078:8078 \
--name="rbmm-nodejs" \
--link rbmm-java:rbmm-java \
-e NODE_ENV=production \
-e RBMM_JAVA_HOST_ADDRESS=rbmm-java:8080 \
gpii/rbmm-nodejs
```


### Build your own image

    git clone https://github.com/NickKaklanis/RuleBased_MatchMaker.git

    docker build --rm=true -t <your name>/rbmm-nodejs:$(git --git-dir=RuleBased_MatchMaker/.git --work-tree=RuleBased_MatchMaker rev-parse --short HEAD) .
