# Makefile para FisioManager - Documentacion

MAIN     = main
PDF      = $(MAIN).pdf
TEX_FILES = $(MAIN).tex $(wildcard capitulos/*.tex)
FIGURAS  = $(wildcard figuras/*.png)

# --- Diagramas PlantUML ---
PUML_SRC   = $(wildcard puml/*.puml)
# Los .png se generan en figuras/ con el nombre indicado por @startuml.
# Se usa un "stamp" para detectar cuando hay que regenerarlos.
DIAG_STAMP = figuras/.diagrams.stamp

.PHONY: all clean distclean view quick diagrams help

all: $(PDF)

# Regeneracion de diagramas: se rehace cuando cambia algun .puml
# (o cuando el stamp no existe, p.ej. tras un 'make distclean').
$(DIAG_STAMP): $(PUML_SRC)
	@echo ">> Regenerando diagramas PlantUML..."
	@if command -v plantuml >/dev/null 2>&1; then \
		plantuml -tpng -o "$(CURDIR)/figuras" $(PUML_SRC); \
		echo ">> Diagramas generados en figuras/"; \
	else \
		echo "!! plantuml no esta instalado: se omite la regeneracion de diagramas"; \
	fi
	@touch $(DIAG_STAMP)

# Target manual para forzar la regeneracion de diagramas
diagrams:
	@rm -f $(DIAG_STAMP)
	@$(MAKE) --no-print-directory $(DIAG_STAMP)

# Compilacion del PDF. Depende de los diagramas: si falta el stamp
# (tras distclean) o cambio un .puml, primero se regeneran los UML.
$(PDF): $(DIAG_STAMP) $(TEX_FILES) $(FIGURAS)
	@echo ">> Compilando $(MAIN).tex..."
	@if command -v latexmk >/dev/null 2>&1; then \
		latexmk -pdf -interaction=nonstopmode -halt-on-error $(MAIN).tex; \
	else \
		pdflatex -interaction=nonstopmode -halt-on-error $(MAIN).tex && \
		pdflatex -interaction=nonstopmode -halt-on-error $(MAIN).tex && \
		pdflatex -interaction=nonstopmode -halt-on-error $(MAIN).tex; \
	fi
	@echo ">> Generado: $(PDF)"

# Compilacion rapida (una sola pasada, sin regenerar diagramas)
quick:
	pdflatex -interaction=nonstopmode $(MAIN).tex

# Visualizar el PDF (requiere xdg-open o equivalente)
view: $(PDF)
	@xdg-open $(PDF) 2>/dev/null || open $(PDF) 2>/dev/null || \
		echo "Abre manualmente: $(PDF)"

# Limpiar archivos temporales
clean:
	@echo ">> Limpiando archivos temporales..."
	@rm -f $(MAIN).aux $(MAIN).log $(MAIN).toc $(MAIN).out \
	       $(MAIN).fls $(MAIN).fdb_latexmk $(MAIN).synctex.gz \
	       $(MAIN).lof $(MAIN).lot
	@rm -f capitulos/*.aux

# Limpiar todo: PDF + diagramas generados.
# Al borrar el stamp y los .png, la siguiente compilacion regenera los UML.
distclean: clean
	@echo ">> Borrando PDF y diagramas generados (se recrearan al recompilar)..."
	@rm -f $(PDF)
	@rm -f $(DIAG_STAMP)
	@cd puml && for f in *.puml; do \
		name=$$(grep -m1 '@startuml' "$$f" | awk '{print $$2}'); \
		[ -n "$$name" ] && rm -f "../figuras/$$name.png"; \
	done

help:
	@echo "Targets disponibles:"
	@echo "  make           - Regenera los diagramas (si hace falta) y compila el PDF"
	@echo "  make quick     - Compilacion rapida (una pasada, sin diagramas)"
	@echo "  make view      - Compila y abre el PDF"
	@echo "  make diagrams  - Fuerza la regeneracion de los .png de los diagramas"
	@echo "  make clean     - Borra archivos temporales de LaTeX"
	@echo "  make distclean - Borra el PDF y los diagramas (se recrean al recompilar)"
	@echo "  make help      - Ayuda"
