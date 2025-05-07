lintcue:
	@echo "  >  Linting CUE schema ..."
	@cue eval schema.cue --all-errors --verbose

lintyml:
	@echo "  >  Linting YAML files ..."
	@echo "  >  Linting .github/security-insights.yml ..."
	@cue vet .github/security-insights.yml schema.cue
	@echo "  >  Linting template-full.yml ..."
	cue vet template-full.yml schema.cue
	@echo "  >  Linting template-minimum.yml ..."
	cue vet template-minimum.yml schema.cue
	@echo "  >  Linting template-multi-repository-project-reuse.yml ..."
	cue vet template-multi-repository-project-reuse.yml schema.cue
	@echo "  >  Linting template-multi-repository-project.yml ..."
	cue vet template-multi-repository-project.yml schema.cue

cuegen:
	@echo "  >  Generating types from cue schema ..."
	@cue exp gengotypes schema.cue
	@echo "  >  vet the generated go types ..."
	@go vet cue_types_gen.go

PHONY: lintcue lintyml cuegen