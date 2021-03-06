if [ -z "$CONTRACT_DEMO_HOME" ]; then
  echo "Error running script: env var CONTRACT_DEMO_HOME is not set"
  echo "Please follow the directions in the README for https://github.com/ciberkleid/contract-demo-setup"
  return
fi

# Use Spring Initializr to create producer app

pushd ${CONTRACT_DEMO_HOME}

curl https://start.spring.io/starter.tgz -d name=simple-producer -d artifactId=simple-producer -d dependencies=web,cloud-contract-verifier -d baseDir=simple-producer -d bootVersion=2.1.7.RELEASE  | tar -xzvf -
echo "" >> simple-producer/.gitignore
echo ".DS_Store" >> simple-producer/.gitignore
echo "# simple-producer" >> simple-producer/README.md


# Use Spring Initializr to create consumer app

curl https://start.spring.io/starter.tgz -d name=simple-consumer -d artifactId=simple-consumer -d dependencies=web,cloud-contract-stub-runner -d baseDir=simple-consumer -d bootVersion=2.1.7.RELEASE | tar -xzvf -
echo "" >> simple-consumer/.gitignore
echo ".DS_Store" >> simple-consumer/.gitignore
echo "# simple-consumer" >> simple-consumer/README.md

popd
