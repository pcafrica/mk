DOCKER?=docker
LABEL=mattiapenati/mk

.PHONY: all clean empty
all: empty

clean:
	$(DOCKER) rmi -f $(LABEL):empty

empty:
	[[ -n "$$(docker images $(LABEL):$@ -q)" ]] || \
		$(DOCKER) build -t $(LABEL):$@ empty


.PHONY: toolchain--gcc-glibc-7 base--gcc-glibc-7 libs--gcc-glibc-7
toolchain--gcc-glibc-7: empty
	[[ -n "$$(docker images $(LABEL):$@ -q)" ]] || \
		$(DOCKER) build -t $(LABEL):$@ toolchain/gcc-glibc-7

base--gcc-glibc-7: toolchain--gcc-glibc-7
	[[ -n "$$(docker images $(LABEL):$@ -q)" ]] || \
		$(DOCKER) build -t $(LABEL):$@ base/gcc-glibc-7

libs--gcc-glibc-7: base--gcc-glibc-7
	[[ -n "$$(docker images $(LABEL):$@ -q)" ]] || \
		$(DOCKER) build -t $(LABEL):$@ libs/gcc-glibc-7


.PHONY: toolchain--gcc-glibc-6 base--gcc-glibc-6 libs--gcc-glibc-6
toolchain--gcc-glibc-6: empty
	[[ -n "$$(docker images $(LABEL):$@ -q)" ]] || \
		$(DOCKER) build -t $(LABEL):$@ toolchain/gcc-glibc-6

base--gcc-glibc-6: toolchain--gcc-glibc-6
	[[ -n "$$(docker images $(LABEL):$@ -q)" ]] || \
		$(DOCKER) build -t $(LABEL):$@ base/gcc-glibc-6

libs--gcc-glibc-6: base--gcc-glibc-6
	[[ -n "$$(docker images $(LABEL):$@ -q)" ]] || \
		$(DOCKER) build -t $(LABEL):$@ libs/gcc-glibc-6


.PHONY: toolchain--gcc-glibc-5 base--gcc-glibc-5 libs--gcc-glibc-5
toolchain--gcc-glibc-5: empty
	[[ -n "$$(docker images $(LABEL):$@ -q)" ]] || \
		$(DOCKER) build -t $(LABEL):$@ toolchain/gcc-glibc-5

base--gcc-glibc-5: toolchain--gcc-glibc-5
	[[ -n "$$(docker images $(LABEL):$@ -q)" ]] || \
		$(DOCKER) build -t $(LABEL):$@ base/gcc-glibc-5

libs--gcc-glibc-5: base--gcc-glibc-5
	[[ -n "$$(docker images $(LABEL):$@ -q)" ]] || \
		$(DOCKER) build -t $(LABEL):$@ libs/gcc-glibc-5
