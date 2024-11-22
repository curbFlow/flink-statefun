This is a flink-stateful fork to build jars for streaming app using Flink 1.19, which is not officially supported by Flink project itself.

```shell
make publish-streaming-artifacts
```

The above command will build the jars needed for streaming, commit and push to this repo.
Streaming repo should reference the jars directly from GitHub.
