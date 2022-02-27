#!/bin/sh

oses="linux windows darwin openbsd freebsd"

for os in $oses
do
	arches=`go tool dist list | grep $os | sed -e 's/.*\///g'`

	for arch in $arches
	do
		echo "${os} ${arch}"
		env GOOS=$os GOARCH=$arch go build -ldflags "-s -w" -o "builds/${os}_${arch}"
	done
done
