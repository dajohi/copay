#!/bin/bash -e

# Build docker image to build copay
docker build . \
	-f ./Dockerfile \
	-t decred/copay
if [ $? != 0 ]; then
	echo 'docker build failed'
	exit 1
fi

echo ""
echo "==================="
echo "  Build complete"
echo "==================="

mkdir docker-build
docker run --rm -v $(pwd)/docker-build:/root/public decred/copay:latest
if [ $? != 0 ]; then
	echo 'docker run failed'
	exit 1
fi

res=$(ls -1 docker-build/* | wc -l)
if [ $res == 0 ]; then
	echo 'no files generated'
	exit 1
fi

# Remove build output dir
rm -rf docker-build
