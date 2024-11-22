publish-streaming-artifacts:
	rm -rf streaming-artifacts
	mkdir -p streaming-artifacts
	mvn clean package -DskipTests
	cp ./statefun-flink/statefun-flink-datastream/target/original-statefun-flink-datastream-3.5-ccc-flink19-2.jar ./streaming-artifacts
	cp ./statefun-flink/statefun-flink-distribution/target/statefun-flink-distribution-3.5-ccc-flink19-2.jar ./streaming-artifacts
	git add -f streaming-artifacts/*
	git commit -a -m "rebuilt and published streaming artifacts"
	git push
