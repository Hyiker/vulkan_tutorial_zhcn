.PHONY: deploy

init:
	git worktree remove -f /tmp/vulkan_tutorial
	git worktree add -f /tmp/vulkan_tutorial gh-pages

deploy: init
	@echo "====> deploying to github"
	mdbook build
	rm -rf /tmp/vulkan_tutorial/*
	cp -rp book/* /tmp/vulkan_tutorial/
	cd /tmp/vulkan_tutorial && \
		git add -A && \
		git commit -m "deployed on $(shell date) by ${USER}" && \
		git push origin gh-pages