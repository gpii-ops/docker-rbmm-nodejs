# docker-rbmm-nodejs

[RuleBased MatchMaker](https://github.com/NickKaklanis/RuleBased_MatchMaker) Docker container


	docker run -d -name rbmm-java inclusivedesign/rbmm-java
	docker run -d -name rbmm-nodejs -l rbmm-java:rbmm-java -p 8078:8078 inclusivedesign/rbmm-nodejs