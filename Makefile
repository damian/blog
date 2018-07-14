HUGO := hugo

start:
	$(HUGO) server --disableFastRender --buildDrafts --buildFuture
