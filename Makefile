BUILD="./templates/build"
FILES="semestre-5/*.tex"
FLAGS="--no-print-logs"

default: pdf

submodules:
	@git submodule update --init
	@ln -s ../templates/clovisai.sty semestre-5/clovisai.sty 2>/dev/null || true
	@ln -s ../templates/clovisai-constructs.sty semestre-5/clovisai-constructs.sty 2>/dev/null || true

pdf: submodules dep
	@$(BUILD) $(FLAGS) PDF $(FILES)

html: submodules dep
	@$(BUILD) $(FLAGS) HTML $(FILES)

clean: submodules dep
	@$(BUILD) $(FLAGS) CLEAN $(FILES)

hardclean: submodules dep
	@$(BUILD) $(FLAGS) HARDCLEAN $(FILES)

dep: submodules
	@$(BUILD) $(FLAGS) DEP

docker-start:
	sudo systemctl start docker

docker: docker-start
	sudo docker build .

test-ci: docker-start
	sudo gitlab-runner exec docker pdf
