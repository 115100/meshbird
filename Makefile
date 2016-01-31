TARGET=meshbird

all: clean build

clean:
	rm -rf $(TARGET)

depends:
	go get -u -v

build:
	go build -v -ldflags="-X main.Version=`cat VERSION`" -o $(TARGET) *.go

fmt:
	go fmt *.go

xc:
	go get github.com/laher/goxc
	goxc -d dist -os="linux,darwin" -include 'LICENSE,VERSION' -pv `cat VERSION` -build-ldflags="-X main.Version=`cat VERSION`" xc copy-resources archive-tar-gz deb downloads-page
