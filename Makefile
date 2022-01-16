.PHONY: all
all: clean godoc api-reference

.PHONY: godoc
godoc-master:
	mkdir -p out/godoc
	docker run -v $(shell pwd)/out/godoc:/playground/out ghcr.io/strrl/chaos-mesh.dev-godoc:latest master

.PHONY: api-reference
api-reference:

.PHONY: clean
clean:
	rm -rf out


.PHONY: image
image: image-godoc image-reference

.PHONY: image-godoc
image-godoc: 
	docker build -t ghcr.io/strrl/chaos-mesh.dev-godoc:latest ./image/chaos-mesh.dev-godoc

.PHONY: image-reference
image-reference: 
	docker build -t ghcr.io/strrl/chaos-mesh.dev-reference:latest ./image/chaos-mesh.dev-reference