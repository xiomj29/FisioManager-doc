LATEXMK = latexmk -pdf -interaction=nonstopmode -halt-on-error

REQ_DIR = Requerimientos
ANA_DIR = ModAnalisis
DIS_DIR = ModDiseño
NAR_DIR = narrativa

PUML_SRC   = $(wildcard $(ANA_DIR)/puml/*.puml)
DIAG_STAMP = $(ANA_DIR)/figuras/.diagrams.stamp

NARR_PDF = narrativaEq\#4.pdf

.PHONY: all clean distclean diagrams help requerimientos analisis diseno narrativa

all: requerimientos analisis diseno narrativa

$(DIAG_STAMP): $(PUML_SRC)
	@if command -v plantuml >/dev/null 2>&1; then \
		plantuml -tpng -o "$(CURDIR)/$(ANA_DIR)/figuras" $(PUML_SRC); \
		echo ">> Diagramas generados en $(ANA_DIR)/figuras/"; \
	else \
		echo "!! plantuml no esta instalado: se omite la regeneracion de diagramas"; \
	fi
	@touch $(DIAG_STAMP)

diagrams:
	@rm -f $(DIAG_STAMP)
	@$(MAKE) --no-print-directory $(DIAG_STAMP)

requerimientos:
	@echo ">> Compilando Requerimientos..."
	cd $(REQ_DIR) && $(LATEXMK) Requerimientos.tex

analisis: $(DIAG_STAMP)
	@echo ">> Compilando Modelo de Analisis..."
	cd $(ANA_DIR) && $(LATEXMK) ModAnalisis.tex

diseno: $(DIAG_STAMP)
	@echo ">> Compilando Modelo de Diseno..."
	cd $(DIS_DIR) && $(LATEXMK) ModDiseno.tex

narrativa:
	@echo ">> Compilando Narrativa..."
	cd $(NAR_DIR) && $(LATEXMK) narrativa.tex
	@cp $(NAR_DIR)/narrativa.pdf "$(NARR_PDF)"
	@echo ">> Generado: $(NARR_PDF)"

clean:
	@echo ">> Limpiando archivos temporales..."
	-cd $(REQ_DIR) && $(LATEXMK) -c Requerimientos.tex
	-cd $(ANA_DIR) && $(LATEXMK) -c ModAnalisis.tex
	-cd $(DIS_DIR) && $(LATEXMK) -c ModDiseno.tex
	-cd $(NAR_DIR) && $(LATEXMK) -c narrativa.tex

distclean:
	@echo ">> Borrando PDFs y diagramas generados..."
	-cd $(REQ_DIR) && $(LATEXMK) -C Requerimientos.tex
	-cd $(ANA_DIR) && $(LATEXMK) -C ModAnalisis.tex
	-cd $(DIS_DIR) && $(LATEXMK) -C ModDiseno.tex
	-cd $(NAR_DIR) && $(LATEXMK) -C narrativa.tex
	@rm -f "$(NARR_PDF)"
	@rm -f $(DIAG_STAMP)
	@cd $(ANA_DIR)/puml && for f in *.puml; do \
		name=$$(grep -m1 '@startuml' "$$f" | awk '{print $$2}'); \
		[ -n "$$name" ] && rm -f "../figuras/$$name.png"; \
	done

help:
	@echo "Targets disponibles:"
	@echo "  make                - Compila los cuatro artefactos (Requerimientos, Analisis, Diseno, Narrativa)"
	@echo "  make requerimientos - Compila solo Requerimientos.pdf"
	@echo "  make analisis       - Compila solo ModAnalisis.pdf"
	@echo "  make diseno         - Compila solo ModDiseno.pdf"
	@echo "  make narrativa      - Compila la narrativa y genera narrativaEq#4.pdf"
	@echo "  make diagrams       - Fuerza la regeneracion de los .png desde los .puml"
	@echo "  make clean          - Borra archivos temporales de LaTeX"
	@echo "  make distclean      - Borra PDFs y diagramas generados"
	@echo "  make help           - Ayuda"
